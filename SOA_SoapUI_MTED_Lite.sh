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
cd /opt/ReadyAPI-1.2.2/bin/ 
#sh /opt/ReadyAPI-1.2.2/bin/testrunner.sh -e$HOST -s "Label_CourseID_Code_Validations" /opt/code/ccs-soapui-tests/EDMS_Lite_Validation-soapui-project.xml

sh testrunner.sh -e$HOST -s "Objectives_Bad Data" -r -a -f/Users/mindtap/SOAPUI/Reports  /Users/mindtap/SOAPUI/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml
sh testrunner.sh -e$HOST -s "Label_CourseID_Code_Validations" -r -a -f/Users/mindtap/SOAPUI/Reports  /Users/mindtap/SOAPUI/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml





