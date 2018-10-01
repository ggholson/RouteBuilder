namespace RouteBuilder.UI
{
    using System;
    using Microsoft.Extensions.DependencyInjection;
    using RouteBuilder.Application.Contracts;
    using RouteBuilder.Application.Services;
    using RouteBuilder.Core.Contracts;
    using RouteBuilder.Data.Contracts;
    using RouteBuilder.Data.Repositories;
    using RouteBuilder.Data.Sql;

    public static class Bootstrapper
    {
        public static void ConfigureDependencies(IServiceCollection services)
        {
            services.AddTransient<IAbilityProvider, AbilityDataProvider>();

            services.AddTransient<IAbilityService, AbilityService>();
            services.AddSingleton<IRepository, SqlRepository>();
            services.AddSingleton<IConnectionFactory, SqlConnectionFactory>();
        }
    }
}
