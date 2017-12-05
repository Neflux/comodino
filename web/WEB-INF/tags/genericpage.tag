<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="pagetitle" fragment="true" %>
<%@attribute name="pagecss" fragment="true" %>
<%@attribute name="pageheader" fragment="true" %>
<%@attribute name="pagejavascript" fragment="true" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/favicon-16x16.png">
    <link rel="manifest" href="${pageContext.request.contextPath}/manifest.json">
    <link rel="mask-icon" href="${pageContext.request.contextPath}/safari-pinned-tab.svg" color="#5bbad5">
    <meta name="theme-color" content="#ffffff">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" media="screen">
    <script src="https://use.fontawesome.com/f98c8dd683.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/my.css">
    <jsp:invoke fragment="pagecss"/>
    <title><jsp:invoke fragment="pagetitle"/></title>
</head>
<body>
    <jsp:invoke fragment="pageheader"/>

    <jsp:doBody/>

    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/custom.js"></script>
    <script src="${pageContext.request.contextPath}/js/now-ui-kit.js"></script>
    <script src="${pageContext.request.contextPath}/js/header.js"></script>

    <jsp:invoke fragment="pagejavascript"/>
</body>
</html>