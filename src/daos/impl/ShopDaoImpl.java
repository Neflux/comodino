package daos.impl;

import daos.ShopDao;
import db.DBManager;
import main.Shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ShopDaoImpl implements ShopDao {
    private Connection con;

    public ShopDaoImpl(){}

    public ShopDaoImpl(Connection con) {
        this.con = DBManager.getCon();
    }

    @Override
    public Shop getShop(int shopID) {
        try {
            PreparedStatement stm = con.prepareStatement("SELECT *\n" +
                    "FROM shop\n" +
                    "WHERE shop.ShopID = ?;");
            stm.setInt(1,shopID);
            ResultSet rs = stm.executeQuery();
            return extractShopFromResultSet(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private Shop extractShopFromResultSet(ResultSet rs) throws SQLException {
        if(!rs.next()){
            return null;
        }
        Shop shop = new Shop();
        shop.setShopID(rs.getInt("ShopID"));
        shop.setName(rs.getString("Name"));
        shop.setDescription(rs.getString("Description"));
        shop.setWebsite(rs.getString("Website"));
        shop.setRating(rs.getInt("Rating"));
        return shop;
    }
}
