# Java Full Stack Enterprise Web Application Development
Full stack enterprise web development with Java, Tomcat, JSP, Servlet, Session Tracking, Request Dispatcher, JDBC, Oracle, HTML, CSS, JavaScript, Ajax, JQuery, & JSON.

Glossary

Term|	Definition
--- | ---
Tomcat | Web server.  Interprets .xml, .html, and .class files and runs them.  Handles http requests.
JSP	| Java Server Pages.  enable us to inject dynamic content into a static page. 
JSP	| Java Server Pages.  enable us to inject dynamic content into a static page. 
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
