<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp" flush="true" />

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
      <%
        /*String imgDataBase64 = "";
        DBConnection dbc = new DBConnection();
        try {
          ResultSet rs = dbc.select("select * from shopphoto");
          while(rs.next()){
            Blob imgData = rs.getBlob("Image");
            imgDataBase64 = new String(Base64.getEncoder().encode(imgData.getBytes(1,(int)imgData.length())));
            imgData.free();
            out.println("<img src='data:image/gif;base64,"+imgDataBase64+"' alt='images Here' width='130px' height='90px'/>");
      }
        } catch(Exception e){
          e.printStackTrace();
        }*/

      %>
      <p><c:out value = "${'FUNZIONA!'}"/></p>
      <p>This is another text.</p>
    </div>
  </body>
</html>
