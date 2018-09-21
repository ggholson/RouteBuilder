-- Script Date: 9/21/2018 12:44 PM  - ErikEJ.SqlCeScripting version 3.5.2.72
SELECT 1;
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE [Session] (
  [SessionId] uniqueidentifier NOT NULL
, [SaveName] nvarchar(50) NULL
, CONSTRAINT [PK__Session__C9F49290775B8472] PRIMARY KEY ([SessionId])
);
CREATE TABLE [GearSlot] (
  [GearSlotId] tinyint NOT NULL
, [GearSlot] nvarchar(20) NOT NULL
, CONSTRAINT [PK__GearSlot__04CE17767642BE59] PRIMARY KEY ([GearSlotId])
);
CREATE TABLE [Equipment] (
  [EquipmentId] tinyint NOT NULL
, [GearSlotId] tinyint NOT NULL
, [Name] nvarchar(20) NOT NULL
, [Strength] tinyint NULL
, [Magic] tinyint NULL
, [Speed] tinyint NULL
, [Spirit] tinyint NULL
, [ElementalBoost] bigint NULL
, [ElementalResist] bigint NULL
, [Cost] int DEFAULT 0 NOT NULL
, [Value] int DEFAULT 1 NOT NULL
, CONSTRAINT [PK__tmp_ms_x__34474479CC522B0B] PRIMARY KEY ([EquipmentId])
, FOREIGN KEY ([GearSlotId]) REFERENCES [GearSlot] ([GearSlotId]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [Weapon] (
  [EquipmentId] tinyint NOT NULL
, [Attack] tinyint NOT NULL
, [Element] bigint NULL
, CONSTRAINT [PK__Weapon__344744799E21DA81] PRIMARY KEY ([EquipmentId])
, FOREIGN KEY ([EquipmentId]) REFERENCES [Equipment] ([EquipmentId]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [Elements] (
  [ElementId] bigint NOT NULL
, [ElementFlag] bigint NOT NULL
, CONSTRAINT [PK__Elements__A429721AC5EEB328] PRIMARY KEY ([ElementId])
);
CREATE TABLE [Character] (
  [CharacterId] tinyint NOT NULL
, [Name] nvarchar(10) NOT NULL
, CONSTRAINT [PK__Characte__757BC9A06C67102F] PRIMARY KEY ([CharacterId])
);
CREATE TABLE [CharacterEquipmentJoin] (
  [CharacterEquipmentId] INTEGER NOT NULL
, [CharacterId] tinyint NULL
, [EquipmentId] tinyint NULL
, CONSTRAINT [PK__Characte__FFFF56AC90A8A487] PRIMARY KEY ([CharacterEquipmentId])
, FOREIGN KEY ([CharacterId]) REFERENCES [Character] ([CharacterId]) ON DELETE NO ACTION ON UPDATE NO ACTION
, FOREIGN KEY ([EquipmentId]) REFERENCES [Equipment] ([EquipmentId]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [Armor] (
  [EquipmentId] tinyint NOT NULL
, [Defense] tinyint DEFAULT 0 NOT NULL
, [Evade] tinyint DEFAULT 0 NOT NULL
, [MagicDefense] tinyint DEFAULT 0 NOT NULL
, [MagicEvade] tinyint DEFAULT 0 NOT NULL
, CONSTRAINT [PK__Armor__34474479E8DEE501] PRIMARY KEY ([EquipmentId])
);
CREATE TABLE [AbilityType] (
  [AbilityTypeId] tinyint NOT NULL
, [Name] nvarchar(20) NOT NULL
, CONSTRAINT [PK__AbilityT__D6C37988F5C7608D] PRIMARY KEY ([AbilityTypeId])
);
CREATE TABLE [Ability] (
  [AbilityId] tinyint NOT NULL
, [Name] nvarchar(20) NOT NULL
, [AbilityTypeId] tinyint NOT NULL
, [Description] nvarchar(1000) NOT NULL
, [Cost] tinyint NOT NULL
, CONSTRAINT [PK__Ability__88B2507FADB9D979] PRIMARY KEY ([AbilityId])
, FOREIGN KEY ([AbilityTypeId]) REFERENCES [AbilityType] ([AbilityTypeId]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [EquipmentAbilityJoin] (
  [EquipmentAbilityId] INTEGER NOT NULL
, [EquipmentId] tinyint NOT NULL
, [AbilityId] tinyint NOT NULL
, CONSTRAINT [PK__tmp_ms_x__6E6AA407589C674E] PRIMARY KEY ([EquipmentAbilityId])
, FOREIGN KEY ([AbilityId]) REFERENCES [Ability] ([AbilityId]) ON DELETE NO ACTION ON UPDATE NO ACTION
, FOREIGN KEY ([EquipmentId]) REFERENCES [Equipment] ([EquipmentId]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [CharacterAbilityJoin] (
  [CharacterAbilityId] smallint NOT NULL
, [CharacterId] tinyint NOT NULL
, [AbilityId] tinyint NOT NULL
, [AP] tinyint NOT NULL
, CONSTRAINT [PK__Characte__22DE8FCD5D9EF407] PRIMARY KEY ([CharacterAbilityId])
, FOREIGN KEY ([AbilityId]) REFERENCES [Ability] ([AbilityId]) ON DELETE NO ACTION ON UPDATE NO ACTION
, FOREIGN KEY ([CharacterId]) REFERENCES [Character] ([CharacterId]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE [__RefactorLog] (
  [OperationKey] uniqueidentifier NOT NULL
, CONSTRAINT [PK____Refact__D3AEFFDBEBA161C5] PRIMARY KEY ([OperationKey])
);
INSERT INTO [Session] ([SessionId],[SaveName]) VALUES (
'3eb90ce2-bb67-4f5c-a1f2-2debffa76148','default');
INSERT INTO [Session] ([SessionId],[SaveName]) VALUES (
'4c3e6963-9190-4550-99a6-408529330f7b','default');
INSERT INTO [GearSlot] ([GearSlotId],[GearSlot]) VALUES (
0,'Weapon');
INSERT INTO [GearSlot] ([GearSlotId],[GearSlot]) VALUES (
1,'Head');
INSERT INTO [GearSlot] ([GearSlotId],[GearSlot]) VALUES (
2,'Hands');
INSERT INTO [GearSlot] ([GearSlotId],[GearSlot]) VALUES (
3,'Chest');
INSERT INTO [GearSlot] ([GearSlotId],[GearSlot]) VALUES (
4,'Accessory');
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
0,0,'Dagger',0,0,0,0,0,0,320,160);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
1,0,'Mage Masher',0,0,0,0,0,0,500,250);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
2,0,'Mythril Dagger',0,0,0,0,0,0,950,475);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
3,0,'Gladius',0,0,0,0,0,0,2300,1150);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
4,0,'Zorlin Shape',0,0,0,0,0,0,6000,3000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
5,0,'Orichalcon',0,0,1,0,0,0,17000,8500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
6,0,'Butterfly Sword',0,0,0,0,0,0,300,650);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
7,0,'The Ogre',0,0,0,0,0,0,700,850);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
8,0,'Exploda',0,0,0,0,0,0,1000,1400);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
9,0,'Rune Tooth',0,0,0,0,0,0,2000,1900);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
10,0,'Angel Bless',0,0,0,0,0,0,9000,3500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
11,0,'Sargatanas',0,0,0,0,0,0,12000,4750);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
12,0,'Masamune',0,2,0,0,0,0,16000,6500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
13,0,'The Tower',0,0,0,0,0,0,0,15000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
14,0,'Ultima Weapon',0,0,0,0,0,0,0,20000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
15,0,'Broadsword',0,0,0,0,0,0,330,165);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
16,0,'Iron Sword',0,0,0,0,0,0,660,330);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
17,0,'Mythril Sword',0,0,0,0,0,0,1300,650);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
18,0,'Blood Sword',0,0,0,0,0,0,0,950);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
19,0,'Ice Brand',0,0,0,0,0,0,3780,1890);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
20,0,'Coral Sword',0,0,0,0,0,0,4000,2000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
21,0,'Diamond Sword',0,0,0,0,0,0,4700,2350);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
22,0,'Flame Saber',0,0,0,0,0,0,5190,2595);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
23,0,'Rune Blade',0,0,0,0,0,0,8900,4450);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
24,0,'Defender',0,0,0,3,0,0,9340,4670);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
25,0,'Save the Queen',2,2,1,5,0,3,50000,25000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
26,0,'Ultima Sword',0,0,0,0,0,10,14000,7000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
27,0,'Excalibur',0,0,0,0,0,0,0,9500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
28,0,'Ragnarok',0,0,0,0,0,0,0,14500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
29,0,'Excalibur II',0,0,0,0,0,0,0,19500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
30,0,'Javelin',0,0,0,0,0,0,880,440);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
31,0,'Mythril Spear',0,0,0,0,0,0,1100,550);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
32,0,'Partisan',0,0,0,0,0,0,1600,800);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
33,0,'Ice Lance',0,0,0,0,0,0,2430,1215);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
34,0,'Trident',0,0,0,0,0,0,3580,1790);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
35,0,'Heavy Lance',0,0,0,0,0,0,4700,2350);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
36,0,'Obelisk',0,0,0,0,0,0,6000,3000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
37,0,'Holy Lance',0,0,0,0,0,0,11000,5500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
38,0,'Kain''s Lance',0,0,0,0,0,0,0,7500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
39,0,'Dragon''s Hair',0,0,0,0,0,0,0,11750);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
40,0,'Cat''s Claws',0,0,0,0,0,0,4000,2000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
41,0,'Poison Knuckles',0,0,0,0,0,0,5000,2500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
42,0,'Mythril Claws',0,0,0,0,0,0,6500,3250);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
43,0,'Scissor Fangs',0,0,0,0,0,0,8000,4000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
44,0,'Dragon''s Claws',0,0,0,0,0,0,0,5180);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
45,0,'Tiger Fangs',0,0,0,0,0,0,13500,6750);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
46,0,'Avenger',0,0,0,0,0,0,16000,8000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
47,0,'Kaiser Knuckles',0,0,0,0,0,0,18000,9000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
48,0,'Duel Claws',0,0,0,0,0,0,16000,10750);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
49,0,'Rune Claws',0,0,0,0,0,0,0,14400);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
50,0,'Air Racket',0,0,0,0,0,0,400,200);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
51,0,'Multina Racket',0,0,0,0,0,0,750,375);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
52,0,'Magic Racket',0,2,0,0,0,0,1350,675);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
53,0,'Mythril Racket',0,0,0,0,0,0,2250,1125);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
54,0,'Priest''s Racket',0,0,0,0,0,0,11000,4000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
55,0,'Tiger Racket',0,0,0,0,0,0,0,2900);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
56,0,'Rod',0,0,0,0,0,0,260,130);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
57,0,'Mythril Rod',0,0,0,0,0,0,560,280);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
58,0,'Stardust Rod',0,0,0,2,0,0,760,380);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
59,0,'Healing Rod',0,0,0,0,0,0,1770,885);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
60,0,'Asura''s Rod',0,0,0,0,0,0,3180,1590);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
61,0,'Wizard Rod',0,0,0,0,0,0,4000,1995);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
62,0,'Whale Whisker',0,0,0,0,0,0,0,5140);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
63,0,'Golem''s Flute',0,0,0,0,0,0,2700,1350);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
64,0,'Lamia''s Flute',0,0,0,0,0,0,3800,1900);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
65,0,'Fairy Flute',0,0,0,0,0,0,4500,2250);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
66,0,'Hamelin',0,0,0,0,0,0,5700,2850);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
67,0,'Siren''s Flute',0,0,0,0,0,0,7000,3500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
68,0,'Angel Flute',0,0,0,0,0,0,0,4150);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
69,0,'Mage Staff',0,0,0,0,0,0,320,160);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
70,0,'Flame Staff',0,0,0,0,0,0,1100,490);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
71,0,'Ice Staff',0,0,0,0,0,0,980,600);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
72,0,'Lightning Staff',0,0,0,0,0,0,1200,550);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
73,0,'Oak Staff',0,0,0,0,0,0,2400,1200);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
74,0,'Cypress Pile',0,0,0,0,0,0,3200,1600);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
75,0,'Octagon Rod',0,0,0,0,16,24,4500,2250);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
76,0,'High Mage Staff',0,0,0,0,0,0,6000,3000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
77,0,'Mace of Zeus',0,0,0,0,0,0,0,5000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
78,0,'Fork',0,0,0,0,0,0,1100,550);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
79,0,'Needle Fork',0,0,0,0,0,0,3100,1550);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
80,0,'Mythril Fork',0,0,0,0,0,0,4700,2350);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
81,0,'Silver Fork',0,0,0,0,0,0,7400,3700);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
82,0,'Bistro Fork',0,0,0,0,0,0,10300,5150);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
83,0,'Gastro Fork',0,0,0,0,0,0,0,6650);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
84,0,'Hammer',0,0,0,0,0,0,0,120);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
85,1,'Leather Hat',0,0,0,0,0,0,150,75);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
86,1,'Straw Hat',0,0,0,0,0,0,0,750);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
87,1,'Feather Hat',0,0,0,1,8,0,200,100);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
88,1,'Steepled Hat',1,0,0,0,0,0,260,130);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
89,1,'Headgear',0,0,0,0,0,16,330,165);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
90,1,'Magus Hat',0,0,0,0,2,0,400,200);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
91,1,'Bandana',0,0,1,1,0,0,500,200);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
92,1,'Mage''s Hat',0,1,0,0,160,0,600,300);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
93,1,'Lamia''s Tiara',0,1,0,1,0,8,800,400);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
94,1,'Ritual Hat',1,0,0,0,0,0,1000,500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
95,1,'Twist Headband',1,0,0,0,64,0,1200,600);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
96,1,'Mantra Band',0,1,0,1,0,0,1500,750);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
97,1,'Dark Hat',0,0,0,0,0,2,1800,900);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
98,1,'Green Beret',1,0,1,0,0,0,2180,1090);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
99,1,'Black Hood',0,0,0,0,0,7,2550,1275);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
100,1,'Red Hat',0,0,0,0,1,0,3000,1500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
101,1,'Golden Hairpin',0,1,0,0,16,0,3700,1850);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
102,1,'Coronet',0,0,0,0,0,8,3050,2200);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
103,1,'Flash Hat',0,0,1,0,36,0,5200,2600);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
104,1,'Adaman Hat',0,0,0,0,0,4,3050,3050);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
105,1,'Thief Hat',0,0,2,0,0,0,7100,3350);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
106,1,'Holy Miter',0,1,0,2,0,0,8300,4150);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
107,1,'Golden Skullcap',0,0,0,0,16,64,15000,6000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
108,1,'Circlet',0,0,0,0,0,64,20000,6500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
109,1,'Rubber Helm',0,0,0,0,0,4,250,125);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
110,1,'Bronze Helm',0,0,0,0,0,16,330,165);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
111,1,'Iron Helm',0,0,0,1,0,0,450,225);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
112,1,'Barbut',0,0,0,2,0,0,600,300);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
113,1,'Mythril Helm',0,0,0,1,32,0,1000,500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
114,1,'Gold Helm',0,1,0,0,0,0,1800,900);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
115,1,'Cross Helm',1,0,0,0,0,0,2200,1100);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
116,1,'Diamond Helm',0,0,0,1,0,0,3000,1500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
117,1,'Platinum Helm',0,0,0,0,0,2,4600,2300);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
118,1,'Kaiser Helm',1,1,0,0,0,0,7120,3560);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
119,1,'Genji Helm',0,2,0,0,0,0,0,1);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
120,1,'Grand Helm',0,0,1,0,0,0,20000,7000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
121,2,'Pearl Armlet',0,0,0,0,0,0,0,490);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
122,2,'Wrist',0,0,0,0,0,0,130,65);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
123,2,'Leather Wrist',0,0,0,1,0,0,200,100);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
124,2,'Glass Armlet',0,0,0,0,0,16,250,125);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
125,2,'Bone Wrist',1,0,0,0,64,0,330,165);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
126,2,'Mythril Armlet',0,0,0,1,0,0,500,250);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
127,2,'Magic Armlet',0,2,0,0,0,0,1000,500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
128,2,'Chimera Armlet',0,0,0,0,0,32,1200,600);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
129,2,'Egoist''s Armlet',0,0,0,0,0,128,2000,1000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
130,2,'N-Kai Armlet',0,0,0,2,0,0,3000,1500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
131,2,'Jade Armlet',0,0,0,0,32,0,3400,1700);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
132,2,'Thief Gloves',0,0,1,0,0,0,50000,25000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
133,2,'Dragon Wrist',0,0,0,1,0,128,4800,2400);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
134,2,'Power Wrist',2,0,0,0,0,0,5100,2550);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
135,2,'Bracer',1,0,0,0,8,0,24000,4000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
136,2,'Bronze Gloves',0,0,0,1,0,0,480,240);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
137,2,'Silver Gloves',0,0,0,0,0,2,720,360);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
138,2,'Mythril Gloves',0,0,0,1,0,0,980,490);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
139,2,'Thunder Gloves',0,0,0,0,4,4,1200,600);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
140,2,'Diamond Gloves',0,0,0,0,0,16,2000,1000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
141,2,'Venetia Shield',1,1,0,0,0,0,2800,1400);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
142,2,'Defense Gloves',0,0,0,0,0,7,6000,3000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
143,2,'Genji Gloves',0,2,0,0,0,0,0,1);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
144,2,'Aegis Gloves',0,0,0,0,0,1,7000,7000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
145,2,'Gauntlets',0,0,1,0,0,89,8000,4400);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
146,3,'Aloha T-Shirt',0,0,0,0,0,0,0,9500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
147,3,'Leather Shirt',0,0,0,0,0,4,270,135);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
148,3,'Silk Shirt',0,0,0,0,0,4,400,200);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
149,3,'Leather Plate',0,0,0,0,0,2,530,265);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
150,3,'Bronze Vest',0,0,0,1,0,0,670,325);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
151,3,'Chain Plate',1,0,0,0,0,0,810,405);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
152,3,'Mythril Vest',0,0,0,0,0,16,1180,590);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
153,3,'Adaman Vest',0,0,0,0,0,1,1600,800);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
154,3,'Magician Cloak',0,1,0,0,2,0,1850,925);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
155,3,'Survival Vest',0,0,0,2,0,0,2900,1450);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
156,3,'Brigandine',1,0,0,0,0,0,4300,2150);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
157,3,'Judo Uniform',1,0,0,1,0,0,5000,2150);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
158,3,'Power Vest',2,0,0,0,0,0,7200,3600);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
159,3,'Gaia Gear',0,0,0,0,64,64,8700,4350);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
160,3,'Demon''s Vest',1,0,1,0,0,0,10250,5125);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
161,3,'Minerva''s Plate',1,2,0,0,0,0,12200,6100);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
162,3,'Ninja Gear',0,0,1,0,0,0,14000,7000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
163,3,'Dark Gear',0,0,0,3,0,0,16300,8150);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
164,3,'Rubber Suit',0,0,0,0,0,4,20000,10000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
165,3,'Brave Suit',0,0,0,1,1,0,26000,11250);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
166,3,'Cotton Robe',1,1,0,0,0,0,1000,2000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
167,3,'Silk Robe',1,1,0,0,0,0,2000,2900);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
168,3,'Magician Robe',0,2,0,0,0,0,3000,4000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
169,3,'Glutton''s Robe',1,1,0,0,0,0,6000,8000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
170,3,'White Robe',0,2,0,0,32,0,8000,8000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
171,3,'Black Robe',0,2,0,0,128,0,8000,8000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
172,3,'Light Robe',1,1,0,1,160,0,20000,20000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
173,3,'Robe of Lords',1,1,1,1,0,8,30000,26000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
174,3,'Tin Armor',0,0,0,0,0,0,0,10);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
175,3,'Bronze Armor',0,0,0,0,0,8,650,325);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
176,3,'Linen Cuirass',0,1,0,0,0,0,800,400);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
177,3,'Chain Mail',0,0,0,0,0,64,1200,600);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
178,3,'Mythril Armor',0,0,0,0,0,16,1830,915);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
179,3,'Plate Mail',0,0,0,1,0,0,2320,1160);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
180,3,'Gold Armor',0,1,0,0,0,0,2950,1475);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
181,3,'Shield Armor',0,0,0,0,0,7,4300,2150);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
182,3,'Demon''s Mail',0,0,0,0,128,128,5900,2950);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
183,3,'Diamond Armor',1,1,0,0,0,0,8800,4400);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
184,3,'Platina Armor',0,0,0,0,0,2,10500,5250);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
185,3,'Carabini Mail',0,0,1,1,0,0,12300,6150);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
186,3,'Dragon Mail',1,1,0,0,0,0,14000,7000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
187,3,'Genji Armor',0,2,0,0,0,0,0,1);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
188,3,'Maximillian',0,0,0,3,0,0,0,11300);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
189,3,'Grand Armor',1,0,0,0,0,128,45000,14000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
190,4,'Desert Boots',0,1,1,0,0,64,300,750);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
191,4,'Magician Shoes',0,2,0,0,0,0,1500,3750);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
192,4,'Germinas Boots',1,0,0,0,0,0,900,2000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
193,4,'Sandals',0,0,0,0,0,0,0,600);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
194,4,'Feather Boots',0,0,0,0,0,64,4000,3000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
195,4,'Battle Boots',2,0,0,0,0,0,6500,10500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
196,4,'Running Shoes',0,0,2,0,0,0,12000,16500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
197,4,'Anklet',0,3,0,1,0,0,4000,1600);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
198,4,'Power Belt',3,0,0,0,0,0,2000,3500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
199,4,'Black Belt',2,0,0,2,8,0,4000,5500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
200,4,'Glass Buckle',1,1,0,2,0,0,500,800);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
201,4,'Madain''s Ring',0,0,0,2,0,2,3000,3750);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
202,4,'Rosetta Ring',0,1,0,0,0,1,24000,18000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
203,4,'Reflect Ring',1,1,0,0,0,0,7000,3500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
204,4,'Coral Ring',0,0,0,2,0,4,1200,2000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
205,4,'Promist Ring',2,0,0,0,0,0,6000,4500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
206,4,'Rebirth Ring',0,0,0,4,32,0,7000,5000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
207,4,'Protect Ring',0,0,0,1,0,255,40000,20000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
208,4,'Pumice Piece',2,2,0,0,0,160,25000,1);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
209,4,'Pumice',0,1,1,0,0,0,50000,25000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
210,4,'Yellow Scarf',2,0,0,0,0,0,400,900);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
211,4,'Gold Choker',0,2,0,0,128,8,1300,2000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
212,4,'Angel Earrings',2,0,0,0,32,0,8000,10000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
213,4,'Fairy Earrings',0,0,0,2,8,0,3200,3000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
214,4,'Pearl Rouge',0,2,0,4,16,32,5000,2000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
215,4,'Cachusha',0,2,1,1,1,0,1000,1500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
216,4,'Barette',3,1,0,1,2,0,1800,3500);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
217,4,'Extension',1,2,0,1,4,0,3500,5000);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
218,4,'Ribbon',1,3,0,1,0,63,0,1);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
219,4,'Maiden Prayer',0,1,0,0,32,0,1300,1);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
220,4,'Ancient Aroma',2,0,0,0,128,0,0,1);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
221,4,'Garnet',0,0,0,0,0,0,0,1);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
222,4,'Amethyst',0,0,0,0,0,0,0,1);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
223,4,'Aquamarine',0,0,0,0,0,0,0,1);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
224,4,'Diamond',0,0,0,0,0,0,0,1);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
225,4,'Emerald',0,0,0,0,0,0,0,1);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
226,4,'Moonstone',0,0,0,0,0,0,0,1);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
227,4,'Ruby',0,0,0,0,0,0,0,1);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
228,4,'Peridot',0,0,0,0,0,0,0,1);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
229,4,'Sapphire',0,0,0,0,0,0,0,1);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
230,4,'Opal',0,0,0,0,0,0,0,1);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
231,4,'Topaz',0,0,0,0,0,0,0,1);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
232,4,'Lapis Lazuli',0,0,0,0,0,0,0,1);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
233,4,'Dark Matter',3,2,0,0,0,0,0,1);
INSERT INTO [Equipment] ([EquipmentId],[GearSlotId],[Name],[Strength],[Magic],[Speed],[Spirit],[ElementalBoost],[ElementalResist],[Cost],[Value]) VALUES (
234,4,'Phoenix Pinion',0,0,0,0,0,0,0,1000);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
0,12,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
1,14,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
2,18,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
3,30,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
4,42,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
5,71,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
6,21,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
7,24,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
8,31,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
9,37,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
10,44,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
11,53,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
12,62,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
13,86,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
14,100,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
15,12,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
16,16,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
17,20,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
18,24,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
19,35,2);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
20,38,4);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
21,42,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
22,46,1);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
23,57,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
24,65,6);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
25,32,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
26,74,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
27,77,32);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
28,87,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
29,108,32);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
30,18,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
31,20,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
32,25,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
33,32,2);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
34,37,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
35,42,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
36,52,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
37,62,32);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
38,71,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
39,77,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
40,23,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
41,33,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
42,39,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
43,45,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
44,53,16);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
45,62,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
46,70,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
47,75,8);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
48,79,8);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
49,83,8);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
50,13,8);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
51,17,8);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
52,23,8);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
53,27,8);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
54,35,8);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
55,45,8);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
56,11,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
57,14,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
58,16,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
59,23,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
60,27,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
61,31,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
62,36,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
63,17,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
64,21,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
65,24,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
66,27,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
67,30,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
68,33,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
69,12,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
70,16,1);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
71,16,2);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
72,16,4);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
73,23,16);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
74,27,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
75,29,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
76,32,8);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
77,35,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
78,21,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
79,34,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
80,42,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
81,53,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
82,68,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
83,77,0);
INSERT INTO [Weapon] ([EquipmentId],[Attack],[Element]) VALUES (
84,12,0);
INSERT INTO [Character] ([CharacterId],[Name]) VALUES (
0,'Zidane');
INSERT INTO [Character] ([CharacterId],[Name]) VALUES (
1,'Vivi');
INSERT INTO [Character] ([CharacterId],[Name]) VALUES (
2,'Steiner');
INSERT INTO [Character] ([CharacterId],[Name]) VALUES (
3,'Dagger');
INSERT INTO [Character] ([CharacterId],[Name]) VALUES (
4,'Freya');
INSERT INTO [Character] ([CharacterId],[Name]) VALUES (
5,'Quina');
INSERT INTO [Character] ([CharacterId],[Name]) VALUES (
6,'Eiko');
INSERT INTO [Character] ([CharacterId],[Name]) VALUES (
7,'Amarant');
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
1,0,0);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
2,0,1);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
3,0,2);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
4,0,3);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
5,0,4);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
6,0,5);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
7,0,6);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
8,0,7);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
9,0,8);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
10,0,9);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
11,0,10);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
12,0,11);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
13,0,12);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
14,0,13);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
15,0,14);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
16,2,15);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
17,2,16);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
18,2,17);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
19,2,18);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
20,2,19);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
21,2,20);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
22,2,21);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
23,2,22);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
24,2,23);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
25,2,24);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
26,2,25);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
27,2,26);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
28,2,27);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
29,2,28);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
30,2,29);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
31,4,30);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
32,4,31);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
33,4,32);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
34,4,33);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
35,4,34);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
36,4,35);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
37,4,36);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
38,4,37);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
39,4,38);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
40,4,39);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
41,7,40);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
42,7,41);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
43,7,42);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
44,7,43);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
45,7,44);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
46,7,45);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
47,7,46);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
48,7,47);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
49,7,48);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
50,7,49);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
51,3,50);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
52,6,50);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
53,3,51);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
54,6,51);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
55,3,52);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
56,6,52);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
57,3,53);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
58,6,53);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
59,3,54);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
60,6,54);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
61,3,55);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
62,6,55);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
63,3,56);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
64,3,57);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
65,3,58);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
66,3,59);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
67,3,60);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
68,3,61);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
69,3,62);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
70,6,63);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
71,6,64);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
72,6,65);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
73,6,66);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
74,6,67);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
75,6,68);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
76,1,69);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
77,1,70);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
78,1,71);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
79,1,72);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
80,1,73);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
81,1,74);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
82,1,75);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
83,1,76);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
84,1,77);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
85,5,78);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
86,5,79);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
87,5,80);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
88,5,81);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
89,5,82);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
90,5,83);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
91,0,85);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
92,1,85);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
93,3,85);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
94,5,85);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
95,6,85);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
96,7,85);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
97,0,87);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
98,1,87);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
99,3,87);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
100,5,87);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
101,6,87);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
102,0,88);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
103,1,88);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
104,3,88);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
105,5,88);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
106,6,88);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
107,0,89);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
108,1,89);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
109,3,89);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
110,5,89);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
111,6,89);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
112,7,89);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
113,0,90);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
114,1,90);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
115,3,90);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
116,5,90);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
117,6,90);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
118,0,91);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
119,1,91);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
120,3,91);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
121,5,91);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
122,6,91);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
123,7,91);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
124,1,92);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
125,3,92);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
126,5,92);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
127,6,92);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
128,3,93);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
129,4,93);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
130,5,93);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
131,6,93);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
132,0,94);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
133,1,94);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
134,3,94);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
135,5,94);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
136,6,94);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
137,7,94);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
138,0,95);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
139,1,95);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
140,3,95);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
141,5,95);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
142,6,95);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
143,7,95);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
144,0,96);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
145,1,96);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
146,3,96);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
147,5,96);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
148,6,96);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
149,7,96);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
150,0,97);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
151,1,97);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
152,3,97);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
153,5,97);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
154,6,97);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
155,7,97);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
156,0,98);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
157,1,98);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
158,3,98);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
159,5,98);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
160,6,98);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
161,7,98);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
162,0,99);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
163,1,99);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
164,3,99);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
165,5,99);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
166,6,99);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
167,0,100);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
168,1,100);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
169,3,100);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
170,5,100);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
171,6,100);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
172,7,100);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
173,0,101);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
174,1,101);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
175,3,101);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
176,5,101);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
177,6,101);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
178,7,101);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
179,0,102);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
180,1,102);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
181,3,102);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
182,5,102);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
183,6,102);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
184,7,102);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
185,0,103);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
186,1,103);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
187,3,103);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
188,6,103);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
189,7,103);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
190,0,104);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
191,1,104);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
192,3,104);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
193,5,104);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
194,6,104);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
195,7,104);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
196,0,105);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
197,1,106);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
198,3,106);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
199,5,106);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
200,6,106);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
201,0,107);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
202,1,107);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
203,3,107);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
204,5,107);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
205,6,107);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
206,7,107);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
207,0,108);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
208,1,108);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
209,3,108);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
210,5,108);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
211,6,108);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
212,7,108);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
213,2,109);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
214,4,109);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
215,2,110);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
216,4,110);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
217,2,111);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
218,4,111);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
219,2,112);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
220,4,112);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
221,2,113);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
222,4,113);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
223,2,114);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
224,4,114);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
225,2,115);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
226,4,115);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
227,2,116);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
228,4,116);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
229,2,117);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
230,4,117);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
231,2,118);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
232,4,118);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
233,2,119);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
234,4,119);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
235,2,120);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
236,4,120);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
237,0,122);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
238,1,122);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
239,3,122);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
240,5,122);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
241,6,122);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
242,7,122);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
243,0,123);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
244,1,123);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
245,3,123);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
246,5,123);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
247,6,123);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
248,7,123);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
249,0,124);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
250,1,124);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
251,3,124);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
252,5,124);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
253,6,124);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
254,7,124);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
255,0,125);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
256,1,125);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
257,3,125);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
258,5,125);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
259,6,125);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
260,7,125);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
261,0,126);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
262,1,126);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
263,3,126);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
264,5,126);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
265,6,126);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
266,7,126);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
267,1,127);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
268,3,127);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
269,5,127);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
270,6,127);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
271,0,128);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
272,1,128);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
273,3,128);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
274,5,128);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
275,6,128);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
276,7,128);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
277,0,129);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
278,1,129);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
279,3,129);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
280,5,129);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
281,6,129);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
282,7,129);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
283,0,130);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
284,1,130);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
285,3,130);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
286,5,130);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
287,6,130);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
288,7,130);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
289,0,131);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
290,1,131);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
291,3,131);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
292,5,131);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
293,6,131);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
294,7,131);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
295,0,132);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
296,7,132);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
297,0,133);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
298,1,133);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
299,3,133);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
300,4,133);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
301,5,133);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
302,6,133);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
303,7,133);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
304,0,134);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
305,1,134);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
306,3,134);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
307,5,134);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
308,6,134);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
309,7,134);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
310,0,135);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
311,1,135);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
312,3,135);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
313,5,135);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
314,6,135);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
315,7,135);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
316,2,136);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
317,4,136);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
318,2,137);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
319,4,137);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
320,2,138);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
321,4,138);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
322,2,139);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
323,4,139);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
324,2,140);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
325,4,140);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
326,2,141);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
327,4,141);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
328,2,142);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
329,4,142);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
330,2,143);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
331,4,143);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
332,2,144);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
333,2,145);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
334,4,145);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
335,0,147);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
336,1,147);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
337,3,147);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
338,5,147);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
339,6,147);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
340,7,147);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
341,0,148);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
342,1,148);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
343,3,148);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
344,5,148);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
345,6,148);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
346,0,149);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
347,7,149);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
348,0,150);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
349,1,150);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
350,3,150);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
351,5,150);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
352,6,150);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
353,7,150);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
354,0,151);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
355,7,151);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
356,0,152);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
357,1,152);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
358,3,152);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
359,5,152);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
360,6,152);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
361,7,152);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
362,0,153);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
363,1,153);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
364,3,153);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
365,5,153);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
366,6,153);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
367,7,153);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
368,1,154);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
369,3,154);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
370,5,154);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
371,6,154);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
372,0,155);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
373,1,155);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
374,3,155);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
375,5,155);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
376,6,155);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
377,7,155);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
378,0,156);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
379,7,156);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
380,0,157);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
381,1,157);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
382,3,157);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
383,5,157);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
384,6,157);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
385,7,157);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
386,0,158);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
387,1,158);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
388,3,158);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
389,5,158);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
390,6,158);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
391,7,158);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
392,0,159);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
393,1,159);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
394,3,159);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
395,5,159);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
396,6,159);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
397,7,159);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
398,0,160);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
399,1,160);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
400,3,160);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
401,5,160);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
402,6,160);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
403,7,160);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
404,3,161);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
405,4,161);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
406,6,161);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
407,0,162);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
408,7,162);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
409,0,163);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
410,1,163);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
411,3,163);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
412,5,163);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
413,6,163);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
414,7,163);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
415,3,164);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
416,4,164);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
417,6,164);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
418,0,165);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
419,7,165);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
420,1,166);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
421,3,166);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
422,5,166);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
423,6,166);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
424,1,167);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
425,3,167);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
426,5,167);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
427,6,167);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
428,1,168);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
429,3,168);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
430,5,168);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
431,6,168);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
432,5,169);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
433,3,170);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
434,6,170);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
435,1,171);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
436,5,171);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
437,1,172);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
438,3,172);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
439,5,172);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
440,6,172);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
441,1,173);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
442,3,173);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
443,5,173);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
444,6,173);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
445,2,174);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
446,2,175);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
447,4,175);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
448,2,176);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
449,4,176);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
450,2,177);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
451,4,177);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
452,2,178);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
453,4,178);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
454,2,179);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
455,4,179);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
456,2,180);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
457,4,180);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
458,2,181);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
459,4,181);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
460,2,182);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
461,4,182);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
462,2,183);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
463,4,183);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
464,2,184);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
465,4,184);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
466,2,185);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
467,4,185);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
468,4,186);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
469,2,187);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
470,4,187);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
471,2,188);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
472,2,189);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
473,4,189);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
474,0,190);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
475,1,190);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
476,2,190);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
477,3,190);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
478,4,190);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
479,5,190);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
480,6,190);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
481,7,190);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
482,0,191);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
483,1,191);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
484,2,191);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
485,3,191);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
486,4,191);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
487,5,191);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
488,6,191);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
489,7,191);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
490,0,192);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
491,1,192);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
492,2,192);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
493,3,192);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
494,4,192);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
495,5,192);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
496,6,192);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
497,7,192);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
498,0,194);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
499,1,194);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
500,2,194);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
501,3,194);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
502,4,194);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
503,5,194);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
504,6,194);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
505,7,194);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
506,0,195);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
507,1,195);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
508,2,195);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
509,3,195);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
510,4,195);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
511,5,195);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
512,6,195);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
513,7,195);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
514,0,196);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
515,1,196);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
516,2,196);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
517,3,196);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
518,4,196);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
519,5,196);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
520,6,196);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
521,7,196);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
522,3,197);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
523,4,197);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
524,6,197);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
525,7,197);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
526,0,198);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
527,1,198);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
528,2,198);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
529,3,198);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
530,4,198);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
531,5,198);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
532,6,198);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
533,7,198);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
534,0,199);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
535,1,199);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
536,2,199);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
537,3,199);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
538,4,199);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
539,5,199);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
540,6,199);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
541,7,199);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
542,0,200);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
543,1,200);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
544,2,200);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
545,3,200);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
546,4,200);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
547,5,200);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
548,6,200);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
549,7,200);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
550,0,201);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
551,1,201);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
552,2,201);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
553,3,201);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
554,4,201);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
555,5,201);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
556,6,201);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
557,7,201);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
558,0,202);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
559,1,202);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
560,2,202);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
561,3,202);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
562,4,202);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
563,5,202);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
564,6,202);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
565,7,202);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
566,0,203);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
567,1,203);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
568,2,203);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
569,3,203);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
570,4,203);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
571,5,203);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
572,6,203);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
573,7,203);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
574,0,204);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
575,1,204);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
576,2,204);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
577,3,204);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
578,4,204);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
579,5,204);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
580,6,204);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
581,7,204);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
582,0,205);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
583,1,205);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
584,2,205);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
585,3,205);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
586,4,205);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
587,5,205);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
588,6,205);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
589,7,205);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
590,0,206);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
591,1,206);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
592,2,206);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
593,3,206);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
594,4,206);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
595,5,206);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
596,6,206);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
597,7,206);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
598,0,207);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
599,1,207);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
600,2,207);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
601,3,207);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
602,4,207);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
603,5,207);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
604,6,207);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
605,7,207);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
606,0,208);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
607,1,208);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
608,2,208);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
609,3,208);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
610,4,208);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
611,5,208);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
612,6,208);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
613,7,208);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
614,0,209);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
615,1,209);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
616,2,209);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
617,3,209);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
618,4,209);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
619,5,209);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
620,6,209);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
621,7,209);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
622,0,210);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
623,1,210);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
624,2,210);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
625,3,210);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
626,4,210);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
627,5,210);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
628,6,210);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
629,7,210);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
630,0,211);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
631,1,211);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
632,2,211);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
633,3,211);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
634,4,211);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
635,5,211);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
636,6,211);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
637,7,211);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
638,3,212);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
639,4,212);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
640,6,212);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
641,0,213);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
642,1,213);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
643,2,213);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
644,3,213);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
645,4,213);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
646,5,213);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
647,6,213);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
648,7,213);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
649,3,214);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
650,4,214);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
651,6,214);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
652,3,215);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
653,4,215);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
654,6,215);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
655,3,216);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
656,4,216);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
657,6,216);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
658,3,217);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
659,4,217);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
660,6,217);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
661,0,218);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
662,1,218);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
663,2,218);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
664,3,218);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
665,4,218);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
666,5,218);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
667,6,218);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
668,7,218);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
669,3,219);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
670,4,219);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
671,6,219);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
672,3,220);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
673,4,220);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
674,6,220);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
675,0,221);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
676,1,221);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
677,2,221);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
678,3,221);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
679,4,221);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
680,5,221);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
681,6,221);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
682,7,221);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
683,0,222);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
684,1,222);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
685,2,222);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
686,3,222);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
687,4,222);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
688,5,222);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
689,6,222);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
690,7,222);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
691,0,223);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
692,1,223);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
693,2,223);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
694,3,223);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
695,4,223);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
696,5,223);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
697,6,223);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
698,7,223);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
699,0,224);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
700,1,224);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
701,2,224);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
702,3,224);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
703,4,224);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
704,5,224);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
705,6,224);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
706,7,224);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
707,0,225);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
708,1,225);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
709,2,225);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
710,3,225);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
711,4,225);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
712,5,225);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
713,6,225);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
714,7,225);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
715,0,226);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
716,1,226);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
717,2,226);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
718,3,226);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
719,4,226);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
720,5,226);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
721,6,226);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
722,7,226);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
723,0,227);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
724,1,227);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
725,2,227);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
726,3,227);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
727,4,227);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
728,5,227);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
729,6,227);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
730,7,227);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
731,0,228);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
732,1,228);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
733,2,228);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
734,3,228);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
735,4,228);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
736,5,228);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
737,6,228);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
738,7,228);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
739,0,229);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
740,1,229);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
741,2,229);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
742,3,229);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
743,4,229);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
744,5,229);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
745,6,229);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
746,7,229);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
747,0,230);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
748,1,230);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
749,2,230);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
750,3,230);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
751,4,230);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
752,5,230);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
753,6,230);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
754,7,230);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
755,0,231);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
756,1,231);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
757,2,231);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
758,3,231);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
759,4,231);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
760,5,231);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
761,6,231);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
762,7,231);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
763,0,232);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
764,1,232);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
765,2,232);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
766,3,232);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
767,4,232);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
768,5,232);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
769,6,232);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
770,7,232);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
771,0,233);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
772,1,233);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
773,2,233);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
774,3,233);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
775,4,233);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
776,5,233);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
777,6,233);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
778,7,233);
INSERT INTO [CharacterEquipmentJoin] ([CharacterEquipmentId],[CharacterId],[EquipmentId]) VALUES (
779,6,234);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
85,0,0,6,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
86,0,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
87,0,0,7,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
88,0,0,9,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
89,2,0,6,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
90,0,0,10,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
91,0,2,12,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
92,0,0,14,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
93,0,0,17,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
94,1,0,16,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
95,0,0,17,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
96,1,0,19,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
97,0,0,21,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
98,0,0,23,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
99,0,0,27,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
100,1,0,26,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
101,0,0,32,2);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
102,1,0,35,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
103,0,2,37,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
104,3,0,33,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
105,0,3,38,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
106,0,0,39,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
107,2,0,47,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
108,0,0,51,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
109,0,0,5,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
110,0,0,6,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
111,0,0,7,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
112,0,0,9,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
113,0,0,11,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
114,0,0,13,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
115,0,0,16,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
116,0,0,20,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
117,0,0,23,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
118,0,0,26,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
119,2,0,29,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
120,0,0,33,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
121,0,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
122,0,5,0,3);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
123,0,7,0,5);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
124,0,10,0,7);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
125,0,13,0,9);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
126,0,17,0,11);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
127,0,18,0,16);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
128,0,22,0,14);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
129,0,20,0,20);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
130,2,27,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
131,0,0,0,29);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
132,0,26,0,13);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
133,0,29,0,12);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
134,0,30,0,10);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
135,0,35,0,10);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
136,0,8,0,2);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
137,0,10,0,5);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
138,0,13,0,7);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
139,0,16,0,10);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
140,0,19,0,13);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
141,0,17,1,26);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
142,1,25,1,20);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
143,0,27,0,17);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
144,1,30,0,10);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
145,0,36,0,7);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
146,0,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
147,6,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
148,7,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
149,8,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
150,9,0,1,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
151,10,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
152,12,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
153,14,0,1,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
154,15,0,2,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
155,17,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
156,20,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
157,23,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
158,27,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
159,25,0,2,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
160,31,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
161,34,0,1,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
162,35,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
163,37,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
164,39,0,1,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
165,42,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
166,10,0,2,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
167,16,0,2,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
168,21,0,3,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
169,41,0,4,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
170,42,0,4,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
171,43,0,4,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
172,41,0,6,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
173,46,0,5,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
174,62,32,27,17);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
175,9,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
176,10,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
177,12,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
178,15,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
179,17,0,1,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
180,19,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
181,23,0,5,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
182,27,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
183,33,0,2,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
184,36,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
185,39,0,1,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
186,42,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
187,45,0,1,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
188,54,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
189,59,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
190,0,2,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
191,0,0,0,6);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
192,0,2,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
193,0,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
194,0,3,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
195,2,0,1,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
196,0,4,0,4);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
197,0,5,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
198,2,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
199,1,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
200,0,0,0,5);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
201,0,0,2,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
202,1,2,3,2);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
203,0,0,1,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
204,0,0,0,3);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
205,0,3,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
206,0,0,2,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
207,2,4,3,6);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
208,0,5,1,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
209,1,0,2,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
210,0,0,0,1);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
211,0,2,0,1);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
212,2,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
213,0,4,0,2);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
214,0,0,0,4);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
215,0,0,1,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
216,0,0,1,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
217,1,0,1,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
218,1,5,1,4);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
219,0,0,1,3);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
220,0,4,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
221,0,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
222,0,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
223,0,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
224,0,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
225,0,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
226,0,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
227,0,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
228,0,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
229,0,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
230,0,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
231,0,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
232,0,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
233,0,0,0,0);
INSERT INTO [Armor] ([EquipmentId],[Defense],[Evade],[MagicDefense],[MagicEvade]) VALUES (
234,0,0,0,0);
INSERT INTO [AbilityType] ([AbilityTypeId],[Name]) VALUES (
0,'Support');
INSERT INTO [AbilityType] ([AbilityTypeId],[Name]) VALUES (
1,'Thief Skills');
INSERT INTO [AbilityType] ([AbilityTypeId],[Name]) VALUES (
2,'Black Magic');
INSERT INTO [AbilityType] ([AbilityTypeId],[Name]) VALUES (
3,'Sword Art');
INSERT INTO [AbilityType] ([AbilityTypeId],[Name]) VALUES (
4,'Summon');
INSERT INTO [AbilityType] ([AbilityTypeId],[Name]) VALUES (
5,'White Magic');
INSERT INTO [AbilityType] ([AbilityTypeId],[Name]) VALUES (
6,'Dragon');
INSERT INTO [AbilityType] ([AbilityTypeId],[Name]) VALUES (
7,'Blue Magic');
INSERT INTO [AbilityType] ([AbilityTypeId],[Name]) VALUES (
8,'Flair');
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
0,'Ability Up',0,'Doubles AP gained after battle for character(s) on which it''s equipped. ',3);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
1,'Absorb MP',0,'If hit with a enemy spell, absorb as MP the MP cost of the spell cast. ',6);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
2,'Accuracy+',0,'Physical attacks never miss (even if the target is under Vanish). ',2);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
3,'Add Status',0,'Adds weapon status effect to regular weapon attacks (except Thief Swords). Base chance of inflicting a status depends on the specific weapon. ',3);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
4,'Alert',0,'Prevents Back Attacks against your party (does not work with forced Back Attacks). ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
5,'Antibody',0,'Prevents Poison and Venom. ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
6,'Auto-Float',0,'Gives character inherent, unremovable Float status while equipped. ',6);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
7,'Auto-Haste',0,'Gives character inherent, unremovable Haste status while equipped. This also grants immunity to the Slow status.',9);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
8,'Auto-Life',0,'Character receives Auto-Life status at the beginning of battle. The status can be removed through the normal means. ',12);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
9,'Auto-Potion',0,'If character is damaged, they automatically use the lowest-level Potion available in inventory. ',3);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
10,'Auto-Reflect',0,'Gives character inherent, unremovable Reflect status while equipped. ',15);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
11,'Auto-Regen',0,'Gives character inherent, unremovable Regen status while equipped. ',10);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
12,'Bandit',0,'Causes Steal command to never miss. Does not affect the probability of actually getting an item. ',5);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
13,'Beast Killer',0,'Deals 1.5x normal damage to Beast-type enemies. Does not stack with other -Killer abilities if enemy is in more than one category. ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
14,'Bird Killer',0,'Deals 1.5x normal damage to Bird-type (flying) enemies. Does not stack with other -Killer abilities if enemy is in more than one category. ',3);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
15,'Body Temp',0,'Prevents Heat and Freeze statuses. ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
16,'Boost',0,'Causes all Summons (except the random free Summons during Dagger''s Trance) to be the long animation. ',12);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
17,'Bright Eyes',0,'Prevents Darkness status. Does not remove the status if it was present when the ability was equipped. ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
18,'Bug Killer',0,'Deals 1.5x normal damage to Bug-type (insect) enemies. Does not stack with other -Killer abilities if enemy is in more than one category. ',2);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
19,'Chemist',0,'Doubles the power of Potion, Hi-Potion, and Ether. ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
20,'Clear Headed',0,'Prevents Confuse status. ',5);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
21,'Concentrate',0,'Cure, Cura, and Curaga heal 1.5x normal healing, and power of Life, Full-Life, and Phoenix (the revival portion) is doubled. Contrary to the in-game description, this does not affect other spells. ',10);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
22,'Counter',0,'If attacked physically (regardless of whether the attack hit or not), character has a percentage chance equal to their Spirit stat to counter with a basic physical attack. ',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
23,'Cover',0,'Takes physical damage for any character with 1/6 or less of their max HP remaining. ',6);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
24,'Devil Killer',0,'Deals 1.5x normal damage to Demon-type enemies. Does not stack with other -Killer abilities if enemy is in more than one category. ',2);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
25,'Distract',0,'Cuts enemies'' physical attack accuracy against the character by 1/2. ',5);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
26,'Dragon Killer',0,'Deals 1.5x normal damage to Dragons. Does not stack with other -Killer abilities if enemy is in more than one category. ',3);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
27,'Eye 4 Eye',0,'Doubles the chance to counter. Counter must be equipped as well, or this ability will do nothing. ',5);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
28,'Flee-Gil',0,'Party still wins Gil is battle escaped. Does not affect the Flee Skill. ',3);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
29,'Gamble Defense',0,'Character''s Defense is randomly set between 0 and 2x normal when attacked.',1);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
30,'Guardian Mog',0,'At the end of battle, removes all status ailments (except KO) from Eiko before Exp and AP are awarded. Does not work until party has obtained its first Ribbon item (but Eiko can learn the ability earlier), so don''t bother equipping it until then. ',3);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
31,'Half MP',0,'Cuts MP cost for all abilities by 1/2. ',11);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
32,'Healer',0,'Physical attacks heal the target. Undead targets will still take damage. ',2);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
33,'High Jump',0,'Doubles damage dealt by Jump command. ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
34,'High Tide',0,'Trance gauge fills (on average) twice as fast (High Tide causes it to fill by the character''s Spirit stat, as opposed to a random number up to the character''s Spirit stat like normal). ',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
35,'HP+10%',0,'Increases character''s maximum HP by 10%. ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
36,'HP+20%',0,'Increases character''s maximum HP by 20%. ',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
37,'Initiative',0,'Greatly increases party''s chance of a Pre-Emptive Strike. ',5);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
38,'Insomniac',0,'Prevents Sleep status. ',5);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
39,'Jelly',0,'Prevents Gradual Petrify and Petrify statuses. Does not remove the status if it was present when the ability was equipped. ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
40,'Level Up',0,'Character on which ability is equipped gains 1.5x normal Exp from battles. ',7);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
41,'Locomotion',0,'Prevents Stop status. ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
42,'Long Reach',0,'All physical attacks do normal damage from the Back Row and are able to hit out-of-reach targets. (Note: This effect is innate on Rackets.) ',16);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
43,'Loudmouth',0,'Prevents Silence status. Does not remove the status if it was present when the ability was equipped. ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
44,'Mag Elem Null',0,'Causes spells cast by Vivi to be non-elemental. ',13);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
45,'Man Eater',0,'Deals 1.5x normal damage to Human enemies. Does not stack with other -Killer abilities if enemy is in more than one category. ',2);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
46,'Master Thief',0,'Raises chances for Stealing items in the Rare and Semi-Rare slots to 1/8 chance for each. Also causes the Steal ability to ignore empty slots when trying to Steal. ',5);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
47,'Millionaire',0,'Multiplies Gil earned after battle by 1.5x. Does not impact other sources of Gil (such as selling items or completing quests). ',5);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
48,'MP+10%',0,'Increases character''s maximum MP by 10%. ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
49,'MP+20%',0,'Increases character''s maximum MP by 20%. ',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
50,'MP Attack',0,'Regular attacks use 1/8 of character''s maximum MP but are 1.5x more powerful. ',5);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
51,'Mug',0,'Deal damage while Stealing. ',3);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
52,'Odin''s Sword',0,'If Odin''s Zantetsuken fails to kill a target, deals damage to it instead. ',5);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
53,'Power Throw',0,'Causes Throw to be powered up by 2.5x instead of 2x. ',19);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
54,'Power Up',0,'Doubles power of Chakra. (Other abilities are not affected.) ',3);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
55,'Protect Girls',0,'Takes physical damage for female characters who have 50% or less of their maximum HP remaining. ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
56,'Reflect-Null',0,'Ignores Reflect status on spells cast by character. ',7);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
57,'Reflectx2',0,'Doubles the power of spells cast by Vivi and bounced off Reflect barriers. ',17);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
58,'Restore HP',0,'If character has less than 1/6 of maximum HP remaining and they take damage and survive, 50% of their max HP will be restored. ',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
59,'Return Magic',0,'If hit by an offensive spell, the character will counter with the same spell. No MP is used, and the character does not need to know the spell. ',9);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
60,'Steal Gil',0,'Steal Gil along with Items. ',5);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
61,'Stone Killer',0,'Deals 1.5x normal damage to Stone-based enemies. Does not stack with other -Killer abilities if enemy is in more than one category. ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
62,'Undead Killer',0,'Deals 1.5x normal damage to Undead enemies. Does not stack with other -Killer abilities if enemy is in more than one category. ',2);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
63,'Flee',1,'Flees battle. Always succeeds unless the battle is inescapable. ',0);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
64,'Detect',1,'Displays a list of an enemy''s remaining Steal-able items. ',0);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
65,'What''s That?!',1,'If successful, party gains a back attack against the enemy party. ',2);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
66,'Soul Blade',1,'Inflicts equipped thief sword''s Add Status status on one enemy. Fails if Zidane is equipped with a dagger. ',6);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
67,'Annoy',1,'Inflicts Trouble status on one enemy. ',6);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
68,'Sacrifice',1,'Inflicts KO status on self to replenish party''s HP and MP. ',32);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
69,'Lucky Seven',1,'If user''s HP ends in 7, deals 7, 77, 777, or 7777 damage to one enemy (damage amount chosen at random). ',6);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
70,'Thievery',1,'Attack deals 1 point physical damage per successful Steal attempt on the file (includes steals from Marcus, Blank, and Cinna as well). Damage caps at 9,999. ',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
71,'Fire',2,'Deals low (14 base power) Fire-elemental damage to one or multiple targets. ',6);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
72,'Fira',2,'Deals medium (29 base power) Fire-elemental damage to one or multiple targets. ',12);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
73,'Firaga',2,'Deals high (72 base power) Fire-elemental damage to one or multiple targets. ',24);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
74,'Sleep ',2,'Inflicts Sleep status on one or multiple targets with 50% base accuracy. ',10);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
75,'Blizzard',2,'Deals low (14 base power) Ice-elemental damage to one or multiple targets. ',6);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
76,'Blizzara',2,'Deals medium (29 base power) Ice-elemental damage to one or multiple targets. ',12);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
77,'Blizzaga',2,'Deals high (72 base power) Ice-elemental damage to one or multiple targets. ',24);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
78,'Slow ',2,'Inflicts Slow status on one target with 60% base accuracy. ',26);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
79,'Thunder',2,'Deals low (14 base power) Thunder-elemental damage to one or multiple targets. ',6);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
80,'Thundara',2,'Deals medium (29 base power) Thunder-elemental damage to one or multiple targets. ',12);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
81,'Thundaga',2,'Deals high (72 base power) Thunder-elemental damage to one or multiple targets. ',24);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
82,'Stop ',2,'Inflicts Stop status on one target with 40% base accuracy. ',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
83,'Poison ',2,'Inflicts Poison status on one or multiple targets with 60% base accuracy.',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
84,'Bio',2,'Inflicts medium (42 base power) non-elemental damage plus Poison status (20% base status accuracy). Note that the spell can still hit for damage even if Poison is not set. ',18);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
85,'Osmose',2,'Drains MP (15 base power) from one target and gives it to Vivi. If target is Undead, Vivi will lose MP instead. ',2);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
86,'Drain',2,'Drains HP (32 base power) from one target and gives it to Vivi. If target is Undead, Vivi will lose HP instead. ',14);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
87,'Demi',2,'Reduces target''s HP by 1/4 of its maximum HP with 40% base accuracy. Fails against bosses. ',18);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
88,'Comet',2,'Deals random defense-ignoring non-elemental damage (56 base power, however this effectively serves as the upper damage limit due to the spell''s mechanics) to one target with 66.4% accuracy. ',16);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
89,'Death',2,'Inflicts KO status on one target with 35% base accuracy. Heals Undeads to full HP. ',20);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
90,'Break',2,'Inflicts Petrify status on one target with 40% base accuracy. ',18);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
91,'Water',2,'Inflicts high (64 base power) Water-elemental damage on one or multiple targets. ',22);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
92,'Meteor',2,'Inflicts random defense-ignoring non-elemental damage (88 base power, however this effectively serves as the upper damage limit due to the spell''s mechanics) on all enemies. Sometimes misses; as the target''s Spirit stat rises, so does the probability of a miss. ',42);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
93,'Flare',2,'Inflicts extreme (119 base power) non-elemental damage on one target. ',40);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
94,'Doomsday',2,'Inflicts extreme (112 base power) Shadow-elemental damage to all targets (friend and foe). ',72);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
95,'Darkside',3,'Darkside is an interesting attack: it deals fairly-heavy Shadow-elemental damage at no MP cost and ignores Mini status on Steiner and Protect on the target, but each use knocks off 1/8 of Steiner''s maximum HP. It''s mostly useless, though there are a few situations where it''s highly useful. ',0);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
96,'Minus Strike',3,'Inflicts damage equal to Steiner''s Max HP - Steiner''s Current HP. ',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
97,'Iai Strike',3,'Inflicts KO status on target with 30% base accuracy. ',16);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
98,'Power Break',3,'Reduces Strength stat of one enemy by 25% with 50% base accuracy. Can be used repeatedly to "stack" the effect. ',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
99,'Armor Break',3,'Reduces Defense stat of one enemy by half with 50% base accuracy. Can be used repeatedly to "stack" the effect. ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
100,'Mental Break',3,'Reduces Magic Defense stat of one enemy by half with 50% base accuracy. Can be used repeatedly to "stack" the effect. ',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
101,'Magic Break',3,'Reduces Magic stat of one enemy by 25% with 50% base accuracy. Can be used repeatedly to "stack" the effect. ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
102,'Charge!',3,'Causes all characters in Critical HP to attack with standard physical attacks. ',10);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
103,'Thunder Slash',3,'Thunder Slash was supposed to hit for heavy Thunder-elemental damage, but due to the Thunder Slash Bug only hits for 19% of the enemy''s max HP and usually misses. Stay away from this skill, unless you''re using a patch or cheat code to fix the bug. Note that the bug only affects Steiner... ',24);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
104,'Stock Break',3,'Hits all enemies for heavy damage in the element of the equipped weapon. ',26);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
105,'Climhazzard',3,'Hits all enemies for double normal weapon power in magical non-elemental damage. Note that Mini status on the user and Shell will both halve damage. ',32);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
106,'Shock',3,'Deals extreme physical damage to one target in the element of your equipped weapon. ',32);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
107,'Shiva',4,'Deals medium (36 base power) Ice-elemental damage to all enemies. ',24);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
108,'Ifrit',4,'Deals medium (42 base power) Fire-elemental damage to all enemies. ',26);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
109,'Ramuh',4,'Deals medium (32 base power) Thunder-elemental damage to all enemies. ',22);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
110,'Atomos',4,'Deals 30% of maximum HP as damage to all enemies. Each Amethyst in your inventory adds 1% to the initial 30% damage figure, meaning with 70 or more Amethysts in inventory and the long animation Atomos will OHKO all enemies with 9,999 HP or less, and deal 9,999 a shot to all enemies with more. Fails against bosses. ',32);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
111,'Odin',4,'Odin''s attack is strongly influenced by the Odin''s Sword Support Ability. First, Odin will attempt to inflict KO status on all enemies. The base chance is the amount of Ore in your inventory divided by 2 and expressed as a percentage, then modified by the difference between one-quarter Dagger''s Magic stat and her Level minus the enemy''s Level. At this point, if Odin''s Sword is not equipped, or if all enemies were KO''d successfully, the attack ends; otherwise, the Odin''s Sword ability causes Odin to use a damage attack (base power = 145 - Ore in inventory) on all enemies that weren''t KO''d. With a low Ore count this can potentially out-power even Ark, but you may not want to spend the stones on Odin''s Sword, depending on your strategy. ',28);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
112,'Leviathan',4,'Deals heavy (59 base power) Water-elemental damage to all enemies. ',42);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
113,'Bahamut',4,'Deals heavy (88 base power) non-elemental damage to all enemies. ',56);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
114,'Ark',4,'Deals extreme (106 base power) Shadow-elemental damage to all enemies. With even a small stack of Lapis Lazuli in your inventory and the long animation, Ark is the strongest normal-damage-formula attack in the game and hits all enemies (it even outpowers Madeen, although Ark is of an inferior element). You can also cheese out the long animation version especially: equip everyone with Auto-Regen and Dagger with Boost, then Summon Ark anytime your HP gets low and don''t enter the menu. Everyone will Regen most of their lost HP, after which the enemy will take heavy damage. This attack rocks, and is frankly one of the only reasons to bother with Dagger after Eiko joins up (the other is Bahamut, which is likewise capable of out-powering Madeen and is non-elemental). ',80);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
115,'Fenrir',4,'Normally, Fenrir deals medium (42 base power) Earth-elemental damage to all enemies. However, if Eiko has a Maiden Prayer equipped, Fenrir deals medium (44 base power) Wind-elemental damage to all enemies. ',30);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
116,'Phoenix',4,'Revives all KO''d allies (the amount of HP they will have is dependent on the ally''s Spirit stat) and hits all enemies for medium (40 base power) Fire-elemental damage (not increased by any Gem). In addition, if the entire party is KO''d and Eiko is in the party, there is a chance Phoenix will be Summoned as a final attack (the chance increases depending on the number of Phoenix Pinions in your inventory), reviving all allies but dealing no damage to the enemy party and costing no MP. ',32);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
117,'Carbuncle',4,'Summons Carbuncle, which buffs your party based upon Eiko''s equipped Add-on',24);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
118,'Madeen',4,'Deals heavy (71 base power) Holy-elemental damage to all enemies. ',54);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
119,'Cure',5,'Heals a small amount of HP (16 base power) to one or multiple targets. Damages Undeads. ',6);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
120,'Cura',5,'Heals a moderate amount of HP (38 base power) to one or multiple targets. Damages Undeads.',10);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
121,'Curaga',5,'Curaga',22);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
122,'Regen ',5,'Sets Regen status on one target. ',14);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
123,'Life',5,'Revives one target from KO status. Reduces Undeads to single-digit HP. ',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
124,'Full-Life',5,'Revives one target from KO status, typically restoring them to full HP. Instantly KO''s Undeads. ',24);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
125,'Scan',5,'Shows one target''s HP, MP, and elemental weaknesses (if any). Fails on many bosses. ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
126,'Panacea',5,'Removes Poison and Venom from one target. ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
127,'Stona',5,'Removes Petrify and Gradual Petrify from one target. ',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
128,'Esuna',5,'Removes most Status Ailments (except KO, Doom, and Zombie) from one target. ',6);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
129,'Shell',5,'Applies Shell status to one target. ',6);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
130,'Protect ',5,'Applies Protect status to one target. ',6);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
131,'Haste ',5,'Applies Haste status to one target. ',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
132,'Silence',5,'Inflicts Silence on one target with 50% base accuracy. ',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
133,'Mini ',5,'Inflicts Mini on one target with 50% base accuracy. ',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
134,'Reflect ',5,'Applies Reflect status to one target. ',6);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
135,'Confuse ',5,'Inflicts Confuse on one target with 50% base accuracy. ',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
136,'Berserk ',5,'Inflicts Berserk status on one target with 50% base accuracy. ',6);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
137,'Blind',5,'Inflicts Darkness status on one target with 75% base accuracy. ',6);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
138,'Float ',5,'Applies Float status to one target. ',6);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
139,'Dispel',5,'Removes Shell, Protect, Haste, Reflect, Regen, Float, Vanish, and Auto-Life statuses from one target. ',16);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
140,'Might',5,'increases one target''s Strength stat by 25% for the duration of the battle, up to a total maximum of 99 Strength. This ability can be used multiple times to "stack" the effect. ',14);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
141,'Jewel',5,'Extracts one Ore from target and adds it to inventory (50% base accuracy). This can be done as often as you like (enemies will never "run out"). ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
142,'Holy',5,'Inflicts extreme (113 base power) Holy-elemental damage on one target. ',36);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
143,'Lancer',6,'Deals 120% normal weapon damage, and drains 1/6th of the damage done as MP added to Freya''s current MP. ',10);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
144,'Reis''s Wind',6,'Applies Regen status on all characters. ',12);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
145,'Dragon Breath',6,'Deals damage to all enemies equal to target''s max HP - target''s current HP. ',78);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
146,'White Draw',6,'Damages an enemy''s MP and restores to each party member a small amount of MP. ',36);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
147,'Luna',6,'Inflicts Berserk on all targets (friends and foes). ',12);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
148,'Six Dragons',6,'For each ally, randomly restores to maximum or reduces to 1 HP and/or MP. ',28);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
149,'Cherry Blossom',6,'Deals 150% normal weapon damage to one target. ',46);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
150,'Dragon''s Crest',6,'Deals damage equal to the square of the total number of Dragons you''ve defeated (for example, if you kill 50 dragons, this will deal 502 = 2,500 damage) to one enemy. ',16);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
151,'Goblin Punch',7,'Inflicts a low (20 base power) amount of non-elemental magic damage to one target. Should Quina''s level be the same as the target''s, damage is increased. ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
152,'LV5 Death',7,'Inflicts KO status on all enemies with a level that is a multiple of 5. ',20);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
153,'LV4 Holy',7,'Inflicts medium (34 base power) Holy-elemental damage on all enemies with a level that is a multiple of 4. ',22);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
154,'LV3 Def-less',7,'Reduces Defense and Magic Defense by a random amount (between 0 and the enemy''s total Defense/Magic Defense) for all enemies with a level that is a multiple of 3. ',12);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
155,'Doom ',7,'Inflicts Doom status on one target with 25% base accuracy. ',12);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
156,'Roulette',7,'Inflicts unblockable KO status on a random target (can be character or monster, can also hit caster). ',18);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
157,'Aqua Breath',7,'Inflicts Water-elemental damage equal to 25% of all enemies'' maximum HP. Fails against bosses. ',14);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
158,'Mighty Guard',7,'Applies Protect and Shell statuses to all characters. ',64);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
159,'Matra Magic',7,'Reduces one target''s HP to 1 with 20% base accuracy. Ideal for Eating enemies. ',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
160,'Bad Breath',7,'Inflicts Confuse, Darkness, Poison, Slow, and Mini on one enemy with a base accuracy of 40%. ',16);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
161,'Limit Glove',7,'If caster''s HP is greater than 1, attack misses. If caster''s HP equals 1, inflicts 9,999 unblockable non-elemental damage to one target. ',10);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
162,'1,000 Needles',7,'Inflicts 1,000 fixed non-elemental damage to one target. ',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
163,'Pumpkin Head',7,'Inflicts damage to one target equal to caster''s maximum HP - caster''s current HP. ',12);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
164,'Night',7,'Inflicts Sleep status on all targets (allies and enemies) with 100% accuracy (misses if target is immune to status). ',14);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
165,'Twister',7,'Inflicts random Wind-elemental damage to all enemies, capped at 55x the total of caster''s level and Magic stat (before elemental effects are considered). ',22);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
166,'Earth Shake',7,'Inflicts heavy (75 base power) Earth-elemental damage on all enemies. ',20);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
167,'Angel''s Snack',7,'Uses 1 Remedy item on each party member. If there are Remedy items in inventory but not enough for the entire party, all remaining Remedy items are used on a random party member (but never on the same party member twice). If no Remedy items are in inventory, the move cancels and your turn is lost. Highly useful in fights where statuses come into play. ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
168,'Frog Drop',7,'Inflicts damage equal to caster''s level times the number of frogs Quina has caught to one enemy. ',10);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
169,'White Wind',7,'Every party member recovers HP equal to 1/3 of the caster''s maximum HP. ',14);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
170,'Vanish ',7,'Applies Vanish status to one target. ',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
171,'Frost',7,'Inflicts Freeze status on one target with 30% base accuracy. ',8);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
172,'Mustard Bomb',7,'Inflicts Heat status on one target with 30% base accuracy. ',10);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
173,'Magic Hammer',7,'Damages target''s MP by a random amount up to the target''s current HP total. ',2);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
174,'Auto-Life',7,'Applies Auto-Life status to one target. ',14);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
175,'Aura',8,'Applies Regen and Auto-Life to one target. ',12);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
176,'Chakra',8,'Restores 20% each of one character''s HP and MP. If Power Up is equipped, this doubles to 40%. ',4);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
177,'Countdown',8,'Inflicts Doom status on one target with 50% base accuracy. ',16);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
178,'Curse',8,'Makes one enemy weak to a random element. Can be used repeatedly. ',12);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
179,'Demi Shock',8,'Damages one enemy for 20% of its maximum HP. Fails against bosses. ',20);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
180,'No Mercy',8,'Inflicts 1.5x normal weapon damage in the element of Amarant''s equipped weapon. ',12);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
181,'Revive',8,'Revives one target from KO status. ',20);
INSERT INTO [Ability] ([AbilityId],[Name],[AbilityTypeId],[Description],[Cost]) VALUES (
182,'Spare Change',8,'Throws Gil at one enemy, dealing damage. The amount of damage and Gil lost depend on Amarant''s Level (and the damage also upon his Spirit). ',0);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
443,0,63);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
444,1,63);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
445,1,64);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
446,2,12);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
447,3,67);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
448,3,69);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
449,4,63);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
450,5,64);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
451,6,65);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
452,6,55);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
453,7,66);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
454,8,68);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
455,8,69);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
456,9,69);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
457,10,70);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
458,11,67);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
459,12,68);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
460,13,69);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
461,13,70);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
462,14,63);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
463,15,13);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
464,16,96);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
465,17,99);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
466,18,95);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
467,19,100);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
468,20,102);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
469,21,98);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
470,22,101);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
471,23,97);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
472,24,103);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
473,26,104);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
474,27,105);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
475,28,106);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
476,28,103);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
477,29,96);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
478,29,105);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
479,29,104);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
480,30,26);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
481,31,144);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
482,32,143);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
483,32,34);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
484,33,146);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
485,34,147);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
486,35,148);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
487,36,149);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
488,36,37);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
489,37,150);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
490,37,144);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
491,38,149);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
492,38,150);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
493,38,146);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
494,39,145);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
495,40,176);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
496,40,22);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
497,41,182);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
498,41,22);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
499,42,178);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
500,42,22);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
501,43,175);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
502,43,22);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
503,44,180);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
504,44,22);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
505,45,181);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
506,45,22);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
507,46,179);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
508,46,22);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
509,47,177);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
510,47,178);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
511,47,22);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
512,48,175);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
513,48,180);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
514,48,22);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
515,49,182);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
516,49,179);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
517,49,181);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
518,50,125);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
519,50,126);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
520,51,137);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
521,51,127);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
522,51,129);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
523,52,136);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
524,52,133);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
525,52,119);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
526,53,134);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
527,53,129);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
528,53,130);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
529,54,140);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
530,54,132);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
531,55,139);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
532,56,119);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
533,56,126);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
534,56,130);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
535,57,123);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
536,57,132);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
537,57,129);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
538,58,134);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
539,58,138);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
540,58,0);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
541,59,120);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
542,59,123);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
543,59,32);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
544,60,133);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
545,60,135);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
546,60,132);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
547,61,121);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
548,61,130);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
549,61,129);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
550,62,121);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
551,62,123);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
552,63,120);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
553,63,123);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
554,63,11);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
555,64,138);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
556,64,127);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
557,64,132);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
558,65,128);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
559,65,131);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
560,65,122);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
561,66,121);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
562,66,140);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
563,66,141);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
564,67,124);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
565,67,139);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
566,67,128);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
567,68,142);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
568,68,128);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
569,68,121);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
570,69,71);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
571,70,72);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
572,70,74);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
573,71,76);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
574,71,78);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
575,72,80);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
576,72,83);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
577,73,82);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
578,73,84);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
579,73,86);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
580,74,87);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
581,74,90);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
582,74,88);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
583,75,73);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
584,75,76);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
585,75,79);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
586,76,92);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
587,76,85);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
588,77,94);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
589,78,34);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
590,79,34);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
591,80,34);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
592,81,34);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
593,82,34);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
594,83,34);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
595,85,71);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
596,87,3);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
597,87,17);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
598,88,130);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
599,89,62);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
600,90,78);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
601,91,38);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
602,91,45);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
603,92,72);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
604,92,43);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
605,93,20);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
606,93,135);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
607,93,138);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
608,94,17);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
609,94,22);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
610,94,62);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
611,95,3);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
612,95,29);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
613,96,5);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
614,96,36);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
615,97,34);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
616,97,39);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
617,98,0);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
618,98,20);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
619,99,2);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
620,99,41);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
621,99,89);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
622,100,23);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
623,100,50);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
624,101,11);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
625,101,43);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
626,102,45);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
627,102,59);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
628,103,13);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
629,103,27);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
630,104,29);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
631,104,36);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
632,105,42);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
633,105,51);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
634,105,69);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
635,106,15);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
636,106,38);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
637,107,41);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
638,107,53);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
639,108,20);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
640,108,39);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
641,109,96);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
642,110,18);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
643,111,17);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
644,111,40);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
645,112,4);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
646,112,26);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
647,113,5);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
648,113,38);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
649,114,20);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
650,114,100);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
651,114,144);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
652,115,24);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
653,115,50);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
654,116,2);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
655,116,38);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
656,117,58);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
657,117,61);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
658,118,27);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
659,119,36);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
660,120,34);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
661,122,28);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
662,123,13);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
663,123,75);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
664,124,60);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
665,124,5);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
666,125,3);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
667,126,18);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
668,127,20);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
669,127,132);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
670,128,3);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
671,128,51);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
672,129,13);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
673,129,40);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
674,130,12);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
675,130,62);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
676,130,91);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
677,131,15);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
678,131,34);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
679,132,46);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
680,133,39);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
681,133,143);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
682,134,2);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
683,135,3);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
684,135,53);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
685,136,5);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
686,137,62);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
687,138,18);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
688,138,45);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
689,139,3);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
690,139,24);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
691,140,0);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
692,140,39);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
693,141,6);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
694,141,22);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
695,142,36);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
696,143,34);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
697,144,102);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
698,145,23);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
699,147,55);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
700,148,79);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
701,148,119);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
702,149,176);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
703,150,39);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
704,151,24);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
705,152,9);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
706,153,14);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
707,153,61);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
708,154,38);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
709,154,48);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
710,155,5);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
711,155,51);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
712,155,41);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
713,156,0);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
714,156,59);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
715,157,25);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
716,157,35);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
717,158,22);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
718,158,29);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
719,158,61);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
720,159,34);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
721,159,38);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
722,159,85);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
723,160,9);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
724,160,24);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
725,160,41);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
726,161,34);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
727,161,58);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
728,162,4);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
729,162,27);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
730,162,41);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
731,163,20);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
732,163,39);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
733,164,27);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
734,164,128);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
735,165,11);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
736,165,58);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
737,166,19);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
738,166,129);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
739,167,0);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
740,167,43);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
741,168,9);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
742,168,48);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
743,169,5);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
744,169,11);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
745,169,15);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
746,170,9);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
747,170,43);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
748,170,142);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
749,171,49);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
750,171,57);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
751,171,93);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
752,172,11);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
753,172,31);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
754,172,124);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
755,173,21);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
756,173,56);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
757,175,14);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
758,176,23);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
759,177,14);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
760,177,35);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
761,178,23);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
762,178,39);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
763,179,41);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
764,179,62);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
765,180,61);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
766,181,25);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
767,182,34);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
768,183,0);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
769,184,13);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
770,185,11);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
771,186,33);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
772,187,2);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
773,187,15);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
774,188,36);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
775,189,19);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
776,189,58);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
777,190,28);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
778,190,130);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
779,190,125);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
780,191,20);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
781,191,48);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
782,191,137);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
783,192,4);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
784,192,35);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
785,192,63);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
786,194,6);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
787,194,138);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
788,194,133);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
789,195,37);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
790,195,50);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
791,195,36);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
792,196,7);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
793,196,9);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
794,196,131);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
795,197,22);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
796,197,32);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
797,197,41);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
798,198,22);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
799,198,72);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
800,198,50);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
801,199,13);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
802,199,36);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
803,199,87);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
804,200,3);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
805,200,5);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
806,200,79);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
807,201,15);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
808,201,19);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
809,201,30);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
810,202,21);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
811,202,40);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
812,202,57);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
813,203,10);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
814,203,25);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
815,203,134);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
816,204,38);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
817,204,45);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
818,204,143);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
819,205,1);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
820,205,44);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
821,205,58);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
822,206,8);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
823,206,123);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
824,206,181);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
825,207,31);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
826,207,42);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
827,207,44);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
828,208,16);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
829,209,114);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
830,210,14);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
831,210,47);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
832,210,60);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
833,211,9);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
834,211,28);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
835,211,129);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
836,212,11);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
837,212,49);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
838,212,144);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
839,213,15);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
840,213,40);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
841,213,122);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
842,214,40);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
843,214,43);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
844,214,56);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
845,215,0);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
846,215,17);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
847,215,123);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
848,216,120);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
849,216,19);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
850,216,29);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
851,217,9);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
852,217,40);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
853,217,48);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
854,218,0);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
855,218,21);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
856,218,118);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
857,219,11);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
858,220,52);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
859,221,113);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
860,221,32);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
861,222,110);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
862,222,87);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
863,223,112);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
864,223,35);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
865,224,15);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
866,224,25);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
867,225,48);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
868,225,131);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
869,225,146);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
870,226,13);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
871,226,129);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
872,227,117);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
873,227,134);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
874,228,109);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
875,228,80);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
876,229,115);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
877,229,34);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
878,230,107);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
879,230,76);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
880,231,108);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
881,231,72);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
882,232,0);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
883,232,2);
INSERT INTO [EquipmentAbilityJoin] ([EquipmentAbilityId],[EquipmentId],[AbilityId]) VALUES (
884,234,116);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
1,0,10,95);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
2,0,7,55);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
3,0,8,130);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
4,0,2,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
5,0,42,170);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
6,0,14,24);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
7,0,61,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
8,0,24,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
9,0,45,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
10,0,60,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
11,0,29,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
12,0,22,70);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
13,0,27,60);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
14,0,4,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
15,0,0,95);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
16,0,38,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
17,0,17,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
18,0,39,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
19,0,41,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
20,0,51,65);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
21,0,6,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
22,0,11,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
23,0,36,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
24,0,25,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
25,0,50,45);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
26,0,18,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
27,0,62,45);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
28,0,13,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
29,0,46,50);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
30,0,3,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
31,0,34,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
32,0,55,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
33,0,15,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
34,0,40,75);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
35,0,28,45);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
36,0,5,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
37,0,58,85);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
38,0,9,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
39,0,20,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
40,0,63,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
41,0,64,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
42,0,65,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
43,0,66,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
44,0,67,50);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
45,0,68,55);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
46,0,69,55);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
47,0,70,55);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
48,1,10,70);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
49,1,7,55);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
50,1,8,70);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
51,1,32,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
52,1,56,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
53,1,44,85);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
54,1,34,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
55,1,40,75);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
56,1,38,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
57,1,43,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
58,1,59,90);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
59,1,41,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
60,1,6,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
61,1,11,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
62,1,49,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
63,1,3,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
64,1,57,110);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
65,1,31,140);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
66,1,15,15);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
67,1,0,55);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
68,1,5,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
69,1,39,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
70,1,9,10);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
71,1,20,15);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
72,1,71,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
73,1,72,50);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
74,1,73,75);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
75,1,74,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
76,1,75,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
77,1,76,50);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
78,1,77,85);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
79,1,78,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
80,1,79,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
81,1,80,50);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
82,1,81,85);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
83,1,82,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
84,1,83,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
85,1,84,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
86,1,85,70);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
87,1,86,60);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
88,1,87,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
89,1,88,55);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
90,1,89,45);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
91,1,90,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
92,1,91,55);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
93,1,92,95);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
94,1,93,95);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
95,1,94,150);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
96,2,10,95);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
97,2,7,65);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
98,2,8,155);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
99,2,36,60);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
100,2,25,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
101,2,50,50);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
102,2,18,50);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
103,2,62,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
104,2,13,55);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
105,2,3,50);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
106,2,34,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
107,2,23,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
108,2,15,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
109,2,40,75);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
110,2,38,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
111,2,17,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
112,2,39,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
113,2,41,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
114,2,6,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
115,2,11,75);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
116,2,35,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
117,2,2,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
118,2,42,200);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
119,2,14,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
120,2,61,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
121,2,24,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
122,2,45,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
123,2,19,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
124,2,22,65);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
125,2,27,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
126,2,4,50);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
127,2,0,70);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
128,2,5,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
129,2,58,100);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
130,2,9,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
131,2,20,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
132,2,95,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
133,2,96,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
134,2,97,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
135,2,98,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
136,2,99,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
137,2,100,45);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
138,2,101,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
139,2,102,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
140,2,103,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
141,2,104,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
142,2,105,70);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
143,2,106,60);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
144,3,10,75);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
145,3,7,55);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
146,3,8,105);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
147,3,32,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
148,3,56,45);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
149,3,31,125);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
150,3,15,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
151,3,0,60);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
152,3,5,15);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
153,3,39,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
154,3,41,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
155,3,16,190);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
156,3,6,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
157,3,11,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
158,3,49,45);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
159,3,19,15);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
160,3,21,55);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
161,3,34,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
162,3,40,75);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
163,3,38,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
164,3,43,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
165,3,9,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
166,3,20,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
167,3,52,50);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
168,3,119,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
169,3,120,50);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
170,3,121,155);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
171,3,123,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
172,3,125,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
173,3,126,15);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
174,3,127,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
175,3,129,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
176,3,130,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
177,3,132,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
178,3,133,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
179,3,134,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
180,3,135,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
181,3,136,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
182,3,137,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
183,3,138,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
184,3,107,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
185,3,108,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
186,3,109,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
187,3,110,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
188,3,111,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
189,3,112,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
190,3,113,80);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
191,3,114,100);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
192,4,10,95);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
193,4,7,75);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
194,4,8,125);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
195,4,36,75);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
196,4,2,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
197,4,42,210);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
198,4,14,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
199,4,61,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
200,4,26,70);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
201,4,13,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
202,4,33,75);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
203,4,29,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
204,4,34,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
205,4,23,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
206,4,15,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
207,4,40,75);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
208,4,38,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
209,4,17,10);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
210,4,39,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
211,4,41,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
212,4,6,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
213,4,11,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
214,4,35,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
215,4,48,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
216,4,25,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
217,4,50,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
218,4,18,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
219,4,62,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
220,4,24,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
221,4,45,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
222,4,3,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
223,4,19,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
224,4,22,85);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
225,4,27,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
226,4,37,95);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
227,4,0,65);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
228,4,5,15);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
229,4,58,85);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
230,4,9,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
231,4,20,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
232,4,143,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
233,4,144,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
234,4,145,205);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
235,4,146,90);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
236,4,147,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
237,4,148,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
238,4,149,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
239,4,150,45);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
240,5,10,75);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
241,5,7,70);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
242,5,8,165);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
243,5,32,60);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
244,5,29,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
245,5,34,250);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
246,5,15,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
247,5,0,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
248,5,38,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
249,5,43,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
250,5,1,80);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
251,5,41,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
252,5,6,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
253,5,11,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
254,5,48,50);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
255,5,3,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
256,5,31,90);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
257,5,22,50);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
258,5,40,75);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
259,5,47,100);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
260,5,5,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
261,5,39,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
262,5,9,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
263,5,20,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
264,6,10,70);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
265,6,7,65);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
266,6,8,100);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
267,6,49,50);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
268,6,56,55);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
269,6,31,120);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
270,6,15,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
271,6,0,55);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
272,6,38,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
273,6,43,15);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
274,6,9,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
275,6,20,15);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
276,6,6,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
277,6,11,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
278,6,48,15);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
279,6,32,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
280,6,21,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
281,6,34,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
282,6,40,65);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
283,6,30,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
284,6,5,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
285,6,39,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
286,6,41,15);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
287,6,16,150);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
288,6,119,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
289,6,120,50);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
290,6,121,155);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
291,6,122,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
292,6,123,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
293,6,124,90);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
294,6,126,15);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
295,6,127,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
296,6,128,80);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
297,6,129,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
298,6,130,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
299,6,131,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
300,6,132,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
301,6,133,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
302,6,134,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
303,6,138,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
304,6,139,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
305,6,140,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
306,6,141,50);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
307,6,142,110);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
308,6,115,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
309,6,116,32);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
310,6,117,24);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
311,6,118,54);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
312,7,10,85);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
313,7,7,70);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
314,7,8,140);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
315,7,36,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
316,7,42,210);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
317,7,14,10);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
318,7,61,10);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
319,7,24,10);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
320,7,45,10);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
321,7,3,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
322,7,53,50);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
323,7,34,60);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
324,7,23,90);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
325,7,15,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
326,7,40,50);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
327,7,28,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
328,7,5,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
329,7,58,75);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
330,7,59,170);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
331,7,41,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
332,7,6,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
333,7,11,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
334,7,35,10);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
335,7,2,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
336,7,50,60);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
337,7,18,10);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
338,7,62,10);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
339,7,13,10);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
340,7,32,40);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
341,7,29,35);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
342,7,54,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
343,7,22,240);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
344,7,27,50);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
345,7,4,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
346,7,0,80);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
347,7,38,20);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
348,7,17,25);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
349,7,39,15);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
350,7,9,30);
INSERT INTO [CharacterAbilityJoin] ([CharacterAbilityId],[CharacterId],[AbilityId],[AP]) VALUES (
351,7,20,30);
INSERT INTO [__RefactorLog] ([OperationKey]) VALUES (
'a5c9eecb-abc1-4196-a2fc-02378e56c594');
INSERT INTO [__RefactorLog] ([OperationKey]) VALUES (
'2f6001b0-0f34-464e-98a8-1526d85c74a3');
INSERT INTO [__RefactorLog] ([OperationKey]) VALUES (
'49ee1d13-7a0b-438a-bb3e-27db639c8e43');
INSERT INTO [__RefactorLog] ([OperationKey]) VALUES (
'674e7bf0-b2de-4d52-9316-32fb103c2dec');
INSERT INTO [__RefactorLog] ([OperationKey]) VALUES (
'1103c675-59bb-418e-b5a2-4d326fba1737');
INSERT INTO [__RefactorLog] ([OperationKey]) VALUES (
'102f6941-7b67-4641-bc09-5ad9e7698807');
INSERT INTO [__RefactorLog] ([OperationKey]) VALUES (
'17c05b5c-1004-46ed-8b8a-615ec9f8a4e9');
INSERT INTO [__RefactorLog] ([OperationKey]) VALUES (
'2d2e8ee5-99ef-4a79-b431-70f8a888264f');
INSERT INTO [__RefactorLog] ([OperationKey]) VALUES (
'd3ea6f50-5a62-427b-a563-aad0d2aad542');
INSERT INTO [__RefactorLog] ([OperationKey]) VALUES (
'7bc36d38-f782-4936-b81d-ae583bfd22a6');
INSERT INTO [__RefactorLog] ([OperationKey]) VALUES (
'4c2461ee-9e9b-4a3d-930c-b29f7548f6bf');
INSERT INTO [__RefactorLog] ([OperationKey]) VALUES (
'1a333ec7-a504-462f-8257-b5863b2a2a07');
INSERT INTO [__RefactorLog] ([OperationKey]) VALUES (
'c785145a-e05d-48fa-94d7-b5fd0075e4ca');
INSERT INTO [__RefactorLog] ([OperationKey]) VALUES (
'bb732cf8-0340-4dd3-b62a-c364c54aa6e5');
INSERT INTO [__RefactorLog] ([OperationKey]) VALUES (
'19f255d3-39af-4a31-bb8f-c9089f81a026');
INSERT INTO [__RefactorLog] ([OperationKey]) VALUES (
'bded2dca-a814-4b53-9512-d0281650e6b9');
INSERT INTO [__RefactorLog] ([OperationKey]) VALUES (
'5626e9a4-a1f3-4d14-b94f-d21222746e12');
INSERT INTO [__RefactorLog] ([OperationKey]) VALUES (
'392b99ae-6b7f-48d2-a408-dafca7d0781a');
INSERT INTO [__RefactorLog] ([OperationKey]) VALUES (
'485d11b5-6351-4f14-84f0-ea0ad25f656c');
INSERT INTO [__RefactorLog] ([OperationKey]) VALUES (
'aa7b4dbf-e9eb-4385-8b19-edbea1ef6565');
CREATE UNIQUE INDEX [UNQ_CharacterEquipmentJoin_CharacterId_EquipmentId] ON [CharacterEquipmentJoin] ([CharacterId] ASC,[EquipmentId] ASC);
CREATE UNIQUE INDEX [UNQ_EquipmentAbilityJoin_EquipmentId_Abilityid] ON [EquipmentAbilityJoin] ([EquipmentId] ASC,[AbilityId] ASC);
CREATE INDEX [IX_CharacterAbilityJoin_AbilityId] ON [CharacterAbilityJoin] ([CharacterId] ASC,[AbilityId] ASC);
CREATE INDEX [IX_CharacterAbilityJoin_CharacterId] ON [CharacterAbilityJoin] ([CharacterId] ASC);
CREATE UNIQUE INDEX [UNQ_CharacterAbilityJoin_CharacterId_AbilityId] ON [CharacterAbilityJoin] ([CharacterId] ASC,[AbilityId] ASC);
COMMIT;

