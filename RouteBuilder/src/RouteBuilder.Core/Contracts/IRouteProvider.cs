namespace RouteBuilder.Core.Contracts
{
    using System.Collections;
    using System.Collections.Generic;
    using RouteBuilder.Core.Models.Route;

    public interface IRouteProvider
    {
        short CreateRoute(string name);

        IList<Route> GetRoutes();

        IList<Segment> GetRouteSegments(short routeId);
    }
}
