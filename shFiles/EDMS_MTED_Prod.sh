defhost=localhost
HOST=${1-$defhost}
defxls1=/opt/code/ccs-soapui-tests/Data/MTED_Prod.xls
XLS1=${7-$defxls1}
#-Denv.XLS=$XLS

# Run SoapUI test suite from Jenkin with Host as parameter
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"Objective" -PXLPath=$XLS1 -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/MTED_Prod-soapui-project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"Objective_Bad_Course_Assets" -PXLPath=$XLS1 -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/MTED_Prod-soapui-project.xml






