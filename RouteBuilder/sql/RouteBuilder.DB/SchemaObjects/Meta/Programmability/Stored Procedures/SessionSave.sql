CREATE PROCEDURE [Meta].[SessionSave]
	@SessionId UNIQUEIDENTIFIER,
	@Name VARCHAR(50)
AS
	IF EXISTS (
		SELECT TOP 1 1 
		FROM Meta.Session
		WHERE SessionId = @SessionId
	)
	BEGIN
		UPDATE Meta.Session
		SET SaveName = @Name
		WHERE SessionId = @SessionId
	END
	ELSE
	BEGIN
		INSERT INTO Meta.Session
		VALUES
			(@SessionId, @Name);
	END