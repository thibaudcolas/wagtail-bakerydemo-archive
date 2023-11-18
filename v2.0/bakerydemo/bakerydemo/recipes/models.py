from __future__ import unicode_literals

from django.db import models
from modelcluster.fields import ParentalKey
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, MultiFieldPanel, StreamFieldPanel
from wagtail.core.fields import RichTextField, StreamField
from wagtail.core.models import Page, Orderable
from wagtail.search import index
from wagtail.snippets.edit_handlers import SnippetChooserPanel

from bakerydemo.base.blocks import BaseStreamBlock

from .blocks import RecipeStreamBlock


class RecipePeopleRelationship(Orderable, models.Model):
    """
    This defines the relationship between the `People` within the `base`
    app and the RecipePage below. This allows people to be added to a RecipePage.

    We have created a two way relationship between RecipePage and People using
    the ParentalKey and ForeignKey
    """
    page = ParentalKey(
        'RecipePage', related_name='recipe_person_relationship', on_delete=models.CASCADE
    )
    people = models.ForeignKey(
        'base.People', related_name='person_recipe_relationship', on_delete=models.CASCADE
    )
    panels = [
        SnippetChooserPanel('people')
    ]


class RecipePage(Page):
    """
    Recipe pages are more complex than blog pages, demonstrating more advanced StreamField patterns.
    """

    date_published = models.DateField("Date article published", blank=True, null=True)
    subtitle = models.CharField(blank=True, max_length=255)
    introduction = models.TextField(blank=True, max_length=500)
    backstory = StreamField(
        BaseStreamBlock(),
        blank=True,
        help_text="Use only a minimum number of headings and large blocks.",
    )

    # An example of using rich text for single-line content.
    recipe_headline = RichTextField(
        blank=True,
        max_length=120,
        features=["bold", "italic", "link"],
        help_text="Keep to a single line",
    )
    body = StreamField(
        RecipeStreamBlock(),
        blank=True,
        help_text="The recipe’s step-by-step instructions and any other relevant information.",
    )

    content_panels = Page.content_panels + [
        FieldPanel("date_published"),
        # Using `title` to make a field larger.
        FieldPanel("subtitle", classname="title"),
        MultiFieldPanel(
            [
                FieldPanel("introduction"),
                # StreamField inside a MultiFieldPanel.
                StreamFieldPanel("backstory"),
                FieldPanel("recipe_headline"),
            ],
            heading="Preface",
        ),
        StreamFieldPanel("body"),
        InlinePanel(
            "recipe_person_relationship",
            heading="Authors",
            label="Author",
            help_text="Select between one and three authors",
            panels=None,
            min_num=1,
            max_num=3,
        ),
    ]

    search_fields = Page.search_fields + [
        index.SearchField("backstory"),
        index.SearchField("body"),
    ]

    def authors(self):
        """
        Returns the BlogPage's related people. Again note that we are using
        the ParentalKey's related_name from the BlogPeopleRelationship model
        to access these objects. This allows us to access the People objects
        with a loop on the template. If we tried to access the blog_people_
        relationship directly we'd print `blog.BlogPeopleRelationship.None`
        """
        authors = [
            n.people for n in self.recipe_person_relationship.all()
        ]

        return authors

    # Specifies parent to Recipe as being RecipeIndexPages
    parent_page_types = ["RecipeIndexPage"]

    # Specifies what content types can exist as children of RecipePage.
    # Empty list means that no child content types are allowed.
    subpage_types = []


class RecipeIndexPage(Page):
    """
    Index page for recipe.
    We need to alter the page model's context to return the child page objects,
    the RecipePage objects, so that it works as an index page
    """

    introduction = models.TextField(help_text="Text to describe the page", blank=True)

    content_panels = Page.content_panels + [
        FieldPanel("introduction"),
    ]

    # Specifies that only RecipePage objects can live under this index page
    subpage_types = ["RecipePage"]

    # Defines a method to access the children of the page (e.g. RecipePage
    # objects).
    def children(self):
        return self.get_children().specific().live()

    # Overrides the context to list all child items, that are live, by the
    # date that they were published
    # https://docs.wagtail.org/en/stable/getting_started/tutorial.html#overriding-context
    def get_context(self, request):
        context = super(RecipeIndexPage, self).get_context(request)
        context["recipes"] = (
            RecipePage.objects.descendant_of(self).live().order_by("-date_published")
        )
        return context
