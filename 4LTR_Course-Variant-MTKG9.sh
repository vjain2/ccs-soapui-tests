# Run SoapUI test suite from Jenkin with Host as parameter
sudo cd /opt/code/ccs-soapui-tests/
echo * * * * * * list of files * * * * * * * * *
pwd
echo * * * * * * git command start * * * * * * * * * 

sudo git stash
sudo git pull

echo * * * * * * SOAPUI tests starting  * * * * * * 

#cd /Applications/SoapUI-5.0.0.app/Contents/java/app/bin
defhost=localhost
HOST=${1-$defrost}
echo Running SOAPUI TestSuite on Endpoint *** : $HOST
 
sh /opt/ReadyAPI-1.2.2/bin/testrunner.sh -e$HOST -s "SOA_4LTR_MTKG9_Course_Variant_ProjectTestSuite" /opt/code/ccs-soapui-tests/4LTR_Course-Variant-MTKG9-soapui-project.xml

