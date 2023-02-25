package org.project.interceptor;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.management.modelmbean.ModelMBean;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor extends HandlerInterceptorAdapter {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        if(session.getAttribute("login")!=null)session.removeAttribute("login");
        System.out.println("*********************로그인인터셉터 pre실행");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("*********************로그인인터셉터 post실행");
        HttpSession session = request.getSession();
        ModelMap modelMap = modelAndView.getModelMap();
        Object customerVO = modelMap.get("customerVO");
        //System.out.println("로그인 인터셉터post의 VO객체실행"+customerVO.toString());
        if(customerVO!=null){
            System.out.println("로그인 성공!");
            session.setAttribute("login",customerVO);
            if(request.getParameter("useCookie")!=null){
                System.out.println("자동로그인 눌렀다.");
                Cookie loginCookie = new Cookie("loginCookie",session.getId());
                loginCookie.setPath("/");
                loginCookie.setMaxAge(60*60*24*7);
                response.addCookie(loginCookie);
            }
            Object dest = session.getAttribute("dest");
            response.sendRedirect(dest!=null?(String)dest:"/");
        }else response.sendRedirect("/user/login");
    }
}
