# Run Maven test suite from Jenkin to capture Dynamic CGI from newly created Course
#cd /Users/mindtap/SOAPUI/ccs-soapui-tests
#git pull
# Run SoapUI test suite from Jenkin
#defhost=localhost

#HOST=${1-$defhost}
#TestSuite=${$TS-$testsuite}
#PROJECT=${$PR-$project}

#echo Running SOAPUI on: $HOST #TestSuite Name as $TestSuite and PROJECT Name as $PROJECT
#cd /Applications/SoapUI-5.0.0.app/Contents/java/app/bin

#sh testrunner.sh -s"Label_CourseID_Code_Validations" -r -a -f/Users/mindtap/SOAPUI/Reports /Users/mindtap/SOAPUI/ccs-soapui-tests/EDMS_Lite_Validation-soapui-project.xml

# AWS Specific commands
sudo cd /opt/code/ccs-soapui-tests/
echo * * * * * * list of files * * * * * * * * *
pwd
echo * * * * * * git command start * * * * * * * * * 

sudo git stash
sudo git pull

echo * * * * * * SOAPUI tests starting  * * * * * * 

defhost=localhost
HOST=${1-$defrost}
echo Running SOAPUI TestSuite on Endpoint *** : $HOST
 
sh /opt/ReadyAPI-1.2.2/bin/testrunner.sh -e$HOST -s "Label_CourseID_Code_Validations" /opt/code/ccs-soapui-tests/EDMS_Lite_Validation-soapui-project.xml

