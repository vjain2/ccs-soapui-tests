defhost=localhost
HOST=${1-$defhost}

# Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI TestSuite on: $HOST

sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"Create & Copy from Master" -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml

