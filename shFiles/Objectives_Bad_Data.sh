defhost=localhost
HOST=${1-$defhost}
defxls2=/opt/code/ccs-soapui-tests/Data/Term_Assets.xls
XLS2=${7-$defxls2}

# Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI TestSuite on: $HOST

sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"Objectives_Bad Data" -PXLPath=$XLS2 -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml

