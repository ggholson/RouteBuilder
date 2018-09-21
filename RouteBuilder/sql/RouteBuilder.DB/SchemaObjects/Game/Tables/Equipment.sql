CREATE TABLE [Game].[Equipment]
(
	[EquipmentId] TINYINT NOT NULL PRIMARY KEY, 
	[GearSlotId] TINYINT NOT NULL, 
	[Name] VARCHAR(20) NOT NULL,  
	[Strength] TINYINT NULL, 
	[Magic] TINYINT NULL, 
	[Speed] TINYINT NULL, 
	[Spirit] TINYINT NULL,
	[ElementalBoost] BIGINT NULL,
	[ElementalResist] BIGINT NULL,
	[Cost] INT NOT NULL DEFAULT 0,
	[Value] INT NOT NULL DEFAULT 1, 
	CONSTRAINT [FK_Equipment_ToGearSlot] FOREIGN KEY (GearSlotId) REFERENCES [Game].[GearSlot]([GearSlotId])
)
