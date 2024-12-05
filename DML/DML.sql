USE Fitness_Final_Presentation;
GO
--SELECT * FROM dbo.Dim_Activity
--SELECT * FROM dbo.DIm_DayType
--SELECT * FROM dbo.Dim_SleepQuality
--SELECT * FROM dbo.Sleep
--SELECT * FROM dbo.Steps

--SELECT * FROM dim.Activity
--SELECT * FROM dim.DayType
--SELECT * FROM dim.SleepQuality
--SELECT * FROM f.Sleep
--SELECT * FROM f.Steps


/*********************************************************/
/****************** Insert Into DayType ******************/
/*********************************************************/

INSERT INTO dim.DayType (DayType_ID, DayType)
SELECT DISTINCT 
    DayType_ID, -- Using existing IDs from dbo.Dim_DayType
    DayType
FROM dbo.Dim_DayType;
GO

/*********************************************************/
/****************** Insert Into Activity *****************/
/*********************************************************/

INSERT INTO dim.Activity (Activity_ID, Activity)
SELECT DISTINCT 
    Activity_ID, -- Using existing IDs from dbo.Dim_Activity
    Activity
FROM dbo.Dim_Activity;
GO

/*********************************************************/
/************** Insert Into Sleep Quality ****************/
/*********************************************************/

INSERT INTO dim.SleepQuality (SleepQuality, SleepID)
SELECT DISTINCT 
    SleepQuality, -- Using existing SleepQuality from dbo.Dim_SleepQuality
    SleepID
FROM dbo.Dim_SleepQuality;
GO

/*********************************************************/
/****************** Insert Into Sleep ********************/
/*********************************************************/

INSERT INTO f.Sleep (SleepID, Full_date, DeepSleepTime, ShallowSleepTime, WakeTime, 
                     MonthName, Year, SleepQuality, DayName, DayType_ID)
SELECT DISTINCT
    s.SleepID, 
    s.Full_date, 
    s.deepSleepTime, 
    s.shallowSleepTime, 
    s.wakeTime, 
    s.[Month Name], 
    s.Year, 
    s.SleepQuality, 
    s.[Day Name],
    s.DayType_ID -- Joining with dim.DayType for DayType_ID
FROM dbo.Sleep s
JOIN dim.DayType dt
    ON s.DayType = dt.DayType
JOIN dim.SleepQuality sq
    ON s.SleepID = sq.SleepID;
GO



/*********************************************************/
/****************** Insert Into Steps ********************/
/*********************************************************/

INSERT INTO f.Steps (Activity_ID, Full_date, Day_Name, Steps, Distance, RunDistance, Calories, Year, 
                     MonthName, Day_Type, Full_date_Year, Full_date_Quarter, Full_date_Month)
SELECT DISTINCT
    a.Activity_ID, 
    s.Full_date, 
    s.Day_Name, 
    s.steps, 
    s.distance, 
    s.runDistance, 
    s.calories, 
    s.Year, 
    s.[Month Name], 
    s.DayType, 
    [Full_date (Year)] AS Full_date_Year, 
    [Full_date (Quarter)] AS Full_date_Quarter,
    [Full_date (Month)] AS Full_date_Month
FROM dbo.Steps s
JOIN dim.Activity a
    ON s.Activity_ID = a.Activity_ID;
GO

---- Using CASE for string output (like 'Qtr1', 'Qtr2')
--CASE 
--    WHEN QUARTER(s.Full_date) = 1 THEN 'Qtr1'
--    WHEN QUARTER(s.Full_date) = 2 THEN 'Qtr2'
--    WHEN QUARTER(s.Full_date) = 3 THEN 'Qtr3'
--    WHEN QUARTER(s.Full_date) = 4 THEN 'Qtr4'
--END AS Full_date_Quarter



