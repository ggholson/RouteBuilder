namespace RouteBuilder.Crawler.Tests.Application
{
    using System.Linq;
    using RouteBuilder.Crawler.ACL;
    using RouteBuilder.Crawler.Application;
    using RouteBuilder.Crawler.Infrastructure;
    using RouteBuilder.Crawler.Models.Entity;
    using RouteBuilder.Tests.Extensions;
    using Shouldly;
    using Xunit;

    public class ParsingServiceTests
    {
        [Fact]
        public void ParsesCharacterAbilityMappings()
        {
            var client = new WebClientWrapper("http://finalfantasy.wikia.com/wiki/");
            var page = new PageClient(client);

            var table = page.GetPageHtmlBySelector("/List_of_Final_Fantasy_IX_support_abilities", "table.FFIX");

            var parser = new HtmlParser();
            var dataList = parser.ParseTable<AbilityData>(table);

            var sut = new ParsingService();
            var mappings = sut.GetCharacterAbilityMappings(dataList);

            mappings.Count.ShouldBe(252);

            mappings.First().Ability.ShouldBe("Auto-Reflect");
            mappings.First().Character.ShouldBe("Zidane");
            mappings.First().AP.ShouldBe(95);

            mappings.Last().Ability.ShouldBe("Bandit");
            mappings.Last().Character.ShouldBe("Zidane");
            mappings.Last().AP.ShouldBe(40);
        }
    }
}
