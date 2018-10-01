namespace RouteBuilder.Data.Repositories
{
    using RouteBuilder.Data.Contracts;

    public abstract class DataProviderBase
    {
        protected IRepository Repository;

        protected DataProviderBase(IRepository repo)
        {
            this.Repository = repo;
        }
    }
}
