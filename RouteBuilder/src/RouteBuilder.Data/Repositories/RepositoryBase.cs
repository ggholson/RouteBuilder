namespace RouteBuilder.Data.Repositories
{
    using System;
    using System.Data;
    using System.Data.Common;
    using Dapper;
    using RouteBuilder.Core.Enums;
    using RouteBuilder.Data.Contracts;
    using RouteBuilder.Data.Handlers;

    public abstract class RepositoryBase : IRepository
    {
        protected readonly IConnectionFactory ConnectionFactory;

        static RepositoryBase()
        {
            SqlMapper.AddTypeHandler(typeof(Character[]), new CharacterArrayHandler());
        }

        protected RepositoryBase(IConnectionFactory factory)
        {
            this.ConnectionFactory = factory;
        }

        public T Execute<T>(Func<IDbConnection, T> getData)
        {
            using (var connection = this.GetConnection())
            {
                connection.Open();
                return getData(connection);
            }
        }

        public T ExecuteWithTransaction<T>(Func<IDbConnection, IDbTransaction, T> cmd)
        {
            using (IDbConnection connection = this.GetConnection())
            {
                connection.Open();

                using (var transaction = connection.BeginTransaction())
                {
                    T data;

                    try
                    {
                        data = cmd(connection, transaction);
                    }
                    catch (DbException e)
                    {
                        transaction.Rollback();
                        throw e.InnerException;
                    }

                    transaction.Commit();
                    return data;
                }
            }
        }

        protected abstract IDbConnection GetConnection();
    }
}
