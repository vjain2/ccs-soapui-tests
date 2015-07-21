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
defxls=/opt/code/ccs-soapui-tests/Data/Dev_Course_Builder.xls
XLS=${7-$defxls}
#-Denv.XLS=$XLS

# Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI TestSuite on: $HOST

sh /opt/SoapUI-5.1.3/bin/testrunner.sh -s"Dev_Course_Builder" -PXLPath=$XLS -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/Course-Builder-Dev-soapui-project.xml
