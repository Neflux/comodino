<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage>
    <jsp:attribute name="pagetitle">
        Test
    </jsp:attribute>
    <jsp:attribute name="pagecss">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/test.css" >
    </jsp:attribute>
    <jsp:attribute name="pageheader">
        <c:if test="${not empty sessionScope.user}">
            <h1 style="color: darkgreen">Utente loggato</h1>
        </c:if>
        <c:if test="${empty sessionScope.user}">
            <h1>Utente non loggato</h1>
        </c:if>
    </jsp:attribute>
    <jsp:body>
        <p>Hi I'm the heart of the message</p>
    </jsp:body>
    <jsp:attribute name="pagejavascript">
        <script src>
            // script inclusion in this tag
        </script>
    </jsp:attribute>
</t:genericpage>