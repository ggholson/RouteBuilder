namespace RouteBuilder.Data.Contracts
{
    using System;
    using System.Data;

    public interface IRepository
    {
        T Execute<T>(Func<IDbConnection, T> getData);

        T ExecuteWithTransaction<T>(Func<IDbConnection, IDbTransaction, T> cmd);
    }
}
