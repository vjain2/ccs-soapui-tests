# Run SoapUI test suite from Jenkin with Host as parameter
defhost=localhost
HOST=${1-$defhost}
defxls=/opt/code/ccs-soapui-tests/Data/SoapUI_4LTR.xls
XLS=${7-$defxls}
echo Running SOAPUI TestSuite on: $HOST


sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$SHOST -s"4LTR Course Metadata_Services TestSuite" -PXLPath=$XLS -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/4LTR_Course_Metadata_Services.xml