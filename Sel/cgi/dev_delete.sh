#Run Maven Commands

echo Running Maven Delete Utility…

cd /opt/code/ccs-soapui-tests/Sel/cgi
sudo chown -R ec2-user:ec2-user /opt/code/ccs-soapui-tests/Sel
export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.85.x86_64/jre
export PATH=$PATH:/opt/apache-maven-3.3.3/bin:$JAVA_HOME/bin

echo **** After Setting Path *****
ls -al
echo $JAVA_HOME
echo $PATH

defhost=https://d-login.cengage.com/cb/login.htm
HOST=${1-$defhost}
defuser=soapui_mktg9@ng.com
USER=${2-$defuser}
defpass=Techizen_123
PASS=${3-$defpass}

echo **** Maven Delete Starts *****

mvn -version

mvn clean test -Dtest=DeleteCourse -Denv.CBURL=$HOST -Denv.USER=$USER -Denv.PASS=$PASS

echo **** Maven Delete Ends *****