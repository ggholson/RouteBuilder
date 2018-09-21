CREATE PROCEDURE [Game].[GetCharacterAbilities]
	@CharacterId TINYINT
AS
	SELECT 
		a.*,
		j.AP
	FROM Game.CharacterAbilityJoin j
	INNER JOIN Game.Ability a
		ON j.AbilityId = a.AbilityId
	WHERE j.CharacterId = @CharacterId
