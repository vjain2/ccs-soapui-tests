# Run SoapUI test suite from Jenkin with Host as parameter
defhost=localhost
HOST=${1-$defhost}
echo Running SOAPUI TestSuite on: $HOST
cd /Applications/SoapUI-5.0.0.app/Contents/java/app/bin
sh testrunner.sh -e$HOST -s"SOA 4LTR Variant Course Service TestSuite" -r -a -f/Users/mindtap/source/SOAPUI/Reports /Users/mindtap/source/SOAPUI/4LTR_Course_Variant-Project-soapui-project.xml