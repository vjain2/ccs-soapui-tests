defhost=localhost
HOST=${1-$defhost}
defxls=/opt/code/ccs-soapui-tests/Data/DevMath_Prod.xls
XLS=${7-$defxls}
#-Denv.XLS=$XLS

# Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI TestSuite on: $HOST
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"EDMS_DevMath_Retrieve_associations_Prod" -PXLPath=$XLS -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/EDMS_DevMath_Retrieve_associations_Prod-soapui-project.xml

