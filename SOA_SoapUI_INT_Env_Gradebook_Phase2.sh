# Run SoapUI test suite from Jenkin
defhost=localhost

HOST=${1-$defhost}
#TestSuite=${$TS-$testsuite}
#PROJECT=${$PR-$project}

echo Running SOAPUI on: $HOST #TestSuite Name as $TestSuite and PROJECT Name as $PROJECT
cd /Applications/SoapUI-5.0.0.app/Contents/java/app/bin

sh testrunner.sh -s"Gradebook_Integration_Env" -r -a -f/Users/mindtap/source/SOAPUI/Reports /Users/mindtap/SOAPUI/ccs-soapui-tests/Gradebook_Integration_Env_Phase2_new-soapui-project.xml


