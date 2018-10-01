CREATE TABLE [Route].[Segment]
(
	[SegmentId] INT IDENTITY(0, 1) PRIMARY KEY, 
	[Name] NVARCHAR(50) NOT NULL, 
	[Subname] NVARCHAR(100) NULL, 
	[Characters] NVARCHAR(20) NOT NULL
)
