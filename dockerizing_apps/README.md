# Dockerizing apps

This is an unordered list of the available workshops, you can start with the one you like.

## Working with Docker images

#### [easy_log](./easy_log)

It's a static php web application that was developed during INGEHACK CTF 2018 as a cyber-security challenge. It's a good start to learn how to dockerzie php apps since you will not need to link it with any other service like a database.

#### [hackerspaces](./hackerspaces)

It's a dynamic php web application that was developed during INGEHACK CTF 2018 as a cyber-security challenge. You will learn how to dockerize php apps that uses a database.

#### [mariadb](./mariadb)

When using databases for web apps, we often need to do some initialization like creating databases and tables. When we use databases as containers, we want this initialization to be present at every start of our container without the need to repeat it each time. Here we will create a mariadb image with init scripts for the [hackerspaces](./hackerspaces) app.

#### [nodejs](https://nodejs.org/en/docs/guides/nodejs-docker-webapp/)

This is an [awesome tutorial](https://nodejs.org/en/docs/guides/nodejs-docker-webapp/) made by Nodejs on how to dockerize a Nodejs web app.


#### [xpath-injection](./xpath-injection)

It's a Django web application that was developed during INGEHACK CTF 2018 as a cyber-security challenge. It's a good start to learn how to dockerzie Django apps since you will not need to link it with any other service like a database, it uses a local sqlite db.


## Working with docker-compose

You don't need to run your containers one by one and manage them, docker-compose can do that for you.

#### [Running hackerspaces and its db using docker-compose](./DockerComposeWebApp.md)

Here we will start the hackerspaces web app along with its db using docker-compose.

#### [Running all the apps using docker-compose](./DockerComposeWebApp.md)

Here we will start all the app dockerized so far using docker-compose.
