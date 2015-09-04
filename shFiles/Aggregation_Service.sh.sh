# Run Maven test suite from Jenkin to capture Dynamic CGI from newly created Course

defhost=localhost
HOST=${1-$defhost}
defxls=/opt/code/ccs-soapui-tests/Data/aggregation_service.xls
XLS=${7-$defxls}


# Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI TestSuite on: $HOST
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"Aggregation Service" -PXLPath=$XLS -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/Aggregation-service-soapui-project.xml
