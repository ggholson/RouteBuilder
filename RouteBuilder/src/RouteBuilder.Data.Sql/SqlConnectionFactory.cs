namespace RouteBuilder.Data.Sql
{
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using Dapper;
    using Microsoft.Extensions.Configuration;
    using RouteBuilder.Data.Contracts;

    public class SqlConnectionFactory : IConnectionFactory
    {
        private readonly string connectionString;
        private readonly Guid connectionId;

        public SqlConnectionFactory(IConfiguration config)
        {
            this.connectionString = config.GetConnectionString("SqlDb");
            this.connectionId = Guid.NewGuid();

            this.SetSave("default");
        }

        public IDbConnection GetConnection()
        {
            return new SqlConnection(this.connectionString);
        }

        public void SetSave(string saveName)
        {
            IDbConnection conn = this.GetConnection();

            conn.Execute("[Meta].[SessionSave]", 
                commandType: CommandType.StoredProcedure,
                param: new
                 {
                     SessionId = this.connectionId,
                     Name = saveName
                 });
        }
    }
}
