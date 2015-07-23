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
defxls=/opt/code/ccs-soapui-tests/Data/SoapUI_Gradebook_int_Phase_2.xls
XLS=${7-$defxls}
#-Denv.XLS=$XLS

# Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI TestSuite on: $HOST
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$SHOST -s"Gradebook_Integration_Env" -PXLPath=$XLS -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/Gradebook_Integration_Env_Phase2_new-soapui-project.xml




