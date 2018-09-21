CREATE TABLE [Game].[Ability]
(
	[AbilityId] TINYINT NOT NULL PRIMARY KEY, 
	[Name] VARCHAR(20) NOT NULL, 
	[AbilityTypeId] TINYINT NOT NULL,
	[Description] VARCHAR(1000) NOT NULL, 
	[Cost] TINYINT NOT NULL, 
    CONSTRAINT [FK_Ability_ToAbilityType] FOREIGN KEY ([AbilityTypeId]) REFERENCES [Game].[AbilityType]([AbilityTypeId])
)
