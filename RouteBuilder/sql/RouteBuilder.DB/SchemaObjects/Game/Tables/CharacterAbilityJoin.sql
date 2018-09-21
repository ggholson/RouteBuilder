CREATE TABLE [Game].[CharacterAbilityJoin]
(
	[CharacterAbilityId] SMALLINT NOT NULL PRIMARY KEY, 
	[CharacterId] TINYINT NOT NULL, 
	[AbilityId] TINYINT NOT NULL, 
	[AP] TINYINT NOT NULL, 
	CONSTRAINT [FK_CharacterAbilityJoin_ToCharacter] FOREIGN KEY ([CharacterId]) REFERENCES [Game].[Character]([CharacterId]), 
	CONSTRAINT [FK_CharacterAbilityJoin_ToAbility] FOREIGN KEY ([AbilityId]) REFERENCES [Game].[Ability]([AbilityId]), 
	CONSTRAINT [UNQ_CharacterAbilityJoin_CharacterId_AbilityId] UNIQUE ([CharacterId], [AbilityId]) 
)

GO

CREATE NONCLUSTERED INDEX [IX_CharacterAbilityJoin_CharacterId] ON [Game].[CharacterAbilityJoin] ([CharacterId])
GO
CREATE NONCLUSTERED INDEX [IX_CharacterAbilityJoin_AbilityId] ON [Game].[CharacterAbilityJoin] ([CharacterId], [AbilityId])
