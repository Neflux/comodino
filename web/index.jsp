<%@ page import="utils.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
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
      <p>Bootstrapciao is the , and JS framework for developing responsive,
        mobile-first projects on the web.</p>
    </div>
    <div class="container">
      <%
        DBConnection dbc = new DBConnection();
        try {
          ResultSet rs = dbc.select("select * from shop");
          while(rs.next())
            out.println(rs.getInt(1)+"  "+rs.getString(2));
          out.println("YEAH");
        } catch(Exception e){
          e.printStackTrace();
        }
      %>
      <p><c:out value = "${'FUNZIONA!'}"/></p>
      <p>This is another text.</p>
    </div>
  </body>
</html>
