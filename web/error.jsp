<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error</title>
</head>
<body>
<h1>ERRORE FATALE DC!</h1>
<p>
    <%
        String message = (String) request.getAttribute("message");
        out.print(message);
    %>
</p>
</body>
</html>