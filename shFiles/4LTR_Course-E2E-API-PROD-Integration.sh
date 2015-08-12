# Run Maven test suite from Jenkin to capture Dynamic CGI from newly created Course
defhost=localhost
HOST=${1-$defhost}
defshost=localhost
SHOST=${2-$defshost}
defuser=vinay.thakur@contractor.cengage.com
USER=${3-$defuser}
defpass=Techizen_321
PASS=${4-$defpass}
defolruser=vinay.thakur@contractor.cengage.com
OLRUSER=${5-$defolruser}
defolrpass=Techizen_321
OLRPASS=${6-$defolrpass}
defxls=/opt/code/ccs-soapui-tests/Data/SoapUI_e2e_4LTR_PROD.xls
XLS=${7-$defxls}

echo !!!Running Maven test suite START on: $HOST to capture Dynamic CGI from newly created Course!!!
cd /opt/code/ccs-soapui-tests/Sel/cgi
pwd
export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.85.x86_64/jre
export PATH=$PATH:/opt/apache-maven-3.3.3/bin:$JAVA_HOME/bin

echo **** After Setting Path *****
ls -al
echo $JAVA_HOME
echo $PATH
mvn -version

mvn clean test -Denv.CBURL=https://login.cengage.com/cb/login.htm -Denv.OLRURL=http://olradmin.cengage.com/olr/admin/index.jsp -Denv.USER=$USER -Denv.PASS=$PASS -Denv.OLRUSER=$OLRUSER -Denv.OLRPASS=$OLRPASS -Denv.XLS=$XLS -Denv.PRODUCT='Lamb/Hair/McDaniel, MKTG (with LMS Integrated Online 1 term (6 months) Printed Access Card), 9th Edition'
 
echo !!!Maven test suite END’s!!!

# Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI TestSuite on: $HOST
#cd /Applications/SoapUI-5.0.0.app/Contents/java/app/bin
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$SHOST -s"4LTR E2E Search TestSuite" -PXLPath=$XLS -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/4LTR_Course-E2E_project.xml
sh /opt/SoapUI-5.1.3/bin/testrunner.sh -e$HOST -s"4LTR E2E API Integration ProjectTestSuite" -PXLPath=$XLS -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/4LTR_Course-E2E_project.xml

