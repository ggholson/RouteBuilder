namespace RouteBuilder.Crawler.Infrastructure
{
    using Fizzler.Systems.HtmlAgilityPack;
    using HtmlAgilityPack;
    using RouteBuilder.Crawler.Contracts;
    using RouteBuilder.Crawler.Models;

    internal class PageClient
    {
        private readonly IWebClient client;

        internal PageClient(IWebClient webClient)
        {
            this.client = webClient;
        }

        internal PageResponse<string> GetPageHtmlString(string relativePath)
        {
            return this.client.DownloadString(relativePath);
        }

        internal HtmlNode GetPageHtml(string relativePath)
        {
            var html = new HtmlDocument();
            html.LoadHtml(this.GetPageHtmlString(relativePath).Content);

            return html.DocumentNode;
        }

        internal HtmlNode GetPageHtmlBySelector(string relativePath, string selector)
        {
            return this.GetPageHtml(relativePath).QuerySelector(selector);
        }
    }
}
