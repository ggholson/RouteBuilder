CREATE TABLE [Route].[RouteSegmentJoin]
(
	[RouteId] SMALLINT NOT NULL, 
	[SegmentId] INT NOT NULL, 
	[Position] FLOAT NOT NULL, 
	PRIMARY KEY(RouteId, SegmentId),
	CONSTRAINT [FK_RouteSegmentJoin_ToRoute] FOREIGN KEY ([RouteId]) REFERENCES [Route].[Route]([RouteId]),
	CONSTRAINT [FK_RouteSegmentJoin_ToSegment] FOREIGN KEY ([SegmentId]) REFERENCES [Route].[Segment]([SegmentId])
)
