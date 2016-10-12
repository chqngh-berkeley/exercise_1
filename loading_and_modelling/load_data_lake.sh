# This section renames the local files as well as get rid of the header row
mkdir revised

tail -n +2 /Users/chuqinghe/Documents/W205/Exercise1/Hospital_Revised_Flatfiles/Hospital\ General\ Information.csv>revised1/hospitals.csv
tail -n +2 /Users/chuqinghe/Documents/W205/Exercise1/Hospital_Revised_Flatfiles/Timely\ and\ Effective\ Care\ -\ Hospital.csv>revised/effective_care.csv
tail -n +2 /Users/chuqinghe/Documents/W205/Exercise1/Hospital_Revised_Flatfiles/Readmissions\ and\ Deaths\ -\ Hospital.csv>revised/readmissions.csv
tail -n +2 /Users/chuqinghe/Documents/W205/Exercise1/Hospital_Revised_Flatfiles/Measure\ Dates.csv>revised/Measures.csv
tail -n +2 /Users/chuqinghe/Documents/W205/Exercise1/Hospital_Revised_Flatfiles/hvbp_hcahps_05_28_2015.csv>revised/surveys_responses.csv

# This section uploads the revised local files to ec2 folder /data/hospital
scp -i UCBW205HW2.pem revised/effective_care.csv root@ec2-54-165-182-237.compute-1.amazonaws.com:/data/hospital
scp -i UCBW205HW2.pem revised/hospitals.csv root@ec2-54-165-182-237.compute-1.amazonaws.com:/data/hospital
scp -i UCBW205HW2.pem revised/Measures.csv root@ec2-54-165-182-237.compute-1.amazonaws.com:/data/hospital
scp -i UCBW205HW2.pem revised/readmissions.csv root@ec2-54-165-182-237.compute-1.amazonaws.com:/data/hospital
scp -i UCBW205HW2.pem revised/surveys_responses.csv root@ec2-54-165-182-237.compute-1.amazonaws.com:/data/hospital


# This section makes all the required directories
su - w205
hdfs dfs -mkdir /user/w205/hospital_compare
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/Measures
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/surveys_responses
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care

# This section puts the csv files from /data/hospital into their respective
# folders under /user/w205/hospital_compare
hdfs dfs -put /data/hospital/effective_care.csv /user/w205/hospital_compare/effective_care
hdfs dfs -put /data/hospital/hospitals.csv /user/w205/hospital_compare/hospitals
hdfs dfs -put /data/hospital/surveys_responses.csv /user/w205/hospital_compare/surveys_responses
hdfs dfs -put /data/hospital/Measures.csv /user/w205/hospital_compare/Measures
hdfs dfs -put /data/hospital/readmissions.csv /user/w205/hospital_compare/readmissions
hdfs dfs -ls /user/w205/hospital_compare

# This section puts the transform and query sql files into ec2
# scp -i ../../UCBW205HW2.pem transforming/transform.sql root@ec2-54-196-75-125.compute-1.amazonaws.com:/data/hospital
# scp -i ../../UCBW205HW2.pem investigation/best_hospitals/best_hospital.sql root@ec2-54-196-75-125.compute-1.amazonaws.com:/data/hospital;
# scp -i ../../UCBW205HW2.pem investigation/best_states/best_states.sql root@ec2-54-196-75-125.compute-1.amazonaws.com:/data/hospital;
# scp -i ../../UCBW205HW2.pem investigation/hospitals_and_patients/hospitals_and_patients.sql root@ec2-54-196-75-125.compute-1.amazonaws.com:/data/hospital
# scp -i ../../UCBW205HW2.pem investigation/hospital_variability/hospital_variability.sql root@ec2-54-196-75-125.compute-1.amazonaws.com:/data/hospital
