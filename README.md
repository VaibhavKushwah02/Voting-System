# Java Full Stack Enterprise Web Application Development
Full stack enterprise web development with Java, JSP, Servlet, Collection, Tomcat, JDBC, MVC Model, DAO, POJO, Oracle, HTML, CSS, JS, AJAX, JQuery, and JSON.

Glossary

Term|	Definition
--- | ---
Tomcat | Web server.  Interprets .xml, .html, and .class files and runs them.  Handles http requests.


Maven |	XML-based build tool for Java apps.  Automatically handles build dependencies.
DAO	| Data Access Object, is an object that provides an abstract interface to some type of database or other persistence mechanism
DTO	| A Data Transfer Object is an object that is used to encapsulate data, and send it from one subsystem of an application to another. DTOs are most commonly used by the Services layer in an N-Tier application to transfer data between itself and the UI layer.
Web API	| A framework that makes it easy to build HTTP services that reach a broad range of clients, including browsers and mobile devices
API	| Application program interface (API) is a set of routines, protocols, and tools for building software applications. An API specifies how software components should interact and APIs are used when programming graphical user interface (GUI) components.


Example DTO interface:

interface PersonDTO {

  String getName();

  void setName(String name);

}

Example DAO interface:

interface PersonDAO {

PersonDTO findById(long id);

void save(PersonDTO person);

}

Annotations

Name | Description
--- | ---
@Named | Provide a name to identify this object, once created.  Used in autowiring/dependency injection.
@Scope	| How long should this bean remain in memory?

"session" : the object should remain in memory for the entire time the user is logged in to the web session.

"request" : generate a new object with each http (web page) request.


Important Files

Filename | 	Purpose
--- | ---
web.xml | 	Configuration for a Java-based web application.
*.css	 | Stylesheet to provide consistent styling (font, etc.) across a website.

