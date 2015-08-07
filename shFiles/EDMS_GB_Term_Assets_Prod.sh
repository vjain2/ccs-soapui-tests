# AWS Specific commands
sudo cd /opt/code/ccs-soapui-tests/
echo * * * * * * list of files * * * * * * * * *
pwd
echo * * * * * * git command start * * * * * * * * * 

sudo git stash
sudo git pull

echo * * * * * * SOAPUI tests starting  * * * * * * 

defhost=localhost
HOST=${1-$defrost}
echo Running SOAPUI TestSuite on Endpoint *** : $HOST
cd /opt/ReadyAPI-1.2.2/bin/ 
sh testrunner.sh -e$HOST -s"EDMS_GB_Term_Assets_Prod" -PXLPath=$XLS1 -r -a -f/opt/code/Reports /opt/code/ccs-soapui-tests/SOAPUI_QA_EDMSL_GB_Prod-soapui-project.xml







