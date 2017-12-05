<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- INCLUDERE QUI TUTTE LE LIBRERIE E JAVABEANS ECC. --%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage>
    <jsp:attribute name="pagetitle">
        Titolo pagina
    </jsp:attribute>
    <jsp:attribute name="pagecss">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/test.css" >
    </jsp:attribute>

    <jsp:attribute name="pagejavascript">
        <script src="${pageContext.request.contextPath}/js/test.js"></script>
    </jsp:attribute>

    <jsp:body>
        <p>Hi I'm the heart of the message</p>
    </jsp:body>
</t:genericpage>