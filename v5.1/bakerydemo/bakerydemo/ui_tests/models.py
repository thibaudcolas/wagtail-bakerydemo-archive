from datetime import datetime

from django import forms
from django.db import models

from modelcluster.fields import ParentalKey, ParentalManyToManyField
from modelcluster.contrib.taggit import ClusterTaggableManager
from taggit.models import TaggedItemBase

from wagtail.fields import StreamField, RichTextField
from wagtail.admin.panels import FieldPanel, InlinePanel, MultiFieldPanel, FieldRowPanel, PageChooserPanel, HelpPanel
# from wagtail.admin.widgets.button_select import BooleanButtonSelect
from wagtail.admin.forms.workflows import AdminTaskChooser
from wagtail.models import Orderable
from wagtail.models import Task
from wagtail.contrib.forms.models import AbstractEmailForm, AbstractFormField
from wagtail.contrib.forms.panels import FormSubmissionsPanel

from bakerydemo.base.blocks import BaseStreamBlock
from bakerydemo.recipes.blocks import RecipeStreamBlock
from bakerydemo.ui_tests.blocks import ComplexBodyBlock, EveryBlockUnderTheSun
from bakerydemo.locations.choices import DAY_CHOICES
from bakerydemo.locations.models import OperatingHours


class EverythingPersonRelationship(Orderable, models.Model):
    page = ParentalKey(
        "EverythingPage",
        related_name="everything_person_relationship",
        on_delete=models.CASCADE,
    )
    person = models.ForeignKey(
        "base.Person",
        related_name="person_everything_relationship",
        on_delete=models.CASCADE,
    )
    panels = [FieldPanel("person")]


class EverythingOperatingHours(Orderable, OperatingHours):
    location = ParentalKey(
        'EverythingPage',
        related_name='hours_of_operation',
        on_delete=models.CASCADE
    )


class EverythingWorkflowTasks(Orderable):
    page = ParentalKey(
        'EverythingPage',
        related_name='workflow_tasks',
        on_delete=models.CASCADE
    )
    task = models.ForeignKey(
        Task,
        on_delete=models.CASCADE,
        verbose_name="task",
        limit_choices_to={"active": True},
    )

    class Meta(Orderable.Meta):
        unique_together = [("page", "task")]

class FormField(AbstractFormField):
    """
    https://docs.wagtail.org/en/stable/reference/contrib/forms/index.html
    """
    page = ParentalKey('EverythingPage', related_name='form_fields', on_delete=models.CASCADE)


class EverythingPageTag(TaggedItemBase):
    content_object = ParentalKey('ui_tests.EverythingPage', on_delete=models.CASCADE, related_name='tagged_items')


