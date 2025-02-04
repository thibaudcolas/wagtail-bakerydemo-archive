export default async (request, context) => {
  const url = new URL(request.url);

  const previewPathRegex = /\/edit\/preview\/$/;

  // If the request is a POST and the pathname matches our preview URL pattern...
  if (request.method === "POST" && previewPathRegex.test(url.pathname)) {
    // Create a new request with method GET.
    // Note: The request body is not forwarded because GET requests don’t have one.
    const jsonResponse = JSON.stringify({
      is_valid: true,
      is_available: true,
    });

    return new Response(jsonResponse, {
      status: 200,
      headers: { "Content-Type": "application/json" },
    });
  }

  // For all other requests, continue as normal.
  return context.next();
};
