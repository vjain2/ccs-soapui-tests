
defhost=localhost
HOST=${1-$defhost}
defshost=localhost
SHOST=${2-$defshost}
defuser=soapui_psych4@ng.com
USER=${3-$defuser}
defpass=Techizen_123
PASS=${4-$defpass}
defolruser=vinay.thakur@contractor.cengage.com
OLRUSER=${5-$defolruser}
defolrpass=Techizen_123
OLRPASS=${6-$defolrpass}
defxls1=/opt/code/ccs-soapui-tests/Data/EDMS_Lite_Validation.xls
XLS1=${7-$defxls1}
defxls1=/opt/code/ccs-soapui-tests/Data/Term_Assets.xls
XLS2=${7-$defxls2}
defxls3=/opt/code/ccs-soapui-tests/Data/OAT.xls
XLS3=${7-$defxls3}
#-Denv.XLS=$XLS

# Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI TestSuite on: $HOST
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$SHOST -s"Create & Copy from Master" -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$SHOST -s"Actions" -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/4LTR_Course-E2E_cdf_project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$SHOST -s"Associations bet Objectives-Assessment items" -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$SHOST -s"Objectives_Bad Data" -PXLPath=$XLS2 -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$SHOST -s"Label_CourseID_Code_Validations" -PXLPath=$XLS1 -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$SHOST -s"OAT" -PXLPath=$XLS3 -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$SHOST -s"Learning_Outcome_Array" -PXLPath=$XLS2 -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml

