# Run Maven test suite from Jenkin to capture Dynamic CGI from newly created Course
#cd /opt/code/ccs-soapui-tests/
#git pull

defhost=localhost
HOST=${1-$defhost}
defxls=/opt/code/ccs-soapui-tests/Data/SoapUI_4LTR.xls
XLS=${7-$defxls}


# Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI TestSuite on: $HOST
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$SHOST -s"SOA 4LTR Course Service TestSuite" -PXLPath=$XLS -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/4LTR_Course-Project-soapui-project.xml
