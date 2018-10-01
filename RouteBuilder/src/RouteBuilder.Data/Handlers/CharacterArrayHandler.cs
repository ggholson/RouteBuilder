namespace RouteBuilder.Data.Handlers
{
    using System;
    using System.Data;
    using System.Linq;
    using Dapper;
    using RouteBuilder.Core.Enums;

    public class CharacterArrayHandler : SqlMapper.TypeHandler<Character[]>
    {
        private const char DELIMITER = ',';

        public override void SetValue(IDbDataParameter parameter, Character[] value)
        {
            int[] characters = value.Select(c => (int) c).ToArray();
            parameter.Value = string.Join(DELIMITER, characters);
        }

        public override Character[] Parse(object value)
        {
            string delimitedList = value.ToString();
            string[] characters = delimitedList.Split(DELIMITER);

            return characters.Select(c => (Character) int.Parse(c)).ToArray();
        }
    }
}
