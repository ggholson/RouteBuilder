namespace RouteBuilder.Application.Contracts
{
    using System.Collections.Generic;
    using RouteBuilder.Core.Enums;
    using RouteBuilder.Core.Models.Entity;

    public interface IAbilityService
    {
        Ability GetAbility(short abilityId);

        IList<CharacterAbility> GetCharacterAbilities(Characters characters);
    }
}
