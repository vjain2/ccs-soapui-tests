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
defxls=/Users/mindtap/SOAPUI/Data/SoapUI_REG_e2e_4LTR_Variant.xls
XLS=${7-$defxls}

echo !!!Running Maven test suite START on: $HOST to capture Dynamic CGI from newly created Course!!!
cd /Users/mindtap/Documents/workspace/cgi
pwd
export PATH=$PATH:/usr/local/apache-maven/apache-maven-3.3.3/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_11.jdk/Contents/Home/jre
ls -l
mvn -version
#mvn clean test
mvn clean test -Denv.CBURL=https://d-login.cengage.com/cb/login.htm -Denv.OLRURL=http://d-olradmin.cengage.com/olr/admin/index.jsp -Denv.USER=$USER -Denv.PASS=$PASS -Denv.OLRUSER=$OLRUSER -Denv.OLRPASS=$OLRPASS -Denv.XLS=$XLS

echo !!!Maven test suite END’s!!!

# Run SoapUI test suite from Jenkin with Host as parameter

echo Running SOAPUI TestSuite on: $HOST
cd /Applications/SoapUI-5.0.0.app/Contents/java/app/bin
sh testrunner.sh -e$SHOST -s"4LTR Regression Search TestSuite" -PXLPath=$XLS -r -a -f/Users/mindtap/SOAPUI/Reports /Users/mindtap/SOAPUI/ccs-soapui-tests/4LTR_Course-Regression_project.xml
sh testrunner.sh -e$HOST -s"4LTR Regression API ProjectTestSuite" -PXLPath=$XLS 	-r -a -f/Users/mindtap/SOAPUI/Reports /Users/mindtap/SOAPUI/ccs-soapui-tests/4LTR_Course-Regression_project.xml
