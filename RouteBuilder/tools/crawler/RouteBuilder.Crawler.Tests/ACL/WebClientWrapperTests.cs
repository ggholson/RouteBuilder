namespace RouteBuilder.Crawler.Tests.ACL
{
    using System;
    using System.Linq;
    using System.Net;

    using RouteBuilder.Crawler.ACL;
    using RouteBuilder.Crawler.Models;

    using Shouldly;
    using WireMock.RequestBuilders;
    using WireMock.ResponseBuilders;
    using WireMock.Server;
    using Xunit;

    public class WebClientWrapperTests : IDisposable
    {
        private readonly string baseUrl;
        private readonly FluentMockServer server;

        public WebClientWrapperTests()
        {
            this.server = FluentMockServer.Start();
            
            this.server.Given(Request.Create().WithPath("/valid-url").UsingGet())
                    .RespondWith(
                        Response.Create()
                                .WithStatusCode(200)
                                .WithBody("This is a valid url. Here, have some data")
                    );

            this.server.Given(Request.Create().WithPath("/invalid-url").UsingGet())
                    .RespondWith(
                        Response.Create()
                                .WithStatusCode(500)
                        );

            this.server.Given(Request.Create().WithPath("/nonexistent-url").UsingGet())
                    .RespondWith(
                        Response.Create()
                                .WithStatusCode(404)
                    );

            this.baseUrl = $"http://localhost:{this.server.Ports.First()}";
        }

        [Fact]
        public void DownloadString_Handles_Valid_Response()
        {
            var client = new WebClientWrapper(this.baseUrl);

            PageResponse<string> response = client.DownloadString("/valid-url");

            response.ResponseCode.ShouldBe(HttpStatusCode.OK);
            response.Content.ShouldContain("valid url");
        }

        [Fact]
        public void Class_Handles_404_Response()
        {
            var client = new WebClientWrapper(this.baseUrl);

            PageResponse<string> response = client.DownloadString("/nonexistent-url");

            response.ResponseCode.ShouldBe(HttpStatusCode.NotFound);
            response.Content.ShouldBeNull();
        }

        [Fact]
        public void Class_Handles_Error_Response()
        {
            var client = new WebClientWrapper(this.baseUrl);

            PageResponse<string> response = client.DownloadString("/invalid-url");

            response.ResponseCode.ShouldBe(HttpStatusCode.InternalServerError);
            response.Content.ShouldBeNull();
        }

        public void Dispose()
        {
            this.server.Stop();
        }
    }
}
