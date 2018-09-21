namespace RouteBuilder.Data.Tests
{
    using System.Linq;
    using Microsoft.Extensions.Configuration;
    using RouteBuilder.Core.Enums;
    using RouteBuilder.Data.Contracts;
    using RouteBuilder.Data.Repositories;
    using RouteBuilder.Data.Sql;
    using RouteBuilder.Tests;
    using RouteBuilder.Tests.Extensions;
    using Shouldly;
    using Xunit;

    public class AbilityRepositoryTests
    {
        private readonly IRepository repo;

        public AbilityRepositoryTests()
        {
            var config = TestConfiguration.Configuration;
            this.repo = new SqlRepository(new SqlConnectionFactory(config));
        }

        [Fact]
        public void GetCharacterAbilities_GetsCorrectDefinitions()
        {
            var sut = new AbilityRepository(this.repo);

            var data = sut.GetCharacterAbilities(Characters.Zidane);

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
