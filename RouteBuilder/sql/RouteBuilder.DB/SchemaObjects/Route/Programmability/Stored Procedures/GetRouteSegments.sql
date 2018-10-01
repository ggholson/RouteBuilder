CREATE PROCEDURE [Route].[GetRouteSegments]
	@RouteId SMALLINT
AS
	SELECT 
		s.SegmentId,
		s.Name,
		s.Subname,
		s.Characters,
		rsj.Position
	FROM Route.Segment s
	INNER JOIN Route.RouteSegmentJoin rsj
		ON s.SegmentId = rsj.SegmentId
	WHERE rsj.RouteId = @RouteId
	ORDER BY Position
	