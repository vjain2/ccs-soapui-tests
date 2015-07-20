# Run Maven test suite from Jenkin to capture Dynamic CGI from newly created Course
#cd /Users/mindtap/SOAPUI/ccs-soapui-tests
cd /opt/code/ccs-soapui-tests/
#git stash
git pull

# Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI TestSuite on: $HOST

sh /opt/SoapUI-5.1.3/bin/testrunner.sh -s"Services" -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/PROD-Services-Check-soapui-project.xml