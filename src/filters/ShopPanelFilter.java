package filters;

import daos.ShopDao;
import daos.impl.ShopDaoImpl;
import main.ProductGroup;
import main.Shop;
import main.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;

public class ShopPanelFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;
        HttpSession session  = req.getSession(false);

        User u = (User) session.getAttribute("user");
        if (u.hasShop()) {
            ShopDao shopDao = new ShopDaoImpl();
            Shop shop = shopDao.getShop(u.getShopID());
            HashMap<String, ProductGroup> shopProducts = shopDao.getShopProducts(u.getShopID()+"");

            req.setAttribute("shop", shop);
            req.setAttribute("shopproducts", shopProducts);

            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            System.out.println("[INFO] L'utente non è proprietario di uno shop");
            res.sendRedirect("/profile.jsp?error=L'utente non possiede negozi");
        }
    }

    @Override
    public void destroy() {

    }
}

