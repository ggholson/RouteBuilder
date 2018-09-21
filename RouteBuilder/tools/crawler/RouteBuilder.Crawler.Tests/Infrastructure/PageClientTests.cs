namespace RouteBuilder.Crawler.Tests.Infrastructure
{
    using RouteBuilder.Crawler.ACL;
    using RouteBuilder.Crawler.Infrastructure;
    using RouteBuilder.Crawler.Models;
    using Shouldly;
    using Xunit;

    public class PageClientTests
    {
        public PageClientTests()
        {
        }

        [Fact]
        public void GetPageHtmlString_returns_valid_html()
        {
            var sut = new PageClient(new WebClientWrapper("http://www.google.com/"));

            PageResponse<string> html = sut.GetPageHtmlString("/valid-page");
        }

        [Fact]
        public void GetPageHtmlString_handles_page_error()
        {
//            var sut = new PageClient(new WebClientWrapper("http://www.google.com/"));
//
//            string errorMessage = Should.Throw<WebException>(delegate
//            {
//                string html = sut.GetPageHtmlString("/notapage");
//            }).Message;
//
//            errorMessage.ShouldContain("protocol error");
//            errorMessage.ShouldContain("404");
        }
    }
}
