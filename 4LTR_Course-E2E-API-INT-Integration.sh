# Run Maven test suite from Jenkin to capture Dynamic CGI from newly created Course
cd /Users/mindtap/SOAPUI/ccs-soapui-tests
git pull

echo !!!Running Maven test suite START on: $HOST to capture Dynamic CGI from newly created Course!!!
cd /Users/mindtap/Documents/workspace/cgi
export PATH=$PATH:/usr/local/apache-maven/apache-maven-3.3.3/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_11.jdk/Contents/Home/jre
ls -l
mvn -version
mvn clean test -Denv.CBURL=https://kt-login.cengage.com/cb/login.htm -Denv.OLRURL=http://kt-olradmin.cengage.com/olr/admin/index.jsp
echo !!!Maven test suite END’s!!!

# Run SoapUI test suite from Jenkin with Host as parameter

defhost= localhost
HOST=${1-$defhost}
echo Running SOAPUI TestSuite on: $HOST
cd /Applications/SoapUI-5.0.0.app/Contents/java/app/bin
sh testrunner.sh -e$HOST -s"4LTR E2E API Integration ProjectTestSuite" -r -a -f/Users/mindtap/SOAPUI/ccs-soapui-tests/Reports /Users/mindtap/SOAPUI/ccs-soapui-tests/4LTR_Course-E2E_project.xml
