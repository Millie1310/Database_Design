USE Fitness_Final_Presentation;
GO

/*********************************************************/
/******************    Schema DDL       ******************/
/*********************************************************/

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'dim') 
BEGIN
    EXEC sp_executesql N'CREATE SCHEMA dim AUTHORIZATION dbo;'
END;
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'f') 
BEGIN
    EXEC sp_executesql N'CREATE SCHEMA f AUTHORIZATION dbo;'
END;
GO

/*********************************************************/
/****************  Day Type Dimension   ******************/
/*********************************************************/

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dim' AND TABLE_NAME = 'DayType')
BEGIN
    CREATE TABLE dim.DayType (
        DayType_ID BIGINT NOT NULL,
        DayType NVARCHAR(MAX) NULL
    );

    ALTER TABLE dim.DayType
    ADD CONSTRAINT PK_DayType PRIMARY KEY (DayType_ID);
END;
GO

/*********************************************************/
/****************  Activity Dimension   ******************/
/*********************************************************/

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dim' AND TABLE_NAME = 'Activity')
BEGIN
    CREATE TABLE dim.Activity (
        Activity_ID BIGINT NOT NULL,
        Activity NVARCHAR(MAX) NULL
    );

    ALTER TABLE dim.Activity
    ADD CONSTRAINT PK_Activity PRIMARY KEY (Activity_ID);
END;
GO

/*********************************************************/
/**************  Sleep Quality Dimension *****************/
/*********************************************************/

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dim' AND TABLE_NAME = 'SleepQuality')
BEGIN
    CREATE TABLE dim.SleepQuality (
	    SleepID BIGINT NOT NULL,
        SleepQuality NVARCHAR(MAX) NULL
    );

    ALTER TABLE dim.SleepQuality
    ADD CONSTRAINT PK_SleepID PRIMARY KEY (SleepID);
END;
GO

/*********************************************************/
/******************  Sleep Fact Table   ******************/
/*********************************************************/

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'f' AND TABLE_NAME = 'Sleep')
BEGIN
    CREATE TABLE f.Sleep (
        SleepID BIGINT NOT NULL,
        Full_date DATETIME2(0) NULL,
        DeepSleepTime BIGINT NULL,
        ShallowSleepTime BIGINT NULL,
        WakeTime BIGINT NULL,
        MonthName NVARCHAR(MAX) NULL,
        Year BIGINT NULL,
        SleepQuality NVARCHAR(MAX) NULL,
        DayName NVARCHAR(15) NULL,
        DayType_ID BIGINT NULL
    );

    ALTER TABLE f.Sleep
    ADD CONSTRAINT FK_Sleep_DayType FOREIGN KEY (DayType_ID)
        REFERENCES dim.DayType(DayType_ID);

    ALTER TABLE f.Sleep
    ADD CONSTRAINT FK_Sleep_SleepQuality FOREIGN KEY (SleepID)
        REFERENCES dim.SleepQuality(SleepID);
END;
GO

/*********************************************************/
/******************  Steps Fact Table   ******************/
/*********************************************************/

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'f' AND TABLE_NAME = 'Steps')
BEGIN
    CREATE TABLE f.Steps (
        Activity_ID BIGINT NULL,
        Full_date DATETIME2(0) NULL,
        Day_Name NVARCHAR(MAX) NULL,
        Steps BIGINT NULL,
        Distance BIGINT NULL,
        RunDistance BIGINT NULL,
        Calories BIGINT NULL,
        Year BIGINT NULL,
        MonthName NVARCHAR(MAX) NULL,
        Day_Type NVARCHAR(MAX) NULL,
        Full_date_Year NVARCHAR(MAX) NULL,
        Full_date_Quarter NVARCHAR(MAX) NULL,
        Full_date_Month NVARCHAR(MAX) NULL
    );

    ALTER TABLE f.Steps
    ADD CONSTRAINT FK_Steps_Activity FOREIGN KEY (Activity_ID)
        REFERENCES dim.Activity(Activity_ID);
END;
GO



