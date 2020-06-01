# Taskit App

An application for jobs and tasks organisation

## Technologies

* Java Spring Boot
* Spring data JPA
* JavaScript
* Java 14
* Maven

## Instructions

1. Import the project as a Maven project in your IDE.
2. Set up an instance of Apache Server 9 and put the module in.
3. Set up an instance of MySQL server and load the file taskit.sql
4. Start a browser window on http://localhost:8080/taskit/

## Structure

* Controllers
* Services
* Repositories
* Entities
* Utils
* Boot/Config

## How it works

First, the login. It counts with typical validations:

![1](https://github.com/ivanmirandastavenuiter/taskit-spring-boot-app/blob/master/pics/1.png)

After that, we have registration:

![2](https://github.com/ivanmirandastavenuiter/taskit-spring-boot-app/blob/master/pics/2.png)

Registration validations: it must have lower, upper, 8 minimum and one special character: 

![4](https://github.com/ivanmirandastavenuiter/taskit-spring-boot-app/blob/master/pics/4.png)

The entrance: here you can see all your saved notes. It contains the title, content, status and date.

![5](https://github.com/ivanmirandastavenuiter/taskit-spring-boot-app/blob/master/pics/5.png)

Create your note: put some text and a title and click save. A note will be saved.

![6](https://github.com/ivanmirandastavenuiter/taskit-spring-boot-app/blob/master/pics/6.png)

At done and undone you have your terminated tasks and the ones are pending yet: you can change the status toggling to the other with the arrows icon and also delete the notes.

![7](https://github.com/ivanmirandastavenuiter/taskit-spring-boot-app/blob/master/pics/7.png)

Sort the notes by date:

![8](https://github.com/ivanmirandastavenuiter/taskit-spring-boot-app/blob/master/pics/8.png)

And finally, log out:

![9](https://github.com/ivanmirandastavenuiter/taskit-spring-boot-app/blob/master/pics/9.png)








