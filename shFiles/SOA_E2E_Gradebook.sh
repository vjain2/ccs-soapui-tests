defhost=localhost
HOST=${1-$defhost}
defxls=/opt/code/ccs-soapui-tests/Data/SoapUI_Gradebook_E2E_Phase_2.xls
XLS=${7-$defxls}

# Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI TestSuite on: $HOST

sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"Gradebook_E2E_Test_Int_Env" -PXLPath=$XLS -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/Gradebook_E2E_Phase2-soapui-project.xml



