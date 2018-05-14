#######################
# Building
#######################
# First compile the source into a deployable WAR
	$ mvn package
# Then launch the database/server in composed docker containers
	$ docker-compose up --build