# Run Maven test suite from Jenkin to capture Dynamic CGI from newly created Course
#cd /Users/mindtap/SOAPUI/ccs-soapui-tests
sudo cd /opt/code/ccs-soapui-tests/
sudo git stash
sudo git pull

# Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI TestSuite on: $HOST

sh /opt/SoapUI-5.2.0/bin/testrunner.sh -s"Services" -r -a /opt/code/ccs-soapui-tests/PROD-Services-Check-soapui-project.xml