<%@ page import="main.Product" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!doctype html>
<html lang="it">
    <head>
        <link rel="stylesheet" type="text/css" href="css/search.css">
        <title>Ricerca</title>
    </head>
    <body>
        <jsp:include page="header_anonimo.jsp" flush="true" />
        <div class="banner">
            <h5>
                <a href="index.php">Home</a>
                <i class="fa fa-angle-right"></i>
                <span>Forno</span>
            </h5>
        </div>

        <div class="container" style="width:75%">
            <div class="search_row row vcenter">
                <div class="col-md-2">
                    <img src="http://www.whirlpool.it/digitalassets/Picture/web1000x1000/852575438010_1000x1000_frontal.jpg"/ width="100" height="100">
                </div>
                <div class="col-md-7 text-left">
                    <h2>Piano cottura</h2>
                    <p>Venduto da <a href="www.google.com">Nardi</a>&nbsp&nbsp<span style="font-size:12px">o da altri <a href="">12</a> venditori</span></p>
                    <h1 class="prezzo">320 €</h1>
                </div>
                <div class="col-md-3">
                    <i class="fa fa-star rating_star" aria-hidden="true"></i> <i class="fa fa-star rating_star" aria-hidden="true"></i> <i class="fa fa-star rating_star" aria-hidden="true"></i> <i class="fa fa-star-o rating_star" aria-hidden="true"></i> <i class="fa fa-star-o rating_star" aria-hidden="true"></i>&nbsp&nbsp43 recensioni
                    <a href="#" class="btn btn-default margins">Aggiungi al carrello&nbsp&nbsp<i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                </div>
            </div>
            <%
                if (request.getAttribute("products") != null) {
                    List<Product> products = (List<Product>) request.getAttribute("products");
                    int count = 0;
                    for(Product p: products){
                        count++;
            %>
                        <div class="search_row row vcenter separated">
                            <div class="col-md-2">
                                <img src="http://www.whirlpool.it/digitalassets/Picture/web1000x1000/852575438010_1000x1000_frontal.jpg"/ width="100" height="100">
                            </div>
                            <div class="col-md-7 text-left">
                                <h2><%=p.getProductName()%></h2>
                                <p>Venduto da <a href="www.google.com">Nardi</a>&nbsp&nbsp<span style="font-size:12px">o da altri <a href=""><%=p.getRating()%></a> venditori</span></p>
                                <h1 class="prezzo"><%=p.getPrice()%> €</h1>
                            </div>
                            <div class="col-md-3">
                                <i class="fa fa-star rating_star" aria-hidden="true"></i> <i class="fa fa-star rating_star" aria-hidden="true"></i> <i class="fa fa-star rating_star" aria-hidden="true"></i> <i class="fa fa-star-o rating_star" aria-hidden="true"></i> <i class="fa fa-star-o rating_star" aria-hidden="true"></i>&nbsp&nbsp43 recensioni
                                <a href="#" class="btn btn-default margins">Aggiungi al carrello&nbsp&nbsp<i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                            </div>
                        </div>
            <%
                    }
                }
            %>
        </div>
    </body>
</html>
