package daos.impl;

import daos.ProductDao;
import db.DBManager;
import main.Product;
import main.ProductGroup;
import main.Shop;
import utils.Utils;

import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import static utils.Mechanist.checkSMP;
import static utils.Mechanist.getMMP;

import info.debatty.java.stringsimilarity.JaroWinkler;

public class ProductDaoImpl implements ProductDao {
    private Connection con;

    public ProductDaoImpl() {
        this.con = DBManager.getCon();
    }

    @Override
    public Product getProduct(int productID, int shopID) {
        try {
            PreparedStatement stm = con.prepareStatement("SELECT *, s.Name AS ShopName \n" +
                    "FROM product AS p\n" +
                    "INNER JOIN productphoto AS pp USING(ProductID)\n" +
                    "INNER JOIN shopproduct AS sp USING (ProductID)\n" +
                    "INNER JOIN shop AS s USING (ShopID)\n" +
                    "WHERE p.ProductID = ? AND sp.ShopID = ?;");
            stm.setInt(1,productID);
            stm.setInt(2,shopID);
            ResultSet rs = stm.executeQuery();
            return extractProductFromResultSet(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<Product> allProducts() {
        try {
            PreparedStatement stm = con.prepareStatement("SELECT *\n" +
                    "FROM product AS p\n" +
                    "  INNER JOIN productphoto AS pp USING(ProductID)\n" +
                    "  INNER JOIN shopproduct AS sp USING (ProductID)\n" +
                    "GROUP BY ProductID;");
            ResultSet rs = stm.executeQuery();
            return extractAllProductsFromResultSet(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    private ArrayList<Product> extractAllProductsFromResultSet(ResultSet rs) throws SQLException {
        ArrayList<Product> products = new ArrayList<>();
        Product prod;
        while (true){
            prod = extractProductFromResultSet(rs);
            if (prod == null)
                break;
            products.add(prod);
        }
        return products;
    }
    private Product extractProductFromResultSet(ResultSet rs) throws SQLException {
        if(!rs.next()){
            return null;
        }
        Product prod = new Product();

        //invece che tutti questi try catch non si potrebbe studiare la casistica di sottogruppi possibili e farne solo 2-3?

        try{
            prod.setProductID(rs.getInt("ProductID"));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setProductName(rs.getString("Name"));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setShopID(rs.getInt("ShopID"));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setShopName(rs.getString("ShopName"));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setDescription(rs.getString("Description"));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setImgBase64(Utils.getStringfromBlob(rs.getBlob("Image")));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setPrice(rs.getFloat("Price"));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setQuantity(rs.getInt("Quantity"));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setDiscount(rs.getFloat("Discount"));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setActualPrice(prod.getPrice()*(1-prod.getDiscount()));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setCategoryName(rs.getString("CategoryName"));
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            prod.setRating(rs.getInt("Rating"));
        }catch (Exception e){
            e.printStackTrace();
        }

        return prod;
    }

    private final static String sortKeyword             = "sort"      ;
    private final static String minPriceKeyword         = "minPrice"  ;
    private final static String maxPriceKeyword         = "maxPrice"  ;
    private final static String minRatingKeyword        = "minRat"    ;
    private final static String categoryKeyword         = "cat"       ;
    private final static String vendorKeyword           = "vendor"    ;
    private final static String geolocalizationKeyword  = "geo"       ;

    @Override
    public Map<String, ProductGroup> getProducts(Map params) throws SQLException {
        Map<String,ProductGroup> products = new HashMap<>();

        //Search query parameter
        String searchQuery;
        if((searchQuery = checkSMP(params.get("q"))) == null){
            return null;
        }

        //Sorting parameter
        String sort = checkSMP(params.get(sortKeyword)),
                orderBySql = "ORDER BY ActualPrice ASC, P.Rating DESC, S.Rating DESC, SP.Quantity DESC";
        if(sort != null) {
            switch (sort) {
                case "price-asc":
                    orderBySql = " ORDER BY ActualPrice ASC, P.Rating DESC, S.Rating DESC, SP.Quantity DESC";
                    break;
                case "price-desc":
                    orderBySql = " ORDER BY ActualPrice DESC, P.Rating DESC, S.Rating DESC, SP.Quantity DESC";
                    break;
                case "rating-desc":
                    orderBySql = " ORDER BY P.Rating DESC, ActualPrice ASC, S.Rating DESC, SP.Quantity DESC";
                    break;
                default:
                    break;
            }
        }

        //minPrice parameter
        String minPrice,maxPrice;
        if((minPrice = checkSMP(params.get(minPriceKeyword))) != null){
            try {
                int value = Integer.parseInt(minPrice);
                if(value >= 0){
                    minPrice = " ActualPrice >= " + minPrice + " ";
                }
                else minPrice = "";
            } catch (NumberFormatException e) {
                e.printStackTrace();
                minPrice = "";
            }
        } else minPrice = "";
        //maxPrice parameter
        if((maxPrice = checkSMP(params.get(maxPriceKeyword))) != null){
            try {
                int value = Integer.parseInt(maxPrice);
                if(value > 0){
                    maxPrice = " ActualPrice <= " + maxPrice + " ";
                }
                else maxPrice = "";
            } catch (NumberFormatException e) {
                e.printStackTrace();
                maxPrice = "";
            }
        } else maxPrice = "";
        //price range;
        String priceRange = " HAVING ";
        if(minPrice.equals("")){
            if(maxPrice.equals("")){
                priceRange = "";
            }
            else{
                priceRange += maxPrice;
            }
        }
        else{
            if(maxPrice.equals("")){
                priceRange += minPrice;
            }
            else{
                priceRange += minPrice + " AND " + maxPrice;
            }
        }

        //minRating parameter
        String minRating;
        if((minRating = checkSMP(params.get(minRatingKeyword))) != null){
            try {
                int value = Integer.parseInt(minRating);
                if(!(value >= 1 && value <= 5)){
                    minRating = "";
                }
                else {
                    minRating = " AND P.Rating >= " + minRating + " ";
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                minRating = "";
            }
        } else minRating = "";

        //Category parameter
        String[] cat;
        StringBuilder category = new StringBuilder();
        if((cat = getMMP(params.get(categoryKeyword))) != null){
            for(int i = 0; i<cat.length;i++){
                System.out.println(cat[i]);
                if(i == 0)
                    category.append(" AND (P.CategoryName = '")
                            .append(cat[i])
                            .append("'")
                            .append((i == cat.length - 1) ? ") " : "");
                else
                    category.append(" OR P.CategoryName = '")
                            .append(cat[i])
                            .append("'")
                            .append((i == cat.length - 1) ? ") " : "");
            }
        }

        //Vendor parameter
        String[] ven;
        StringBuilder vendor = new StringBuilder();
        if((ven = getMMP(params.get(vendorKeyword))) != null){
            for (String aVen : ven) {
                vendor.append(" AND (S.Name <> '").append(aVen).append("')");
            }
        }

        //Regione amministrativa
        String[] geo;
        StringBuilder region = new StringBuilder();
        if((geo = getMMP(params.get(geolocalizationKeyword))) != null){
            region.append(" AND S.ShopID = SI.ShopID ");
            for (String aGeo : geo)
                region.append(" AND (SI.State <> '").append(aGeo).append("')");
        }

        //Final query PreparedStatement
        PreparedStatement stm = con.prepareStatement(
                "SELECT DISTINCT P.ProductID, P.Name as ProductName, P.CategoryName, P.Rating, " +
                        "SP.ShopID, SP.Price, SP.Discount, SP.Quantity, S.Name as ShopName, " +
                        " round(SP.Price * (1-SP.Discount),2) as ActualPrice " +
                        "FROM Product P, ShopProduct SP, Shop S, ShopInfo SI " +
                        "WHERE P.ProductID = SP.ProductID AND SP.ShopID = S.ShopID AND SP.Quantity > 0 " +
                        region.toString() + category.toString() + vendor.toString() + minRating +
                        priceRange +            //HAVING
                        orderBySql              //ORDER BY
        );
        System.out.println("MAIN PRODUCT QUERY: " + stm.toString().substring(45));

        //Final query execute
        try {
            try (ResultSet rs = stm.executeQuery()){
                while(rs.next()) {
                    //JaroWinkler implementation
                    JaroWinkler jw = new JaroWinkler();
                    double distance = jw.similarity(rs.getString("ProductName").toLowerCase(),searchQuery.toLowerCase());
                    if (distance >= 0.7)
                    {
                        //Product crafting
                        Product p = new Product();
                        p.setProductID(rs.getInt("ProductID"));
                        p.setShopID(rs.getInt("ShopID"));
                        p.setProductName(rs.getString("ProductName"));
                        p.setCategoryName(rs.getString("CategoryName"));
                        p.setRating(rs.getFloat("Rating"));
                        p.setPrice(rs.getFloat("Price"));
                        p.setDiscount(rs.getFloat("Discount"));
                        p.setActualPrice(rs.getFloat("ActualPrice"));
                        p.setQuantity(rs.getInt("Quantity"));
                        p.setShopName(rs.getString("ShopName"));

                        //ProductGroup crafting
                        products.computeIfAbsent(p.getProductName(), k -> new ProductGroup());
                        products.get(p.getProductName()).getList().add(p);
                    }
                }
            }
        } finally {
            stm.close();
        }

        //ProductGroup extra fetching
        for (Object o : products.entrySet()) {
            Map.Entry pair = (Map.Entry) o;
            ProductGroup gp = (ProductGroup) pair.getValue();
            System.out.println("\nPRODUCT: " + pair.getKey().toString());

            //Review count info
            stm = con.prepareStatement(
            "SELECT COUNT(*) AS conto, product.name " +
                    "FROM productreview, product " +
                    "WHERE product.ProductID = productreview.ProductID AND product.name = ?"
            );
            stm.setString(1, pair.getKey().toString());
            System.out.println("REVIEW COUNT: "+stm.toString().substring(45));
            try {
                try (ResultSet rs = stm.executeQuery()) {
                    rs.next();
                    gp.setReviewCount(rs.getInt("conto"));
                }
            } finally {
                stm.close();
            }

            //Decode image from first product
            Product p = gp.getList().get(0);
            String imgDataBase64;
            stm = con.prepareStatement("select * from productphoto where ProductID = ?");
            stm.setInt(1,p.getProductID());
            System.out.println("DECODE PRODUCT IMAGE: "+stm.toString().substring(45));
            try (ResultSet rs = stm.executeQuery()){
                if(rs.next()) {
                    gp.setImageData(Utils.getStringfromBlob(rs.getBlob("Image")));
                }
            } catch(Exception e){
                e.printStackTrace();
            }
            finally {
                stm.close();
            }

            //Fetch shop list related to this ProductGroup
            stm = con.prepareStatement("SELECT shop.*, shopproduct.Price, shopproduct.Discount, " +
                    "shopproduct.Quantity, round(shopproduct.Price * (1-shopproduct.Discount),2) as ActualPrice " +
                    "FROM product, shopproduct, shop " +
                    "WHERE product.name = ? AND shopproduct.Quantity > 0 " +
                    "AND product.ProductID = shopproduct.ProductID AND shopproduct.ShopID = shop.ShopID " +
                    "ORDER BY ActualPrice ASC, Rating DESC"
            );
            stm.setString(1, pair.getKey().toString());
            System.out.println("FETCH SHOP LIST: " + stm.toString().substring(45));
            try (ResultSet rs = stm.executeQuery()){
                while(rs.next()) {
                    //Shop crafting
                    Shop s = new Shop();
                    s.setShopID(rs.getInt("ShopID"));
                    s.setName(rs.getString("Name"));
                    s.setDescription(rs.getString("Description"));
                    s.setWebsite(rs.getString("Website"));
                    s.setRating(rs.getFloat("Rating"));
                    s.setSampleActualPrice(rs.getFloat("ActualPrice"));

                    //Actual insertion
                    gp.getVendors().add(s);
                }
            } catch(Exception e){
                e.printStackTrace();
            }
            finally {
                stm.close();
            }

            //Fetch geozone list related to this ProductGroup
            stm = con.prepareStatement(
                    "SELECT DISTINCT SI.State " +
                            "FROM Product P, ShopProduct SP, Shop S, ShopInfo SI " +
                            "WHERE P.Name = ? AND P.ProductID = SP.ProductID AND SP.ShopID = S.ShopID AND SP.Quantity > 0 "
            );
            stm.setString(1, pair.getKey().toString());

            //Execution
            try (ResultSet rs = stm.executeQuery()){
                while(rs.next()) {
                    gp.getGeo().add(rs.getString("State"));
                }
            } catch(Exception e){
                e.printStackTrace();
            }
            finally {
                stm.close();
            }
        }

        return products;
    }
}
