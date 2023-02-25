package org.project.controller;

import lombok.extern.java.Log;
import org.project.dto.CustomerModifyDTO;
import org.project.dto.LoginDTO;
import org.project.service.CustomerService;
import org.project.vo.CustomerVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;

import javax.inject.Inject;
import javax.servlet.http.*;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class CustomerController {

    @Inject
    private CustomerService service;
    @RequestMapping(value="/login", method = RequestMethod.GET)
    public void loginGET(@ModelAttribute("dto")LoginDTO dto) {
    }
    @RequestMapping(value = "/loginPost",method = RequestMethod.POST)
    public void loginPost(LoginDTO dto, HttpSession session, Model model) throws Exception{
        CustomerVO vo = service.login(dto);
        if(vo==null)return;
        model.addAttribute("customerVO",vo);
        if(dto.isUseCookie()){
            int amount = 60*60*24*7;
            Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
            System.out.println("loginPost에서 service의 keepLogin수행.");
            Map<String,Object> paramMap = new HashMap<>();
            paramMap.put("userID",vo.getUserID());
            paramMap.put("sessionId",session.getId());
            paramMap.put("next",sessionLimit);
            service.keepLogin(paramMap);
        }
    }
    @RequestMapping(value="/logout",method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
        Object obj = session.getAttribute("login");
        if(obj!=null){
            CustomerVO vo = (CustomerVO)obj;
            session.removeAttribute("login");
            session.invalidate();
            Cookie loginCookie = WebUtils.getCookie(request,"loginCookie");
            if(loginCookie!=null){
                loginCookie.setPath("/");
                loginCookie.setMaxAge(0);
                response.addCookie(loginCookie);
                Map<String,Object> paramMap = new HashMap<>();
                paramMap.put("userID",vo.getUserID());
                paramMap.put("sessionId",session.getId());
                paramMap.put("next",new Date());
                service.keepLogin(paramMap);
            }
        }
        return "user/logout";
    }

    @RequestMapping(value="/join", method = RequestMethod.GET)
    public String joinGET() {
        return "user/join";
    }


    @RequestMapping(value="/userModify", method = RequestMethod.GET)
    public String umGET(@RequestParam("userNo") int userno, Model model) {
        model.addAttribute(service.read(userno));
        System.out.println(service.read(userno).toString());
        return "user/userModify";
    }
    //dto받아올때 @RequestBody로 받으면 안됨.. Json이라 그런듯?
    @RequestMapping(value="/userModify", method = RequestMethod.POST)
    public String modCustomerPOST(CustomerModifyDTO dto) {
        System.out.println("받아온 파라미터들1 : "+dto.toString());
        //아래와 같은 방법은 인터셉트 방식
        try{
            service.modify(dto);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/";
    }
    @RequestMapping(value ="userDelete",method = RequestMethod.GET)
    public String delCustomerGET(Integer userNo){
        try {
            System.out.println("받아온 유저넘버"+userNo);
            service.remove(userNo);
        }catch (Exception e){
            e.printStackTrace();
        }

        //여기서 세션 날려도 됨.
        return "redirect:/";
    }

}
