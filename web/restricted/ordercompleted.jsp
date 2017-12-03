<%@ page contentType="text/html;charset=UTF-8" %>

<jsp:include page="./header.jsp" flush="true"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ordine Completato</title>
    <link rel="stylesheet" href="../css/ordercompleted.css">
</head>
<body>
<div class="container text-center">
    <h1><i class="fa fa-rocket fa-4x"></i></h1>
    <h1>Pagamento avvenuto con successo!</h1>
    <h3>Ordine N: ${param.orderid}</h3>
    <a id="ordini" href="${pageContext.request.contextPath}/restricted/orderhistory.jsp" class="btn btn-primary">I Miei Ordini</a>
</div>
</body>
</html>
