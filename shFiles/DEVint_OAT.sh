defhost=http://10.172.111.30:4000
HOST=${1-$defhost}
defxls1=/opt/code/ccs-soapui-tests/Data/OAT.xls
XLS1=${7-$defxls1}
defCourseKey1=BEAR
CourseKey1=${5-$defCourseKey1}
#-Denv.XLS=$XLS

# Run SoapUI test suite from Jenkin with Host as parameter
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"OAT" -PXLPath=$XLS1 -PCourseKey1=$CourseKey1  -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOA-MTED-Lite-soapui-project.xml







