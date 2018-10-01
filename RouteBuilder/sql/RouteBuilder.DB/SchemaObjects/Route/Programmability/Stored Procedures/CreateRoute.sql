CREATE PROCEDURE [Route].[CreateRoute]
	@Name NVARCHAR(50),
	@CopyFrom SMALLINT = 0
AS
	IF @Name IS NULL
		RETURN -2;

	BEGIN TRY 
		BEGIN TRAN
			DECLARE @NewId TABLE (Id SMALLINT)

			INSERT INTO Route.Route 
				OUTPUT Inserted.RouteId INTO @NewId
				VALUES	(@Name)

			INSERT INTO Route.RouteSegmentJoin
				SELECT *
				FROM Route.RouteSegmentJoin
				WHERE RouteId = @CopyFrom

			RETURN SELECT TOP 1 Id FROM @NewId
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN

		RETURN -1
	END CATCH
