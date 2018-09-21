namespace RouteBuilder.Crawler.Tests.Application
{
    using System.Linq;
    using RouteBuilder.Crawler.ACL;
    using RouteBuilder.Crawler.Application;
    using RouteBuilder.Crawler.Infrastructure;
    using RouteBuilder.Crawler.Models.Entity;
    using Shouldly;
    using Xunit;

    public class HtmlParserTests
    {
        [Fact]
        public void Parses_Ability_Data()
        {
            var client = new WebClientWrapper("http://finalfantasy.wikia.com/wiki/");
            var page = new PageClient(client);

            var table = page.GetPageHtmlBySelector("/List_of_Final_Fantasy_IX_support_abilities", "table.FFIX");

            var parser = new HtmlParser();
            var dataList = parser.ParseTable<AbilityData>(table);

            dataList.Count.ShouldBe(63);
            dataList.First().Name.ShouldBe("Auto-Reflect");
            dataList.First().Effect.ShouldContain("Reflect");
            dataList.First().Source.ShouldContain("Reflect Ring");
            dataList.First().CharacterMap.ShouldContain("Eiko");
            dataList.First().Stones.ShouldBe("15");

            dataList.Last().Name.ShouldBe("Bandit");
            dataList.Last().Effect.ShouldContain("Steal");
            dataList.Last().Effect.ShouldContain("item");
            dataList.Last().Source.ShouldContain("N-Kai Armlet");
            dataList.Last().CharacterMap.ShouldContain("Zidane");
            dataList.Last().Stones.ShouldBe("5");
        }
    }
}
