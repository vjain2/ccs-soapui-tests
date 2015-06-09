# Run SoapUI test suite from Jenkin with Host as parameter
cd /opt/code/ccs-soapui-tests/

* * * * * * git command start * * * * * * * * * 

git stash
git pull

echo * * * * * * SOAPUI tests starting  * * * * * * 

#cd /Applications/SoapUI-5.0.0.app/Contents/java/app/bin

 
sh /opt/ReadyAPI-1.2.2/bin/testrunner.sh -s "SOA_4LTR_MTKG9_Course_Variant_ProjectTestSuite" /opt/code/ccs-soapui-tests/4LTR_Course-Variant-MTKG9-soapui-project.xml

