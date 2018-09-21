namespace RouteBuilder.Crawler.Application
{
    using System.Collections.Generic;
    using System.Linq;
    using System.Text.RegularExpressions;
    using RouteBuilder.Core.Models;
    using RouteBuilder.Core.Models.Entity;
    using RouteBuilder.Crawler.Models.Entity;

    internal class ParsingService
    {
        internal IList<Ability> GetAbilities(IList<AbilityData> abilities)
        {
            var output = new List<Ability>();

            foreach (AbilityData ability in abilities)
            {
                var obj = new Ability
                          {
                              Name = ability.Name,
                              Effect = ability.Effect,
                              Stones = byte.Parse(ability.Stones)
                          };

                output.Add(obj);
            }

            return output;
        }

        internal IList<CharacterAbilityMap> GetCharacterAbilityMappings(IList<AbilityData> abilities)
        {
            var output = new List<CharacterAbilityMap>();
            Regex mappingRegex = new Regex("([A-Za-z]+)\\s\\((\\d+)\\)");

            foreach (AbilityData ability in abilities)
            {
                MatchCollection mappings = mappingRegex.Matches(ability.CharacterMap);

                foreach (Match match in mappings)
                {
                    output.Add(new CharacterAbilityMap
                               {
                                   Ability = ability.Name,
                                   Character = match.Groups[1].Value,
                                   AP = byte.Parse(match.Groups[2].Value)
                               });
                }
            }

            return output;
        }
    }
}
