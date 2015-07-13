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
sh testrunner.sh -e$HOST -s "Actions" -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml
sh testrunner.sh -e$HOST -s "OAT" -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml




# Run SoapUI test suite from Jenkin with Host as parameter
#defhost=localhost
#HOST=${1-$defhost}
#echo Running SOAPUI TestSuite on: $HOST
#cd /Applications/SoapUI-5.0.0.app/Contents/java/app/bin
#cd /Applications/SoapUI-5.1.3.app/Contents/java/app/bin
#sh testrunner.sh -e$HOST -s "Create & Copy from Master" -r -a -f/Users/mindtap/source/SOAPUI/Reports /Users/mindtap/source/SOAPUI/SOA-MTED-Lite-soapui-project.xml
#sh testrunner.sh -e$HOST -s "Actions" -r -a -f/Users/mindtap/source/SOAPUI/Reports /Users/mindtap/source/SOAPUI/SOA-MTED-Lite-soapui-project.xml
#sh testrunner.sh -e$HOST -s "Associations bet Objectives-Assessment items" -r -a -f/Users/mindtap/source/SOAPUI/Reports /Users/mindtap/source/SOAPUI/SOA-MTED-Lite-soapui-project.xml
#sh testrunner.sh -e$HOST -s "Objectives_Bad Data" -r -a -f/opt/code/Reports /Users/mindtap/source/SOAPUI/SOA-MTED-Lite-soapui-project.xml
#sh testrunner.sh -e$HOST -s "Label_CourseID_Code_Validations" -r -a -f/opt/code/Reports /Users/mindtap/source/SOAPUI/SOA-MTED-Lite-soapui-project.xml


