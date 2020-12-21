
compile:
	javac -cp .:WEB-INF/lib/* src/com/unrealbooks/*/* -d WEB-INF/classes

war: compile
	jar -cvf OnlineShoppingNetwork.war *
	mv *.war ~/Desktop/wildfly-11.0.0.CR1/standalone/deployments/

tester: compile
	java -cp WEB-INF/classes/:WEB-INF/lib/* Tester

prep:
	mv src/com/unrealbooks/controller/Tester.java ../
	mv Makefile ../

update:
	mv ../Tester.java src/com/unrealbooks/controller/
	
clean:
	rm -rf WEB-INF/classes/*
