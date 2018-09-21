namespace RouteBuilder.Application.Services
{
    using System.Collections;
    using System.Collections.Generic;
    using RouteBuilder.Application.Contracts;
    using RouteBuilder.Core.Contracts;
    using RouteBuilder.Core.Enums;
    using RouteBuilder.Core.Models.Entity;

    public class AbilityService : IAbilityService
    {
        private readonly IAbilityProvider provider;

        public AbilityService(IAbilityProvider provider)
        {
            this.provider = provider;
        }

        public Ability GetAbility(short abilityId)
        {
            return this.provider.GetAbility(abilityId);
        }

        public IList<CharacterAbility> GetCharacterAbilities(Characters characters)
        {
            return this.provider.GetCharacterAbilities(characters);
        }
    }
}
