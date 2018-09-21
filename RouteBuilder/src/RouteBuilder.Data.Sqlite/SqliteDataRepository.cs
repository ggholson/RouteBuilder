namespace RouteBuilder.Data.Sqlite
{
    using System.Data;
    using RouteBuilder.Data.Contracts;
    using RouteBuilder.Data.Repositories;

    public class SqliteDataRepository : RepositoryBase
    {
        public SqliteDataRepository(IConnectionFactory factory) : base(factory)
        {
        }

        protected override IDbConnection GetConnection()
        {
            this.ConnectionFactory.SetSave("default");
            return base.ConnectionFactory.GetConnection();
        }
    }
}
