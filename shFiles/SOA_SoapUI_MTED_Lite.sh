
defhost=localhost
HOST=${1-$defhost}
defxls1=/opt/code/ccs-soapui-tests/Data/EDMS_Lite_Validation.xls
XLS1=${7-$defxls1}
defxls2=/opt/code/ccs-soapui-tests/Data/Term_Assets.xls
XLS2=${8-$defxls2}
defxls3=/opt/code/ccs-soapui-tests/Data/OAT.xls
XLS3=${9-$defxls3}
#-Denv.XLS=$XLS

# Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI TestSuite on: $HOST
#sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"Create & Copy from Master" -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml
#sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"Actions" -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml
#sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"Associations bet Objectives-Assessment items" -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"Objectives_Bad Data" -PXLPath=$XLS2 -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"Label_CourseID_Code_Validations" -PXLPath=$XLS1 -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"OAT" -PXLPath=$XLS3 -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"Learning_Outcome_Array" -PXLPath=$XLS2 -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml

