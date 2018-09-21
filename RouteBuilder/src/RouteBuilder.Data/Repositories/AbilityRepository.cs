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

    public class AbilityRepository : IAbilityProvider
    {
        private readonly IRepository repository;

        public AbilityRepository(IRepository repository)
        {
            this.repository = repository;
        }

        public Ability GetAbility(short id)
        {
            return this.repository.Execute<Ability>((conn) =>
            {
                return conn.Get<Ability>(id);
            });
        }

        public IList<CharacterAbility> GetCharacterAbilities(Characters characters)
        {
            var parameters = new
                             {
                                 CharacterId = characters
                             };
            return this.repository.Execute((conn) =>
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
