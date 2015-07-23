defhost=localhost
HOST=${1-$defhost}
defxls1=/opt/code/ccs-soapui-tests/Data/GB_PreProd.xls
XLS1=${7-$defxls1}


echo Running SOAPUI TestSuite on: $HOST
sh testrunner.sh -e$HOST -s"EDMS_GB_Term_Assets" -PXLPath=$XLS1 -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOAPUI_QA_EDMSL2_GB_PreProd-soapui-project.xml

