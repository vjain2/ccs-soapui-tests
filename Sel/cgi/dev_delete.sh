cd /opt/code/ccs-soapui-tests/Sel/cgi
mvn clean test -Dtest=DeleteCourse -Denv.CBURL=https://d-login.cengage.com/cb/login.htm -Denv.OLRURL=http://d-olradmin.cengage.com/olr/admin/index.jsp -Denv.USER=soapui_psych4@ng.com -Denv.PASS=Techizen_123 -Denv.OLRUSER=vinay.thakur@contractor.cengage.com -Denv.OLRPASS=Techizen_123
