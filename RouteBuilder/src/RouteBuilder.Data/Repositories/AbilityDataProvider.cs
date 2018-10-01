namespace RouteBuilder.Data.Repositories
{
    using System.Collections.Generic;
    using System.Data;
    using System.Linq;
    using Dapper;
    using RouteBuilder.Core.Contracts;
    using RouteBuilder.Core.Enums;
    using RouteBuilder.Core.Models.Entity;
    using RouteBuilder.Data.Contracts;

    public class AbilityDataProvider : DataProviderBase, IAbilityProvider
    {
        public AbilityDataProvider(IRepository repository) : base(repository)
        {
        }

        public Ability GetAbility(short id)
        {
            return this.Repository.Execute((conn) => conn.Get<Ability>(id));
        }

        public IList<CharacterAbility> GetCharacterAbilities(Character characters)
        {
            var parameters = new
                             {
                                 CharacterId = characters
                             };
            return this.Repository.Execute((conn) =>
            {
                return conn.Query<CharacterAbility>(
                        "[Game].[GetCharacterAbilities]", 
                        parameters,
                        commandType: CommandType.StoredProcedure
                    ).ToList();
            });
        }
    }
}
