# Run SoapUI test suite from Jenkin with Host as parameter
defhost=localhost
HOST=${1-$defhost}
echo Running SOAPUI TestSuite on: $HOST

sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"SOA Smoke TestSuite" -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-Smoke-soapui-project.xml