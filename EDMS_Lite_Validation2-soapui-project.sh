# Run Maven test suite from Jenkin to capture Dynamic CGI from newly created Course
cd /Users/mindtap/SOAPUI/ccs-soapui-tests
git pull
# Run SoapUI test suite from Jenkin
defhost=localhost

HOST=${1-$defhost}
#TestSuite=${$TS-$testsuite}
#PROJECT=${$PR-$project}

#echo Running SOAPUI on: $HOST #TestSuite Name as $TestSuite and PROJECT Name as $PROJECT
cd /Applications/SoapUI-5.0.0.app/Contents/java/app/bin

sh testrunner.sh -s"SoapUI QA - EDMSL2 MTED_Term_Assets" -r -a -f/Users/mindtap/SOAPUI/Reports /Users/mindtap/SOAPUI/ccs-soapui-tests/EDMS_Lite_Validation-soapui-project.xml