package org.project.interceptor;

import org.project.service.CustomerService;
import org.project.vo.CustomerVO;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthInterceptor extends HandlerInterceptorAdapter {
    @Inject
    private CustomerService service;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object
            handler)
            throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("login") == null) {
            saveDest(request);
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
            if (loginCookie != null) {
                CustomerVO customerVO =
                        service.checkLoginBefore(loginCookie.getValue());
                if (customerVO != null) {
                    session.setAttribute("login", customerVO);
                    return true;
                }
            }
            response.sendRedirect("/user/login");
            return false;
        }
        return true;
    }
    private void saveDest(HttpServletRequest req) {
        String uri = req.getRequestURI();
        String query = req.getQueryString();
        if (query == null || query.equals("null")) {
            query = "";
        } else {
            query = "?" + query;
        }
        if (req.getMethod().equals("GET")) {
            req.getSession().setAttribute("dest", uri + query);
        }
    }
}
