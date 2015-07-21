# Run SoapUI test suite from Jenkin with Host as parameter
defhost=localhost
HOST=${1-$defhost}
echo Running SOAPUI TestSuite on: $HOST
cd /Applications/SoapUI-5.0.0.app/Contents/java/app/bin
sh testrunner.sh -e$HOST -s"SOA 4LTR MTKG9 Course Variant ProjectTestSuite" -r -a -f/Users/mindtap/source/SOAPUI/Reports /Users/mindtap/source/SOAPUI/4LTR_Course-Variant-MTKG9-soapui-project.xml