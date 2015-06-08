# Run SoapUI test suite from Jenkin
cd ~/SOAPUI/ccs-soapui-tests
pwd

/Users/mindtap/SOAPUI/ccs-soapui-tests
pwd
echo “* * * * * Test Starting * * * * *”
git pull

cd /Applications/SoapUI-5.0.0.app/Contents/java/app/bin

sh testrunner.sh -s”MasterNDF_Checker_TestSuite” -r -a -f/Users/mindtap/SOAPUI/ccs-soapui-tests/Reports /Users/mindtap/SOAPUI/ccs-soapui-tests/LCS-Int-4LTR-Master-NDF-checker-Project-soapui-project.xml
