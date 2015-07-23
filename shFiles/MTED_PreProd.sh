
defhost=localhost
HOST=${1-$defhost}
defxls1=/opt/code/ccs-soapui-tests/Data/OAT_PreProd.xls
XLS1=${7-$defxls1}
defxls2=/opt/code/ccs-soapui-tests/Data/EDMS_Lite_Validation_PreProd.xls
XLS2=${8-$defxls2}
defxls3=/opt/code/ccs-soapui-tests/Data/Term_Assets.xls
XLS3=${9-$defxls3}
#-Denv.XLS=$XLS

# Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI TestSuite on: $HOST
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"OAT" -PXLPath=$XLS1 -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/MTED_PreProd-soapui-project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"Validation_Code_Course_Label" -PXLPath=$XLS2 -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/MTED_PreProd-soapui-project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"Learning_Outcome_Array" -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/MTED_PreProd-soapui-project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"Objectives_Bad Data" -PXLPath=$XLS3 -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/MTED_PreProd-soapui-project.xml

