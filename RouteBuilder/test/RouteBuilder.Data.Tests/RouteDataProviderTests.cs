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

    public class RouteDataProviderTests
    {
        private readonly IRepository repo;

        public RouteDataProviderTests()
        {
            var config = TestConfiguration.Configuration;
            this.repo = new SqlRepository(new SqlConnectionFactory(config));
        }

        [Fact]
        public void GetRoutes_returns_default_route()
        {
            var sut = new RouteDataProvider(this.repo);

            var data = sut.GetRoutes();

            data.Count.ShouldBeGreaterThan(0);
            data.First().RouteId.ShouldBe(0);
            data.First().Name.ShouldBe("Default");
        }

        [Fact]
        public void GetRouteSegments_returns_correct_segments()
        {
            var sut = new RouteDataProvider(this.repo);

            var data = sut.GetRouteSegments(0);

            data.Count.ShouldBeGreaterThan(5);

            var first = data.First();
            first.SegmentId.ShouldBe(0);
            first.Name.ShouldBe("Alexandria Castle");
            first.Subname.ShouldBeNull();
            first.Characters.Length.ShouldBe(1);
            first.Characters.First().ShouldBe(Character.Zidane);
            first.Position.ShouldBe(0);

            var third = data.Skip(2).First();
            third.SegmentId.ShouldBe(2);
            third.Name.ShouldBe("Evil Forest");
            third.Subname.ShouldBe("After Prison Cage");
            third.Characters.Length.ShouldBe(3);
            third.Characters.ShouldContain(Character.Zidane);
            third.Characters.ShouldContain(Character.Vivi);
            third.Characters.ShouldContain(Character.Steiner);
            third.Position.ShouldBe(20);
        }
    }
}
