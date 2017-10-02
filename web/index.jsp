<%@ page import="main.User" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp" flush="true" />

<!doctype html>
<html lang="it">
<head>
    <title>Comodino.it</title>
</head>
<body >
<%
    try {
        if (request.getParameter("action").equals("logout")){
%>
<div id="logoutPopup" class="alert alert-success alert-dismissable fade in" style="position:fixed; z-index: 999; right: 10px; opacity: 0;">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    Uscito con successo!
</div>
<%
        }
    }catch (Exception e){}
%>
<div class="container">
    <h1>Bootstrap Tutorial</h1>
    <p>Bootstrap is the , and JS framework for developing responsive,
        mobile-first projects on the web.</p>
</div>
</body>
</html>
