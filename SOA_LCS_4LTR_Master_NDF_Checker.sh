# Run SoapUI test suite from Jenkin
defhost=localhost

HOST=${1-$defhost}
#TestSuite=${$TS-$testsuite}
#PROJECT=${$PR-$project}

#echo Running SOAPUI on: $HOST #TestSuite Name as $TestSuite and PROJECT Name as $PROJECT
cd /Applications/SoapUI-5.0.0.app/Contents/java/app/bin

sh testrunner.sh -s”MasterNDF_Checker_TestSuite” -r -a -f/Users/mindtap/SOAPUI/ccs-soapui-tests /Users/mindtap/SOAPUI/ccs-soapui-tests/LCS-Int-4LTR-Master-NDF-checker-Project-soapui-project.xml
