<%@ page import="main.Product" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="main.ProductGroup" %>
<%@ page import="main.Shop" %>

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
                    <img src="http://www.whirlpool.it/digitalassets/Picture/web1000x1000/852575438010_1000x1000_frontal.jpg" width="100" height="100">
                </div>
                <div class="col-md-7 text-left">
                    <h2>Piano cottura</h2>
                    <p>Venduto da <a href="www.google.com">Nardi</a>&nbsp&nbsp<span style="font-size:12px">o da altri <a data-toggle="modal" data-target="#vendorsModal">12</a> venditori</span></p>
                    <h1 class="prezzo">320 €</h1>
                </div>
                <div class="col-md-3">
                    <i class="fa fa-star rating_star" aria-hidden="true"></i> <i class="fa fa-star rating_star" aria-hidden="true"></i> <i class="fa fa-star rating_star" aria-hidden="true"></i> <i class="fa fa-star-o rating_star" aria-hidden="true"></i> <i class="fa fa-star-o rating_star" aria-hidden="true"></i>&nbsp&nbsp43 recensioni
                    <a href="#" class="btn btn-default margins">Aggiungi al carrello&nbsp&nbsp<i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                </div>
            </div>
            <%
                if (request.getAttribute("products") != null) {
                    Map<String,ProductGroup> products = (Map<String,ProductGroup>) request.getAttribute("products");
                    int count = 0;

                    Iterator it = products.entrySet().iterator();
                    while (it.hasNext()) {
                        Map.Entry pair = (Map.Entry)it.next();
                        //System.out.println(pair.getKey() + " = " + pair.getValue());
                        ProductGroup gp = (ProductGroup) pair.getValue();
                        Product p = gp.getList().get(0);    //il primo prodotto
                        String vendors_array = "[";
                        String price_array = "[";

                        System.out.println(pair.getKey().toString());
                        for (Shop item : gp.getVendors()) {
                            //System.out.println(item.getSampleActualPrice());
                            vendors_array += "\"" + item.getName() + "\",";
                            price_array += "\"" + item.getSampleActualPrice() + "\",";
                        }

                        vendors_array += "\"\"]";
                        price_array += "\"\"]";

                        String all_array = "{\"vendors\":"+vendors_array+",\"prices\":"+price_array+"}";

                        System.out.println(all_array);

                        count++;
                        int rc = (int)gp.getReviewCount();
                        String review = ((rc>0)?((rc>1)?rc+" recensioni":"1 recensione"):"Nessuna recensione");
                        String imageSrc = "data:image/gif;base64," + gp.getImageData();
                        if(gp.getImageData().equals("")){
                            imageSrc = "http://via.placeholder.com/1000x1000";
                        }
            %>
                        <div class="search_row row vcenter separated">
                            <div class="col-md-2">
                                <img src='<%=imageSrc%>' alt='images Here' width="100" height="100"/>
                            </div>
                            <div class="col-md-7 text-left">
                                <h2><%=p.getProductName()%></h2>
                                <p>Venduto da <a href="#"><%=p.getShopName()%></a>&nbsp&nbsp<span style="font-size:12px">o da altri <a href="#" onclick="openModal('<%=p.getProductName()%>');"><%=gp.getList().size()%></a> venditori</span></p>
                                <h1 class="prezzo"><%=p.getActualPrice()%> €</h1>
                            </div>
                            <div class="col-md-3">
                                <%
                                    int i = 0;
                                    for(; i < p.getRating();i++){
                                        %>
                                <i class="fa fa-star rating_star" aria-hidden="true"></i>
                                        <%
                                    }
                                    for(; i < 5 ;i++){
                                        %>
                                <i class="fa fa-star-o rating_star" aria-hidden="true"></i>
                                        <%
                                    }
                                        %>&nbsp&nbsp<span class="text-right"><%=review%></>
                                <a href="#" class="btn btn-default margins">Aggiungi al carrello&nbsp&nbsp<i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                            </div>
                        </div>
            <%
                        it.remove();
                    }
                }
            %>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="vendorsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="row">
                <div class="card card-signup centerize" data-background-color="orange" id="signup_login_card">
                    <span class="form" id="form">
                        <div class="header header-primary text-center">
                            <h4 class="title title-up" id="card_titolo_vendors">Piano cottura</h4>
                            <p class="white subtitolo">
                                Disponibile anche da:
                            </p>
                        </div>
                        <div class="content">
                            <div class="row text-center">
                                <div class="content-modal-vendors" id="content-modal-vendors">

                                </div>
                            </div>
                        </div>
                        <div class="footer text-center">

                        </div>
                    </span>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript" src="js/search/search.js"></script>
</html>
