
compile:
	javac -cp .:WEB-INF/lib/* src/com/unrealbooks/*/* -d WEB-INF/classes

war: compile
	jar -cvf OnlineShoppingNetwork.war *
	mv *.war ~/Desktop/final/project/wildfly-11.0.0.CR1/standalone/deployments/

