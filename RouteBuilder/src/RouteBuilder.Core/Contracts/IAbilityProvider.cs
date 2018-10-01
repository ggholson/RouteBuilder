namespace RouteBuilder.Core.Contracts
{
    using System.Collections.Generic;
    using RouteBuilder.Core.Enums;
    using RouteBuilder.Core.Models.Entity;

    public interface IAbilityProvider
    {

        Ability GetAbility(short id);

        IList<CharacterAbility> GetCharacterAbilities(Character characters);
    }
}
