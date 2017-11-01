package filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/restricted/*")
public class AuthenticationFilter implements Filter{
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;
        HttpSession session  = req.getSession(false);

        if (session == null){
            System.out.println("[INFO] Auth Filter: Nessuna sessione esistente");
            res.sendRedirect("/");
        }
        else if( session.getAttribute("user") == null) {
            System.out.println("[INFO] Auth Filter: L'utente non è loggato");
            res.sendRedirect("/");
        }
        else
            filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {

    }
}