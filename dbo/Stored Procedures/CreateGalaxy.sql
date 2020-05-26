-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/6/2020
-- Description:	Create Galaxy
-- =============================================
CREATE PROCEDURE [dbo].[CreateGalaxy]
   @Galaxy int = 1  
AS
BEGIN
	DECLARE @Planets TABLE
	(
	[PlanetID] [int] IDENTITY(1,1),
		PlanetName nvarchar(50) NOT NULL,
		PlanetType int NOT NULL,
		Position int NOT NULL,
		SubPosition int NOT NULL,
		Galaxy int NOT NULL,
		Sector nvarchar(10) NOT NULL,
		[System] int NOT NULL,
		xSysPosition int,
		ySysPosition int,
		Moon bit,
		[Owner] int NULL
	);

	DECLARE @XPOS TABLE
	(
		Position int,
		Used bit
	)
	DECLARE @YPOS TABLE
	(
		Position int,
		Used bit
	)

	DECLARE @XCurSector int = 1, @YCurSector int = 1
	DECLARE @XSystemChk int = 0, @YSystemChk int = 0
	DECLARE @SystemChk int = 0, @Sectors int = 1, @PlanetChk int = 0, @MoonChk int = 0, @Type int = 0
	DECLARE @XSysPos int = 0, @YSysPos int = 0, @SysPosCnt int = -1000, @SysPosTry int = 0

	WHILE @SysPosCnt < 999
	BEGIN
		SET @SysPosCnt = @SysPosCnt + 1
		INSERT INTO @XPOS
		Values
		(
			@SysPosCnt,
			0
		)
		INSERT INTO @YPOS
		Values
		(
			@SysPosCnt,
			0
		)
	END

	While @XCurSector <= 9
	BEGIN
		SET @YCurSector = 1
		While @YCurSector <= 9
		BEGIN
			SET @XSystemChk = 5 - Abs(@XCurSector-5)
			SET @YSystemChk = 5 - Abs(@YCurSector-5)
			--SET @SystemChk = (@XSystemChk + @YSystemChk)-1			
			IF @XSystemChk < @YSystemChk
			BEGIN
				SET @SystemChk = @XSystemChk
			END
			ELSE
			BEGIN
				SET @SystemChk = @YSystemChk
			END
			UPDATE @XPOS
				SET Used = 0
			UPDATE @YPOS
				SET Used = 0
			WHILE @SystemChk > 0
			BEGIN
				SET @XSysPos = -1
				WHILE @XSysPos = -1
				BEGIN
					SELECT @SysPosTry = CAST(RAND() * 1999 AS INT) - 999
					if NOT EXISTS (SELECT Position FROM @XPOS WHERE USED=0 AND Position = @SysPosTry)
					BEGIN
						SET @XSysPos = -1
					END
					ELSE
					BEGIN						
						UPDATE @XPOS
							SET USED = 1 WHERE Position = @SysPosTry
						SET @XSysPos = @SysPosTry + 1
					END
				END

				SET @YSysPos = -1
				WHILE @YSysPos = -1
				BEGIN
					SELECT @SysPosTry = CAST(RAND() * 1999 AS INT) - 999
					if NOT EXISTS (SELECT Position FROM @YPOS WHERE USED=0 AND Position = @SysPosTry)
					BEGIN
						SET @YSysPos = -1
					END
					ELSE
					BEGIN						
						UPDATE @XPOS
							SET USED = 1 WHERE Position = @SysPosTry
						SET @YSysPos = @SysPosTry + 1
					END
				END


				SELECT @PlanetChk = (CAST(RAND() * 6 AS INT)+1)
				WHILE @PlanetChk > 0
				BEGIN
					SELECT @Type = CAST(RAND() * 10 AS INT)	
					INSERT INTO @Planets
					values
					(
						'Planet' +  CAST(@XCurSector as nvarchar(1)) + CAST(@YCurSector as nvarchar(1)) + ':' +  CAST(@SystemChk as nvarchar(3)) 
							+ ':' + CAST(@PlanetChk as nvarchar(3)) + ':' + CAST(1 as nvarchar(3)),
						@Type,
						@PlanetChk,
						1,
						@Galaxy,
						CAST(@XCurSector as nvarchar(1)) + CAST(@YCurSector as nvarchar(1)),
						@SystemChk,
						@XSysPos,
						@YSysPos,
						0,
						0
					)				
					SELECT @MoonChk = (CAST(RAND() * 8 AS INT)-4)
					WHILE @MoonChk > 0
					BEGIN
						SELECT @Type = CAST(RAND() * 10 AS INT)					
						INSERT INTO @Planets
						values
						(
							'Planet' +  CAST(@XCurSector as nvarchar(1)) + CAST(@YCurSector as nvarchar(1)) + ':' +  CAST(@SystemChk as nvarchar(3)) 
								+ ':' + CAST(@PlanetChk as nvarchar(3)) + ':' + CAST(@MoonChk+1 as nvarchar(3)),
							@Type,
							@PlanetChk,
							@MoonChk+1,
							@Galaxy,
							CAST(@XCurSector as nvarchar(1)) + CAST(@YCurSector as nvarchar(1)),
							@SystemChk,
							@XSysPos,
							@YSysPos,
							1,
							0
						)
						SET @MoonChk = @MoonChk - 1
					END	
					SET @PlanetChk = @PlanetChk - 1		
				END
				SET @SystemChk = @SystemChk - 1
			END
			SET @YCurSector = @YCurSector + 1
		END	
		SET @XCurSector = @XCurSector + 1
	END

INSERT INTO dbo.Planets
(
		PlanetName,
		PlanetType,
		Position,
		SubPosition,
		Galaxy,
		Sector,
		[System],
		xSysPosition,
		ySysPosition,
		Moon,
		[Owner]
)
SELECT 
		PlanetName,
		PlanetType,
		Position,
		SubPosition,
		Galaxy,
		Sector,
		[System],
		xSysPosition,
		ySysPosition,
		Moon,
		[Owner]
FROM @Planets;

--select p.Sector, p.SysPosition, p.Position, p.SubPosition, p.Moon, p.PlanetID
--From @Planets p
--Join(
--select p.Sector, p.SysPosition, p.Position, p.SubPosition, count(*) as cnt
--From @Planets p
--group by p.Sector, p.SysPosition, p.Position, p.SubPosition
--having count(*) > 1) bad 
--	on bad.Sector = p.Sector and 
--	bad.SysPosition = p.SysPosition and
--	bad.Position = p.Position and
--	bad.SubPosition = p.SubPosition

--select p.Sector, p.SysPosition, p.Position, p.SubPosition, p.Moon, p.PlanetID
--From @Planets p
--order by SysPosition

--select sector, count(*) cnt
--FROM
--(
--select p.Sector, p.SysPosition
--From @Planets p
--Group by sector,SysPosition
--) y
--group by sector
--order by sector

END