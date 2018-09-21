CREATE TABLE [Game].[CharacterEquipmentJoin]
(
	[CharacterEquipmentId] SMALLINT NOT NULL PRIMARY KEY IDENTITY, 
	[CharacterId] TINYINT NULL, 
	[EquipmentId] TINYINT NULL, 
	CONSTRAINT [FK_CharacterEquipmentJoin_ToCharacter] FOREIGN KEY ([CharacterId]) REFERENCES [Game].[Character]([CharacterId]), 
	CONSTRAINT [FK_CharacterEquipmentJoin_ToEquipment] FOREIGN KEY ([EquipmentId]) REFERENCES [Game].[Equipment]([EquipmentId]),
	CONSTRAINT [UNQ_CharacterEquipmentJoin_CharacterId_EquipmentId] UNIQUE ([CharacterId], [EquipmentId])

)
