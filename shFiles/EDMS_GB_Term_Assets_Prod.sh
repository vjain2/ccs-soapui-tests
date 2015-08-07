defhost=localhost
HOST=${1-$defhost}
defxls1=/opt/code/ccs-soapui-tests/Data/GB_Prod.xls
XLS1=${7-$defxls1}
#-Denv.XLS=$XLS

# Run SoapUI test suite from Jenkin with Host as parameter
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"EDMS_GB_Term_Assets_Prod" -PXLPath=$XLS1 -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOAPUI_QA_EDMSL_GB_Prod-soapui-project.xml






