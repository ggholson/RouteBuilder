namespace RouteBuilder.Crawler.Models
{
    using System.Net;

    internal class PageResponse<T>
    {
        internal T Content { get; set; }

        internal HttpStatusCode ResponseCode { get; set; }
    }
}
