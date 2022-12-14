# Cinema service
Simple CRUD web service API based on Spring Framework, that simulates cinema business logic

## Functionality

### Security

Basic, and formLogin authentication, with role-based authorization. Performs access to api endpoints through two roles - `ADMIN` and `USER`. 
Registration with `POST /register` endpoint by email and password, and repeat password confirmation

### Core functionality

With this application you can do diffrent cinema-related actions: create movies/cinema halls/movie sessions, allow users to order tickets to certain movie sessions.

Controller layer giving access to such api endpoints:

`POST /movies` - add movie, with certain title and decription

`GET /movies` - get list of movies

`POST /cinema-halls` - add cinema hall, with certain capacity and decription

`GET /cinema-halls` - get list of cinema halls

`POST /movie-sessions` - add movie session, with movie, cinema hall and show time

`PUT /movie-sessions/{id}` - update existent movie session

`GET /movie-sessions/available` - get list of available movie sessions by movie and show time

`DELETE /movie-sessions/{id}` - remove movie session by id

`POST /register` - register new user, with `USER` role and empty shopping cart

`GET /users/by-email` - get info about registered user by email

`PUT /shopping-carts/movie-sessions` - add movie session to user shopping cart

`GET /shopping-carts/by-user` - get shopping cart(list of tickets to movie sessions) of authenticated user

`POST /orders/complete` - create order with tickets based by authenticated user shopping cart, which is than cleared

`GET /orders` - get list of orders, of authenticated user

## Project structure

Spring MVC and Spring Security configs in `cinema.config` package

### N-tier architecture:

1. Preview level: packages `cinema.controller`, `cinema.dto`
2. Business level: packages `cinema.service`, `cinema.model`
3. Persistance level: package `cinema.dao`
+ MySql database

## Technologies

Application based on Spring Framework version 5.2.2.RELEASE

### Web

Apache Tomcat 9.0.68 as web server. Spring MVC as web framework, javax Servlet API version 4.0.1 . Jakson databind version 2.14.0

### Security

Spring Security to manage authentication and authorization

### Persistance

Hibernate ORM version 5.4.23.FINAL. MySql connector version 8.0.22

### Other

Apache Commons 2.8.0. Javax annotaton API 1.3.2. Apache Maven as build platform

## SetUp guide

### Prerequisites

You must have JDK at least 11 version, and maven installed to build and launch the application, and Git to clone repository.
Also you shoud have Tomcat installed to run application
Also you should install MySql with Workbench and CLI to create MySql database, or use another solution like remote MySql repository services.

- [JDK installation instruction for Windows](https://access.redhat.com/documentation/en-us/openjdk/11/html-single/installing_and_using_openjdk_11_for_windows/index)
- [Maven installation instruction](https://maven.apache.org/install.html)
- [Tomcat installation instruction](http://www.yorku.ca/jhuang/examples/tomcat-install.html)
- [MySql installation guide](https://dev.mysql.com/doc/mysql-installation-excerpt/5.7/en/)

### Initializing DB
Launch MySql Workbench and create new db connection.
Remember connection related parameters such as hostname/port, username and password as it will be needed when we configure connection to this db in the application. 
Using [sql query tool](https://www.youtube.com/watch?v=M-OXq10Tj-E&ab_channel=GeekyShows) run [this](/src/main/resources/init-db.sql) SQL script to initialize db. This will create db schema that uses in this app.

Configuring application
Clone repository using Git CLI or IDE. In src/main/resources fill file db.properties with your db parameters.

### Running with IDE | using IntellyJ IDEA Ultimate

[tutorial](https://mkyong.com/intellij/intellij-idea-run-debug-web-application-on-tomcat/)
