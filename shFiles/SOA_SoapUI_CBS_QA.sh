defhost=localhost
HOST=${1-$defhost}
defxls=/opt/code/ccs-soapui-tests/Data/Dev_Course_Builder.xls
XLS=${7-$defxls}

# 
Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI 
TestSuite on: $HOST


sh /opt/SoapUI-5.1.3/bin/testrunner.sh -s"QA_Course_Builder" -PXLPath=$XLS -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/Course-Builder-QA-Env-soapui-project.xml