namespace RouteBuilder.Crawler.ACL
{
    using System;
    using System.Net;
    using RouteBuilder.Crawler.Contracts;
    using RouteBuilder.Crawler.Infrastructure;
    using RouteBuilder.Crawler.Models;

    internal class WebClientWrapper : IWebClient
    {
        private readonly Uri baseUri;

        public WebClientWrapper(string baseUrl)
        {
            this.baseUri = new Uri(baseUrl);
        }

        public PageResponse<string> DownloadString(string relativePath)
        {

            return this.HandleRequest((client) =>
                {
                    Uri requestUri = new Uri(this.baseUri, relativePath);

                    return client.DownloadString(requestUri);
                });
        }

        private PageResponse<T> HandleRequest<T>(Func<WebClient, T> action)
        {
            using (var client = new WebClient())
            {
                var response = new PageResponse<T>();

                try
                {
                    response.Content = action(client);
                    response.ResponseCode = HttpStatusCode.OK;

                    return response;
                }
                catch (WebException ex)
                {
                    if (ex.Status == WebExceptionStatus.ProtocolError)
                    {
                        if (ex.Response is HttpWebResponse httpResponse)
                        {
                            response.ResponseCode = httpResponse.StatusCode;
                            response.Content = default(T);

                            return response;
                        }
                    }

                    throw ex;
                }
            }
        }
    }
}
