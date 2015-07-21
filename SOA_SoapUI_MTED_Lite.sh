
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
defxls=/opt/code/ccs-soapui-tests/Data/SoapUI_STAGE_CCS_PSYCH4.xls
XLS=${7-$defxls}
#-Denv.XLS=$XLS

# Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI TestSuite on: $HOST
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$SHOST -s"Create & Copy from Master" -PXLPath=$XLS -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$SHOST -s"Actions" -PXLPath=$XLS -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/4LTR_Course-E2E_cdf_project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$SHOST -s"Associations bet Objectives-Assessment items" -PXLPath=$XLS -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$SHOST -s"Objectives_Bad Data" -PXLPath=$XLS -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$SHOST -s"Label_CourseID_Code_Validations" -PXLPath=$XLS -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$SHOST -s"OAT" -PXLPath=$XLS -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$SHOST -s"Learning_Outcome_Array" -PXLPath=$XLS -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml

