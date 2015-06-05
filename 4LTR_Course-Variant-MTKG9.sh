# Run SoapUI test suite from Jenkin with Host as parameter
defhost=localhost
HOST=${1-$defhost}
echo Running SOAPUI TestSuite on: $HOST
#cd /Applications/SoapUI-5.0.0.app/Contents/java/app/bin
cd /opt/ReadyAPI-1.2.2/bin/
sh testrunner.sh -s "SOA_4LTR_MTKG9_Course_Variant_ProjectTestSuite" /home/cmartello/ccs-soapui-tests/4LTR_Course-Variant-MTKG9-soapui-project.xml

#sh /opt/ReadyAPI-1.2.2/bin/testrunner.sh -e$HOST -s"SOA 4LTR MTKG9 Course Variant ProjectTestSuite" -r -a -f/ccs-soapui-tests/Reports /ccs-soapui-tests/4LTR_Course-Variant-MTKG9-soapui-project.xml