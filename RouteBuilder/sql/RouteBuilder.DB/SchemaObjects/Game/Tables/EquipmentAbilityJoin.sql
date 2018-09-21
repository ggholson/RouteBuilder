CREATE TABLE [Game].[EquipmentAbilityJoin]
(
	[EquipmentAbilityId] SMALLINT NOT NULL PRIMARY KEY IDENTITY,
	[EquipmentId] TINYINT NOT NULL, 
	[AbilityId] TINYINT NOT NULL, 
	CONSTRAINT [FK_EquipmentAbilityJoin_ToEquipment] FOREIGN KEY (EquipmentId) REFERENCES [Game].[Equipment]([EquipmentId]),
	CONSTRAINT [FK_EquipmentAbilityJoin_ToAbility] FOREIGN KEY (AbilityId) REFERENCES [Game].[Ability]([AbilityId]),
	CONSTRAINT [UNQ_EquipmentAbilityJoin_EquipmentId_Abilityid] UNIQUE ([EquipmentId], [AbilityId])
)
