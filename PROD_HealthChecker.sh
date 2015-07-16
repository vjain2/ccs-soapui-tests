# Run Maven test suite from Jenkin to capture Dynamic CGI from newly created Course
cd /Users/mindtap/SOAPUI/ccs-soapui-tests
git pull

# Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI TestSuite on: $HOST
cd /Applications/SoapUI-5.0.0.app/Contents/java/app/bin
sh testrunner.sh -s"Services" -r -a -f/Users/mindtap/SOAPUI/Reports /Users/mindtap/SOAPUI/ccs-soapui-tests/PROD-Services-Check-soapui-project.xml