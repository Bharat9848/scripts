if [ ! -d "$1" ]
then
	echo ". ./war-deploy.sh war-directory tomcat-directory"

else
	PID=`ps -ef | grep tomcat | grep -v grep | awk '{print $2}'`
	if [ ! -z $PID ]
	then
		echo "killing" $PID
		kill -9 $PID
		echo "killed" $PID
	fi
	if [ -d $2 ]
	then
		echo $2 "cleaning Webapps and logs folder"
		rm -rf $2/webapps/ROOT*
		rm $2/logs/*
		echo "cleaned webapps and logs folder"
	fi
	if [ -d $1 ]
	then
		echo "copying war"
		cp  $1/target/*.war $2/webapps/ROOT.war
		echo "done copying war"
		echo "starting tomcat"
		$2/bin/startup.sh
		echo "done starting tomcat"
	fi
 fi 
