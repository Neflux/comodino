<%@ page import="main.Product" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!doctype html>
<html lang="it">
    <head>
        <title>Ricerca</title>
    </head>
    <body>
        <jsp:include page="header_anonimo.jsp" flush="true" />
        <div class="container" style="margin-top: 75px">
            <table class="table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Rating</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if (request.getAttribute("products") != null) {
                        List<Product> products = (List<Product>) request.getAttribute("products");
                        int count = 0;
                        for(Product p: products){
                            count++;
                %>
                <tr>
                    <th scope="row"><%=count%></th>
                    <td><%=p.getProductName()%></td>
                    <td><%=p.getPrice()%></td>
                    <td><%=p.getRating()%></td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </body>
</html>
