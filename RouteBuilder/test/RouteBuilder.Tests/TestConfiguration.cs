namespace RouteBuilder.Tests
{
    using System;
    using Microsoft.Extensions.Configuration;

    public class TestConfiguration
    {

        public static IConfiguration Configuration => SetupMockConfiguration();

        private static IConfiguration SetupMockConfiguration()
        {
            IConfigurationBuilder configuration = new ConfigurationBuilder()
                    .SetBasePath(AppContext.BaseDirectory)
                    .AddJsonFile("appsettings.json");

            return configuration.Build();
        }
    }
}
