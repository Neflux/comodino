<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% String role = "header_anonimo.jsp"; %>
<jsp:include page="<%= role %>" flush="true" />

<!doctype html>
<html lang="it">
  <head>
    <title>Comodino.it</title>
  </head>
  <body>
    <div class="jumbotron">
      <h1>Bootstrap Tutorial</h1>
      <p>Bootstrap is the , and JS framework for developing responsive,
        mobile-first projects on the web.</p>
    </div>
    <div class="container">
      <p><c:out value = "${'FUNZIONA!'}"/></p>
      <p>This is another text.</p>
    </div>
  </body>
</html>