class EverythingPage(AbstractEmailForm):
    char_field = models.CharField(max_length=100, help_text="CharField")
    char_field_optional = models.CharField(max_length=100, help_text="CharField", blank=True)
    char_field_no_comments = models.CharField(max_length=100, help_text="CharField no comments", blank=True)
    char_field_default = models.CharField(
        blank=True,
        max_length=32,
        verbose_name="Verbose name for char_field_default",
        default="This is default value",
    )
    text_field = models.TextField(max_length=500, help_text="TextField")
    text_field_optional = models.TextField(max_length=500, help_text="TextField", blank=True)
    richtext_field = RichTextField(help_text="RichTextField")
    richtext_field_optional = RichTextField(help_text="RichTextField optional", blank=True)
    richtext_field_no_comments = RichTextField(help_text="RichTextField no comments", blank=True)

    choices = models.CharField(
        max_length=10,
        choices=DAY_CHOICES,
        default='MON',
        blank=True,
    )
    # choices_select_multiple = models.CharField(
    #     max_length=10,
    #     choices=DAY_CHOICES,
    #     default='MON',
    #     blank=True,
    # )
    # choices_checkbox_multiple = models.CharField(
    #     max_length=10,
    #     choices=DAY_CHOICES,
    #     default='MON',
    #     blank=True,
    # )
    choices_radio_select = models.CharField(
        max_length=10,
        choices=DAY_CHOICES,
        default='MON',
        blank=True,
    )
    choices_button_select = models.CharField(
        max_length=10,
        choices=DAY_CHOICES,
        default='MON',
        blank=True,
    )

    image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
        help_text='image help_text'
    )
    featured_page = models.ForeignKey(
        "wagtailcore.Page",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        help_text='featured_page help_text'
    )
    file_download = models.ForeignKey(
        "wagtaildocs.Document",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        help_text="file_download help_text",
    )
    tags = ClusterTaggableManager(through=EverythingPageTag, blank=True)

    char_field_title = models.CharField(max_length=100, help_text="CharField title")
    char_field_password = models.CharField(max_length=100, help_text="CharField password", blank=True)

    # auto_field = models.AutoField(help_text="AutoField")
    # bigauto_field = models.BigAutoField(help_text="BigAutoField")
    # biginteger_field = models.BigIntegerField(help_text="BigIntegerField")
    # binary_field = models.BinaryField(help_text="BinaryField")
    boolean_field = models.BooleanField(help_text="BooleanField")
    date_field = models.DateField(help_text="DateField")
    datetime_field = models.DateTimeField(help_text="DateTimeField")
    time_field = models.TimeField(help_text="TimeField")
    decimal_field = models.DecimalField(help_text="DecimalField", max_digits=10, decimal_places=2)
    duration_field = models.DurationField(help_text="DurationField", null=True, blank=True)
    email_field = models.EmailField(help_text="EmailField")
    file_field = models.FileField(help_text="FileField", blank=True)
    file_field_clearable = models.FileField(help_text="FileField clearable", blank=True)
    # filepath_field = models.FilePathField(help_text="FilePathField")
    float_field = models.FloatField(help_text="FloatField")
    genericipaddress_field = models.GenericIPAddressField(help_text="GenericIPAddressField", null=True, blank=True)
    image_field = models.ImageField(help_text="ImageField", null=True, blank=True)
    integer_field = models.IntegerField(help_text="IntegerField")
    json_field = models.JSONField(help_text="JSONField")
    positivebiginteger_field = models.PositiveBigIntegerField(help_text="PositiveBigIntegerField", null=True, blank=True)
    positiveinteger_field = models.PositiveIntegerField(help_text="PositiveIntegerField", null=True, blank=True)
    positivesmallinteger_field = models.PositiveSmallIntegerField(help_text="PositiveSmallIntegerField", null=True, blank=True)
    slug_field = models.SlugField(help_text="SlugField", blank=True)
    # smallauto_field = models.SmallAutoField(help_text="SmallAutoField")
    smallinteger_field = models.SmallIntegerField(help_text="SmallIntegerField", null=True, blank=True)
    url_field = models.URLField(help_text="URLField")
    uuid_field = models.UUIDField(help_text="UUIDField", null=True, blank=True)

    backstory = StreamField(
        BaseStreamBlock(),
        # Demonstrate block_counts to keep the backstory concise.
        block_counts={
            "heading_block": {"max_num": 1},
            "image_block": {"max_num": 1},
            "embed_block": {"max_num": 1},
        },
        blank=True,
        use_json_field=True,
        help_text="Use only a minimum number of headings and large blocks.",
        collapsed=True,
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
        use_json_field=True,
        help_text="The recipe’s step-by-step instructions and any other relevant information.",
    )

    complex_body = StreamField(
        ComplexBodyBlock(), verbose_name="Complex body", blank=True, use_json_field=True
    )
    every_block_under_the_sun = StreamField(
        EveryBlockUnderTheSun(), blank=True, use_json_field=True
    )
    ingredients = ParentalManyToManyField('breads.BreadIngredient', blank=True)

    content_panels = AbstractEmailForm.content_panels + [
        FieldPanel('char_field'),
        FieldPanel('char_field_optional'),
        FieldPanel('char_field_no_comments', disable_comments=True),
        FieldPanel('text_field'),
        FieldPanel('text_field_optional', classname="full"),
        FieldPanel('richtext_field'),
        FieldPanel('richtext_field_optional'),
        FieldPanel('richtext_field_no_comments', disable_comments=True),
        FieldPanel('choices'),
        # FieldPanel('choices_select_multiple', widget=forms.SelectMultiple),
        # FieldPanel('choices_checkbox_multiple', widget=forms.CheckboxSelectMultiple),
        FieldPanel('choices_radio_select', widget=forms.RadioSelect),
        # FieldPanel('choices_button_select', widget=BooleanButtonSelect),
        FieldPanel('image'),
        PageChooserPanel("featured_page", ["blog.BlogPage"]),
        FieldPanel('file_download'),
        FieldPanel('tags'),
        FieldPanel('char_field_title', classname="title"),
        FieldPanel('char_field_password', widget=forms.PasswordInput()),
        MultiFieldPanel([
            FieldRowPanel([
                FieldPanel('from_address', classname="col6"),
                FieldPanel('to_address', classname="col6"),
            ], heading="Field row"),
            FieldPanel('subject'),
        ], heading="Email"),
        FieldPanel('boolean_field'),
        MultiFieldPanel([
            MultiFieldPanel([
                HelpPanel(
                    heading="This is HelpPanel",
                    content='''HelpPanel content''',
                    classname='custom-help-block',
                ),
                FieldPanel('date_field'),
                FieldPanel('datetime_field'),
                FieldPanel('time_field'),
            ], heading="Date fields (nested)"),
            MultiFieldPanel([
                FieldPanel('decimal_field', widget=forms.NumberInput(attrs={'placeholder': 'Custom placeholder'})),
                FieldPanel('float_field', widget=forms.NumberInput(attrs={'aria-describedby': 'id_custom-aria-describedby'})),
            ], heading="Number fields (nested)"),
        ], heading="date and time fields", classname="collapsible"),
        MultiFieldPanel([
            FieldPanel('duration_field'),
            FieldPanel('url_field'),
        ], heading="duration and URL", classname="collapsible collapsed"),
        FieldPanel('email_field', classname="full"),
        FieldPanel('image_field'),
        # FieldPanel('filepath_field'),
        FieldPanel('genericipaddress_field', read_only=True, help_text="Read-only field"),
        FieldPanel('integer_field'),
        FieldPanel('json_field'),
        MultiFieldPanel([
            FieldRowPanel([
                FieldPanel('file_field', classname="col3"),
                FieldPanel('file_field_clearable', widget=forms.ClearableFileInput(), classname="col3"),
            ]),
            FieldRowPanel([
                FieldPanel('positivebiginteger_field', classname="col2"),
                FieldPanel('positiveinteger_field', classname="col2"),
                FieldPanel('positivesmallinteger_field', classname="col2"),
                MultiFieldPanel([
                    FieldPanel('slug_field', classname="col2"),
                    # FieldPanel('smallauto_field', classname="col2"),
                    FieldPanel('smallinteger_field', classname="col2"),
                    FieldPanel('uuid_field', classname="col2"),
                ], heading="Field group inside field row inside field group")
            ]),
        ], heading="Niche fields", classname="collapsible collapsed"),
        MultiFieldPanel(
            [
                # Example use case for HelpPanel.
                HelpPanel(
                    "Refer to keywords analysis and correct international ingredients names to craft the best introduction backstory, and headline."
                ),
                # StreamField inside a MultiFieldPanel.
                FieldPanel("backstory"),
            ],
            heading="Preface",
        ),
        FieldPanel('body'),
        FieldPanel('complex_body'),
        FieldPanel('every_block_under_the_sun'),
        InlinePanel(
            "everything_person_relationship",
            heading="Authors",
            label="Author",
            help_text="Select between one and three authors",
            panels=None,
            min_num=1,
            max_num=3,
        ),
        InlinePanel('hours_of_operation', heading="This is heading", label="This is label", min_num=1, max_num=3, help_text="Use between one and three"),
        FormSubmissionsPanel(),
        InlinePanel('form_fields', label="Form fields"),
        InlinePanel(
            "workflow_tasks",
            [
                FieldPanel("task", widget=AdminTaskChooser(show_clear_link=False)),
            ],
            heading="Add tasks to your page",
        ),
        MultiFieldPanel(
            [
                FieldPanel(
                    'ingredients',
                    widget=forms.CheckboxSelectMultiple,
                ),
            ],
            heading="Let’s choose ingredients"
        ),
    ]
