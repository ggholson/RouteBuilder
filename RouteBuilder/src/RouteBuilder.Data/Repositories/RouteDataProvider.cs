namespace RouteBuilder.Data.Repositories
{
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;
    using System.Linq;
    using Dapper;
    using RouteBuilder.Core.Contracts;
    using RouteBuilder.Core.Models.Route;
    using RouteBuilder.Data.Contracts;

    public class RouteDataProvider : DataProviderBase, IRouteProvider
    {
        public RouteDataProvider(IRepository repo) : base(repo)
        {
        }

        public short CreateRoute(string name)
        {
            var parameters = new
                             {
                                 Name = name
                             };
            // ReSharper disable once PossibleInvalidOperationException
            return (short) this.Repository.Execute(conn => 
                conn.Execute(
                    "[Route].[CreateRoute]",
                    parameters,
                    commandType: CommandType.StoredProcedure
                )
            );
        }

        public IList<Route> GetRoutes()
        {
            return this.Repository.Execute(conn => conn.GetList<Route>().ToList());
        }

        public IList<Segment> GetRouteSegments(short routeId)
        {
            var parameters = new
                             {
                                 RouteId = routeId
                             };
            return this.Repository.Execute(conn => 
                conn.Query<Segment>(
                    "[Route].[GetRouteSegments]", 
                    parameters, 
                    commandType: CommandType.StoredProcedure).ToList()
            );
        }
    }
}
