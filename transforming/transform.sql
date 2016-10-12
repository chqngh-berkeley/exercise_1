DROP TABLE IF EXISTS Procedure_T;
CREATE TABLE Procedure_T
  -- ROW FORMAT SERDE "org.apache.hadoop.hive.serde2.OpenCSVSerde"
  -- STORED AS TEXTFILE
AS
SELECT  TimelyAndEffectiveCare.ProviderID as ProviderID,
         TimelyAndEffectiveCare.HospitalName as HospitalName,
         TimelyAndEffectiveCare.Address as Address,
         TimelyAndEffectiveCare.City as City,
         TimelyAndEffectiveCare.State as State,
         TimelyAndEffectiveCare.ZipCode as ZipCode,
         TimelyAndEffectiveCare.CountyName as CountyName,
         TimelyAndEffectiveCare.PhoneNumber as PhoneNumber,

         TimelyAndEffectiveCare.MeasureID as TimelyAndEffectiveCareMeasureID,
         TimelyAndEffectiveCare.MeasureName as TimelyAndEffectiveCareMeasureName,
         TimelyAndEffectiveCare.MeasureStartDate as TimelyAndEffectiveCareMeasureStartDate,
         TimelyAndEffectiveCare.Footnote as TimelyAndEffectiveCareFootnote,
         TimelyAndEffectiveCare.MeasureEndDate as TimelyAndEffectiveCareMeasureEndDate,

         TimelyAndEffectiveCare.Condition as Condition,
         TimelyAndEffectiveCare.Score as TimelyAndEffectiveCareScore,
         TimelyAndEffectiveCare.Sample as Sample,

         ReadmissionAndDeaths.MeasureID as ReadmissionAndDeathsMeasureID,
         ReadmissionAndDeaths.MeasureName as ReadmissionAndDeathsMeasureName,
         ReadmissionAndDeaths.MeasureStartDate as ReadmissionAndDeathsMeasureStartDate,
         ReadmissionAndDeaths.Footnote as ReadmissionAndDeathsFootnote,
         ReadmissionAndDeaths.MeasureEndDate as ReadmissionAndDeathsMeasureEndDate,

         ReadmissionAndDeaths.ComparedToNational as ComparedToNational,
         ReadmissionAndDeaths.Denominator as Denominator,
         ReadmissionAndDeaths.Score as ReadmissionAndDeathsScore,
         ReadmissionAndDeaths.LowerEstimate as LowerEstimate,
         ReadmissionAndDeaths.HigherEstimate as HigherEstimate

  FROM ReadmissionAndDeaths, TimelyAndEffectiveCare
  WHERE    (TimelyAndEffectiveCare.ProviderID = ReadmissionAndDeaths.ProviderID and
         TimelyAndEffectiveCare.HospitalName = ReadmissionAndDeaths.HospitalName)
;
select * from Procedure_T limit 1;
