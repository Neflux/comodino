<%@ page import="main.Product" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="main.ProductGroup" %>
<%@ page import="main.Shop" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!doctype html>
<html lang="it">
    <head>
        <link rel="stylesheet" type="text/css" href="css/search.css">
        <link rel="stylesheet" type="text/css" href="js/bootstrap-slider-master/bootstrap-slider-master/dist/css/bootstrap-slider.css">
        <title>Ricerca</title>

    </head>
    <body>
        <jsp:include page="header.jsp" flush="true" />
        <div class="banner">
            <h5>
                <a href="index.php">Home</a>
                <i class="fa fa-angle-right"></i>
                <span>Forno</span>
            </h5>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <div class="search_row" style="margin-left:-25%;height:100%;">
                        <h3 class="text-center">Categorie</h3>
                        <ul class="list-group">
                            <%
                                if (request.getAttribute("categories") != null)
                                {
                                    ArrayList<String> categories = (ArrayList<String>) request.getAttribute("categories");

                                    for (String i : categories) {
                                        if (request.getParameter("cat") != null)
                                        {
                                            Boolean trovato = false;
                                            for(String str: request.getParameterValues("cat")) {
                                                if(str.trim().contains(i))
                                                {
                                                    trovato = true;
                                                    break;
                                                }
                                            }

                                            if (trovato)
                                            {
                                                %>
                                                <li class="list-group-item"><input type="radio" name="<%=i%>" value="<%=i%>" onclick="filterRadio(this,'cat');" checked/> <%=i%></li>
                                                <%
                                            }
                                            else
                                            {
                                                %>
                                                <li class="list-group-item"><input type="radio" name="<%=i%>" value="<%=i%>" onclick="filterRadio(this,'cat');"/> <%=i%></li>
                                                <%
                                            }
                                        }
                                        else
                                        {
                                            %>
                                            <li class="list-group-item"><input type="radio" name="<%=i%>" value="<%=i%>" onclick="filterRadio(this,'cat');"/> <%=i%></li>
                                            <%
                                        }
                                    }
                                }
                            %>
                        </ul>
                        <h3 class="text-center">Venditori</h3>
                        <ul class="list-group">
                            <%
                                if (request.getAttribute("vendors") != null)
                                {
                                    ArrayList<String> vendors = (ArrayList<String>) request.getAttribute("vendors");

                                    for (String i : vendors) {
                                        if (request.getParameter("vendor") != null)
                                        {
                                            Boolean trovato = false;
                                            for(String str: request.getParameterValues("vendor")) {
                                                if(str.trim().contains(i))
                                                {
                                                    trovato = true;
                                                    break;
                                                }
                                            }

                                            if (trovato)
                                            {
                                                %>
                                                <li class="list-group-item"><input type="checkbox" name="<%=i%>" value="<%=i%>" onclick="filter(this,'vendor');"/> <%=i%></li>
                                                <%
                                            }
                                            else
                                            {
                                                %>
                                                <li class="list-group-item"><input type="checkbox" name="<%=i%>" value="<%=i%>" onclick="filter(this,'vendor');" checked/> <%=i%></li>
                                                <%
                                            }
                                        }
                                        else
                                        {
                                            %>
                                            <li class="list-group-item"><input type="checkbox" name="<%=i%>" value="<%=i%>" onclick="filter(this,'vendor');" checked/> <%=i%></li>
                                            <%
                                        }
                                    }
                                }
                            %>
                        </ul>
                        <h3 class="text-center">Area Geografica</h3>
                        <ul class="list-group">
                            <%
                                if (request.getAttribute("geozone") != null)
                                {
                                    ArrayList<String> geoZone = (ArrayList<String>) request.getAttribute("geozone");

                                    for (String i : geoZone) {
                                        if (request.getParameter("geo") != null)
                                        {
                                            Boolean trovato = false;
                                            for(String str: request.getParameterValues("geo")) {
                                                if(str.trim().contains(i))
                                                {
                                                    trovato = true;
                                                    break;
                                                }
                                            }

                                            if (trovato)
                                            {
                                                %>
                                                <li class="list-group-item"><input type="checkbox" name="<%=i%>" value="<%=i%>" onclick="filter(this,'geo');"/> <%=i%></li>
                                                <%
                                            }
                                            else
                                            {
                                                %>
                                                <li class="list-group-item"><input type="checkbox" name="<%=i%>" value="<%=i%>" onclick="filter(this,'geo');" checked/> <%=i%></li>
                                                <%
                                            }
                                        }
                                        else
                                        {
                                            %>
                                                <li class="list-group-item"><input type="checkbox" name="<%=i%>" value="<%=i%>" onclick="filter(this,'geo');" checked/> <%=i%></li>
                                            <%
                                        }
                                    }
                                }
                            %>
                        </ul>
                        <h3 class="text-center">Prezzo</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <h6 style="margin-left:10%;">Minimo</h6>
                                <h6 style="margin-left:10%;">Massimo</h6>
                            </div>
                            <div class="col-md-6" style="text-align:right;">
                                <input class="form-control no-border input_prezzo" type="text">
                                <input class="form-control no-border input_prezzo" type="text">
                            </div>
                        </div>
                        <div class="row" style="padding-bottom:15px">
                            <h3 class="text-center">Valutazione</h3>
                            <div class="col-md-12" style="margin-left:5%" >
                                <i class="fa fa-star rating_star" aria-hidden="true" id="stella_0" onmouseover="setStar(this)" onclick="setStarFilter()" style="cursor:pointer"></i>&nbsp;
                                <i class="fa fa-star-o rating_star" aria-hidden="true" id="stella_1" onmouseover="setStar(this)" onclick="setStarFilter()" style="cursor:pointer"></i>&nbsp;
                                <i class="fa fa-star-o rating_star" aria-hidden="true" id="stella_2" onmouseover="setStar(this)" onclick="setStarFilter()" style="cursor:pointer"></i>&nbsp;
                                <i class="fa fa-star-o rating_star" aria-hidden="true" id="stella_3" onmouseover="setStar(this)" onclick="setStarFilter()" style="cursor:pointer"></i>&nbsp;
                                <i class="fa fa-star-o rating_star" aria-hidden="true" id="stella_4" onmouseover="setStar(this)" onclick="setStarFilter()" style="cursor:pointer"></i>&nbsp;
                                &nbsp;o più
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-md-10">
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
            </div>

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
                            <div id="footer_vendors">

                            </div>
                            <div class="row" style="margin-top:10px" id="pagination_numbers_vendors">

                            </div>
                        </div>
                    </span>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript" src="js/search/search.js"></script>
    <script type="text/javascript" src="js/bootstrap-slider-master/bootstrap-slider-master/dist/bootstrap-slider.js"></script>
</html>
