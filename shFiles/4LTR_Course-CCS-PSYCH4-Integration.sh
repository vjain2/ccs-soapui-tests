# Run Maven test suite from Jenkin to capture Dynamic CGI from newly created Course
cd /Users/mindtap/SOAPUI/ccs-soapui-tests
git pull

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
defxls=/Users/mindtap/SOAPUI/ccs-soapui-tests/Data/SoapUI_STAGE_CCS_PSYCH4.xls
XLS=${7-$defxls}
#-Denv.XLS=$XLS

# Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI TestSuite on: $HOST
cd /Applications/SoapUI-5.0.0.app/Contents/java/app/bin
sh testrunner.sh -e$SHOST -s"4LTR CCS Search TestSuite" -PXLPath=$XLS -r -a -f/Users/mindtap/SOAPUI/Reports /Users/mindtap/SOAPUI/ccs-soapui-tests/4LTR_Course-E2E_cdf_project.xml
sh testrunner.sh -e$HOST -s"4LTR CCS API Integration ProjectTestSuite" -PXLPath=$XLS -r -a -f/Users/mindtap/SOAPUI/Reports /Users/mindtap/SOAPUI/ccs-soapui-tests/4LTR_Course-E2E_cdf_project.xml

