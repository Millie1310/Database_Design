USE Fitness_Final_Presentations;
GO

/*********************************************************/
/****************** Drop Constraints *********************/
/*********************************************************/

/* Drop foreign key constraints in f.Sleep */
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Sleep_DayType')
BEGIN
    ALTER TABLE f.Sleep DROP CONSTRAINT FK_Sleep_DayType;
END;

IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Sleep_SleepQuality')
BEGIN
    ALTER TABLE f.Sleep DROP CONSTRAINT FK_Sleep_SleepQuality;
END;

/* Drop foreign key constraint in f.Steps */
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Steps_Activity')
BEGIN
    ALTER TABLE f.Steps DROP CONSTRAINT FK_Steps_Activity;
END;

/* Drop primary key constraints in dimension tables */
IF EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'PK_DayType')
BEGIN
    ALTER TABLE dim.DayType DROP CONSTRAINT PK_DayType;
END;

IF EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'PK_Activity')
BEGIN
    ALTER TABLE dim.Activity DROP CONSTRAINT PK_Activity;
END;

IF EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'PK_SleepID')
BEGIN
    ALTER TABLE dim.SleepQuality DROP CONSTRAINT PK_SleepID;
END;

GO

/*********************************************************/
/******************* Drop Tables *************************/
/*********************************************************/

/* Drop fact tables */
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'f' AND TABLE_NAME = 'Sleep')
BEGIN
    DROP TABLE f.Sleep;
END;

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'f' AND TABLE_NAME = 'Steps')
BEGIN
    DROP TABLE f.Steps;
END;

/* Drop dimension tables */
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dim' AND TABLE_NAME = 'DayType')
BEGIN
    DROP TABLE dim.DayType;
END;

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dim' AND TABLE_NAME = 'Activity')
BEGIN
    DROP TABLE dim.Activity;
END;

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dim' AND TABLE_NAME = 'SleepQuality')
BEGIN
    DROP TABLE dim.SleepQuality;
END;

GO

/*********************************************************/
/******************* Drop Schemas ************************/
/*********************************************************/

IF EXISTS (SELECT * FROM sys.schemas WHERE name = 'dim')
BEGIN
    DROP SCHEMA dim;
END;

IF EXISTS (SELECT * FROM sys.schemas WHERE name = 'f')
BEGIN
    DROP SCHEMA f;
END;

GO
