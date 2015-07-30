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

mvn -version

mvn clean test -Dtest=DeleteCourse -Denv.CBURL=https://d-login.cengage.com/cb/login.htm -Denv.OLRURL=http://d-olradmin.cengage.com/olr/admin/index.jsp -Denv.USER=soapui_psych4@ng.com -Denv.PASS=Techizen_123 -Denv.OLRUSER=vinay.thakur@contractor.cengage.com -Denv.OLRPASS=Techizen_123
