# Run Maven test suite from Jenkin to capture Dynamic CGI from newly created Course
cd /opt/code/ccs-soapui-tests/
git pull

# Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI TestSuite on: $HOST
#cd /Applications/SoapUI-5.0.0.app/Contents/java/app/bin

#sh testrunner.sh -s"Services" -r -a -f/Users/mindtap/SOAPUI/Reports /Users/mindtap/SOAPUI/ccs-soapui-tests/STAGE-Services-Check-soapui-project.xml

sh /opt/SoapUI-5.1.3/bin/testrunner.sh -s"Services" -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/STAGE-Services-Check-soapui-project.xml