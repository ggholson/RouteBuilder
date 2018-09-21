namespace RouteBuilder.Data.Sqlite
{
    using System.Data;
    using System.Data.SQLite;
    using System.IO;
    using Microsoft.Extensions.Configuration;
    using RouteBuilder.Data.Contracts;

    public class SqliteConnectionFactory : IConnectionFactory
    {
        private readonly string dataPath;
        private string saveDatabase;

        public SqliteConnectionFactory(IConfiguration config)
        {
            this.dataPath = config.GetConnectionString("SqliteDataPath");
        }

        public IDbConnection GetConnection()
        {
            var builder = new SQLiteConnectionStringBuilder();
            builder.DataSource = Path.Combine(this.dataPath, $"{this.saveDatabase}.db");
            builder.Enlist = false;

            return new SQLiteConnection(builder.ConnectionString);
        }

        public void SetSave(string saveName)
        {
            this.saveDatabase = saveName;
        }
    }
}
