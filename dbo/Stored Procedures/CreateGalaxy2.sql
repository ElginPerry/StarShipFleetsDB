-- =============================================
-- Author:		Elgin Perry
-- Create date: 5/6/2020
-- Description:	Create Galaxy
-- =============================================
CREATE PROCEDURE [dbo].[CreateGalaxy2]
  @Galaxy int = 2  
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

	DECLARE @XCurSector int = 0, @YCurSector int = 0
	DECLARE @XSystemChk int = 0, @YSystemChk int = 0
	DECLARE @SystemChk int = 0, @Sectors int = 1, @PlanetChk int = 0, @MoonChk int = 0, @Type int = 0
	DECLARE @XSysPos int = 0, @YSysPos int = 0, @SysPosCnt int = -1000, @Xupper int = 48, @Yupper int = 20
	DECLARE @XSysPosTry int = 0, @YSysPosTry int = 0

	While @XCurSector <= 9
	BEGIN		
		SET @YCurSector = 0
		While @YCurSector <= 9
		BEGIN
			IF @XCurSector = 0 OR @XCurSector = 9 OR @YCurSector = 0 OR @YCurSector = 9
			BEGIN
				SET @SystemChk = 2
			END
			ELSE IF @XCurSector = 1 OR @XCurSector = 8 OR @YCurSector = 1 OR @YCurSector = 8
			BEGIN
				SET @SystemChk = 3
			END
			ELSE IF @XCurSector = 2 OR @XCurSector = 7 OR @YCurSector = 2 OR @YCurSector = 7
			BEGIN
				SET @SystemChk = 4
			END
			ELSE IF @XCurSector = 3 OR @XCurSector = 6 OR @YCurSector = 3 OR @YCurSector = 6
			BEGIN
				SET @SystemChk = 5
			END
			ELSE IF @XCurSector = 4 OR @XCurSector = 5 OR @YCurSector = 4 OR @YCurSector = 5
			BEGIN
				SET @SystemChk = 6
			END

			SET @Xupper = -48
			SET @Yupper = -20
			WHILE @SystemChk > 0
			BEGIN
				
				SET @XSysPosTry = @Xupper --+ (@XCurSector*20)
				SET @YSysPosTry = @Yupper --+ (@YCurSector*20)

				SET @XSysPos = -1
				WHILE @XSysPos = -1
				BEGIN
					SELECT @XSysPosTry = @XSysPosTry + CAST(RAND() * 90 AS INT) 
					if EXISTS (SELECT Position FROM @XPOS WHERE Position = @XSysPosTry) OR @XSysPosTry > 49 OR  @XSysPosTry < -48
					BEGIN
						SET @XSysPos = -1
						SET @XSysPosTry = @Xupper --+ (@XCurSector*20)
					END
					ELSE
					BEGIN						
						INSERT INTO @XPOS
						Values
						(
							@XSysPosTry,
							0
						)
						SET @XSysPos = @XSysPosTry
					END
				END

				SET @YSysPos = -1
				WHILE @YSysPos = -1
				BEGIN
					SELECT @YSysPosTry = @YSysPosTry + CAST(RAND() * 40 AS INT) 
					if EXISTS (SELECT Position FROM @YPOS WHERE Position = @YSysPosTry) OR @YSysPosTry > 20 OR  @YSysPosTry < -20
					BEGIN
						SET @YSysPos = -1
						SET @YSysPosTry = @Yupper --+ (@YCurSector*20)
					END
					ELSE
					BEGIN						
						INSERT INTO @YPOS
						Values
						(
							@YSysPosTry,
							0
						)
						SET @YSysPos = @YSysPosTry
					END
				END

				SELECT @PlanetChk = (CAST(RAND() * 6 AS INT)+1)
				WHILE @PlanetChk > 0
				BEGIN
					SELECT @Type = CAST(RAND() * 21 AS INT)	
					SELECT @Type = ROUND(@Type / 2, 0,0)
					if @Type = 11
						BEGIN
							SET @Type = 2
						END	
					INSERT INTO @Planets
					values
					(
						'Planet' +  CAST(@Galaxy as nvarchar(3)) + ':' + CAST(@XCurSector as nvarchar(1)) + CAST(@YCurSector as nvarchar(1)) + ':' +  CAST(@SystemChk as nvarchar(3)) 
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
						SELECT @Type = CAST(RAND() * 21 AS INT)	
						SELECT @Type = ROUND(@Type / 2, 0,0)
						if @Type = 11
							BEGIN
								SET @Type = 2
							END					
						INSERT INTO @Planets
						values
						(
							'Planet' + CAST(@Galaxy as nvarchar(3)) + ':' + CAST(@XCurSector as nvarchar(1)) + CAST(@YCurSector as nvarchar(1)) + ':' +  CAST(@SystemChk as nvarchar(3)) 
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
			DELETE FROM @XPOS
			DELETE FROM @YPOS
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

--select p.Sector, p.xSysPosition, p.ySysPosition, p.Position, p.SubPosition, p.Moon, p.PlanetID
--From @Planets p
--order by Sector

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