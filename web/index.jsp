<%@ page import="utils.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.util.Base64" %>
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
        String imgDataBase64 = "";
        DBConnection dbc = new DBConnection();
        try {
          ResultSet rs = dbc.select("select * from shopphoto");
          rs.next();
          Blob imgData = rs.getBlob("Image");
          imgDataBase64 = new String(Base64.getEncoder().encode(imgData.getBytes(1,(int)imgData.length())));
          imgData.free();
        } catch(Exception e){
          e.printStackTrace();
        }
      %>
      <img src="data:image/gif;base64,<%= imgDataBase64%>" alt="images Here" width="130px" height="90px"/>
      <p><c:out value = "${'FUNZIONA!'}"/></p>
      <p>This is another text.</p>
    </div>
  </body>
</html>
