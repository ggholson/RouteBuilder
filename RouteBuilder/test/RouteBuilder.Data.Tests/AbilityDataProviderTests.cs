namespace RouteBuilder.Data.Tests
{
    using System.Linq;
    using RouteBuilder.Core.Enums;
    using RouteBuilder.Data.Contracts;
    using RouteBuilder.Data.Repositories;
    using RouteBuilder.Data.Sql;
    using RouteBuilder.Tests;
    using RouteBuilder.Tests.Extensions;
    using Shouldly;
    using Xunit;

    public class AbilityDataProviderTests
    {
        private readonly IRepository repo;

        public AbilityDataProviderTests()
        {
            var config = TestConfiguration.Configuration;
            this.repo = new SqlRepository(new SqlConnectionFactory(config));
        }

        [Fact]
        public void GetCharacterAbilities_GetsCorrectDefinitions()
        {
            var sut = new AbilityDataProvider(this.repo);

            var data = sut.GetCharacterAbilities(Character.Zidane);

            data.Count.ShouldBe(47);
            data.ShouldContain(a => a.AbilityId == 46);

            var masterThief = data.First(a => a.AbilityId == 46);
            masterThief.AP.ShouldBe(50);
            masterThief.AbilityTypeId.ShouldBe(AbilityType.Support);
            masterThief.Description.ShouldContain("Semi-Rare");
            masterThief.Cost.ShouldBe(5);

            data.ShouldAllBe(a => a.AbilityTypeId == AbilityType.Thief_Skills || a.AbilityTypeId == AbilityType.Support);
        }
    }
}
