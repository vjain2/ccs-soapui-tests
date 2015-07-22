# Run Maven test suite from Jenkin to capture Dynamic CGI from newly created Course
cd /opt/code/ccs-soapui-tests/
git pull

defhost=localhost
HOST=${1-$defhost}
defshost=localhost
SHOST=${2-$defshost}
defuser=soapui_mktg9@ng.com
USER=${3-$defuser}
defpass=Techizen_123
PASS=${4-$defpass}
defolruser=vinay.thakur@contractor.cengage.com
OLRUSER=${5-$defolruser}
defolrpass=Techizen_123
OLRPASS=${6-$defolrpass}
defxls=/opt/code/ccs-soapui-tests/Data/SoapUI_INT_CCS.xls
XLS=${7-$defxls}
#-Denv.XLS=$XLS

# Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI TestSuite on: $HOST

sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$SHOST -s"4LTR CCS Search TestSuite" -PXLPath=$XLS -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/4LTR_Course-E2E_cdf_project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"4LTR CCS API Integration ProjectTestSuite" -PXLPath=$XLS -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/4LTR_Course-E2E_cdf_project.xml