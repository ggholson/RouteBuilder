CREATE TABLE [Game].[Weapon]
(
	[EquipmentId] TINYINT NOT NULL PRIMARY KEY, 
	[Attack] TINYINT NOT NULL, 
	[Element] BIGINT NULL, 
	CONSTRAINT [FK_Weapon_ToEquipment] FOREIGN KEY ([EquipmentId]) REFERENCES [Game].[Equipment]([EquipmentId])
)
