# Run SoapUI test suite from Jenkin with Host as parameter
defhost=localhost
HOST=${1-$defhost}
echo Running SOAPUI TestSuite on: $HOST
cd /Applications/SoapUI-5.0.0.app/Contents/java/app/bin
sh /Applications/SoapUI-5.0.0.app/Contents/java/app/bin/testrunner.sh -s"Activity_Add_Edit_Delete" -r -a -f/Users/mindtap/SOAPUI/Reports /Users/mindtap/SOAPUI/ccs-soapui-tests/Course_Builder-soapui-project.xml

#sh testrunner.sh -s"Activity_Add_Edit_Delete" -r -a -f/Users/mindtap/source/SOAPUI/Reports /Users/mindtap/SOAPUI/ccs-soapui-tests/Course_Builder-soapui-project.xml