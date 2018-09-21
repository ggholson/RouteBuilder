namespace RouteBuilder.Data.Sql
{
    using System.Data;
    using RouteBuilder.Data.Contracts;
    using RouteBuilder.Data.Repositories;

    public class SqlRepository : RepositoryBase
    {
        public SqlRepository(IConnectionFactory factory) : base(factory)
        {
        }

        protected override IDbConnection GetConnection()
        {
            return base.ConnectionFactory.GetConnection();
        }
    }
}
