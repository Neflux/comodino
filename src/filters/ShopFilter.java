package filters;

import daos.impl.ProductDaoImpl;
import daos.impl.ShopDaoImpl;
import main.Product;
import main.Shop;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ShopFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;

        if(req.getParameter("id") == null){
            System.out.println("URL " + req.getRequestURI());
            res.sendRedirect("/index.jsp");
            return;
        }

        Shop shop = new ShopDaoImpl().getShop(Integer.parseInt(req.getParameter("id")));

        if (shop == null){
            System.out.println("URL " + req.getRequestURI());
            res.sendRedirect("/index.jsp");
        }
        else {
            req.setAttribute("shop",shop);
            filterChain.doFilter(servletRequest,servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}