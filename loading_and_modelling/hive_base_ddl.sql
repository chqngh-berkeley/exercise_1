
-- Create Hospital
DROP TABLE IF EXISTS Hospital;
CREATE EXTERNAL TABLE Hospital (
  ProviderID INT,
  HospitalName STRING,
  Address STRING,
  City STRING,
  State STRING,
  ZipCode INT,
  CountyName STRING,
  PhoneNumber STRING,
  HospitalType STRING,
  HospitalOwnership STRING,
  EmergencyServices STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar" = '"',
  "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';

-- Create Survey Results
DROP TABLE IF EXISTS SurveyResults;
CREATE EXTERNAL TABLE SurveyResults (
 ProviderID INT,
 HospitalName STRING,
 Address STRING,
 City STRING,
 State STRING,
 ZipCode INT,
 CountyName STRING,
 CommunicationScoreWithNurseAchievement STRING,
 CommunicationScoreWithNurseImprovement STRING,
 CommunicationScoreWithNurseDimension STRING,
 CommunicationScoreWithDoctorAchievement STRING,
 CommunicationScoreWithDoctorImprovement STRING,
 CommunicationScoreWithDoctorDimension STRING,
 ResponsivenessScoreOfHospitalStaffAchievement STRING,
 ReponsivenessScoreOfHospitalStaffImprovement STRING,
 ResponsivenessScoreOfHospitalStaffDimension STRING,
 PainManagementAchievement STRING,
 PainManagementImprovement STRING,
 PainManagementDimension STRING,
 CommunicationAboutMedicineAchievement STRING,
 CommunicationAboutMedicineImprovement STRING,
 CommunicationAboutMedicineDimension STRING,
 HospitalEnvCleanAndQuietAchievement STRING,
 HospitalEnvCleanAndQuietImprovement STRING,
 HospitalEnvCleanAndQuietDimension STRING,
 DischargeInfoAchievement STRING,
 DischargeInfoImprovement STRING,
 DischargeInfoDimension STRING,
 OverAllHospitalRatingAchievement STRING,
 OverAllHospitalRatingImprovement STRING,
 OverAllHospitalRatingDimension STRING,
 HCAHPSBase INT,
 HCAHPSConsistency INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar" = '"',
  "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys_responses';

-- Create Measures
DROP TABLE IF EXISTS Measure;
CREATE EXTERNAL TABLE Measure (
  MeasureName STRING,
  MeasureID STRING,
  MeasureStartQuarter STRING,
  MeasureStartDate DATE,
  MeasureEndQuarter STRING,
  MeasureEndDate DATE
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar" = '"',
  "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/Measures';


-- Create ReadmissionAndDeaths
DROP TABLE IF EXISTS ReadmissionAndDeaths;
CREATE EXTERNAL TABLE ReadmissionAndDeaths (
  ProviderID INT,
  HospitalName STRING,
  Address STRING,
  City STRING,
  State STRING,
  ZipCode INT,
  CountyName STRING,
  PhoneNumber STRING,
  MeasureName STRING,
  MeasureID STRING,
  ComparedToNational STRING,
  Denominator FLOAT,
  Score FLOAT,
  LowerEstimate FLOAT,
  HigherEstimate FLOAT,
  Footnote STRING,
  MeasureStartDate DATE,
  MeasureEndDate DATE
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar" = '"',
  "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';


-- Create TimelyAndEffectiveCare
DROP TABLE IF EXISTS TimelyAndEffectiveCare;
CREATE EXTERNAL TABLE TimelyAndEffectiveCare (
  ProviderID INT,
  HospitalName STRING,
  Address STRING,
  City STRING,
  State STRING,
  ZipCode INT,
  CountyName STRING,
  PhoneNumber STRING,
  Condition STRING,
  MeasureID STRING,
  MeasureName STRING,
  Score INT,
  Sample INT,
  Footnote STRING,
  MeasureStartDate DATE,
  MeasureEndDate DATE
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar" = '"',
  "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';
