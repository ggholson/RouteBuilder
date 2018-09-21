namespace RouteBuilder.Crawler.Contracts
{
    using System;
    using RouteBuilder.Crawler.Models;

    internal interface IWebClient
    {
        PageResponse<string> DownloadString(string relativePath);
    }
}
