namespace RouteBuilder.Data.Contracts
{
    using System.Data;

    public interface IConnectionFactory
    {
        IDbConnection GetConnection();

        void SetSave(string saveName);
    }
}
