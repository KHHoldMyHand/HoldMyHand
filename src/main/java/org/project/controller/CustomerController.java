package org.project.controller;

import lombok.extern.java.Log;
import org.project.dto.CustomerModifyDTO;
import org.project.dto.JoinDTO;
import org.project.dto.LoginDTO;
import org.project.service.CustomerService;
import org.project.vo.CustomerVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import javax.inject.Inject;
import javax.servlet.http.*;
import java.net.http.HttpResponse;
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
        System.out.println("쿠키 사용 중이니? = "+dto.isUseCookie());
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

    @RequestMapping(value="/findUserId", method = RequestMethod.POST)
    public String findUserId(HttpServletResponse response, @RequestParam("userEmail") String userEmail, Model model) throws Exception{
        model.addAttribute("userid",service.findUserId(response,userEmail));
        return "user/findUserIdResult";
    }

    @RequestMapping(value="/findUserId", method = RequestMethod.GET)
    public String findUserIdGET() throws Exception{
        return "user/findUserId";
    }

    @RequestMapping(value = "/findUserPwd", method = RequestMethod.POST)
    public void findUserPwdPOST(HttpServletResponse response,@ModelAttribute CustomerVO vo) throws Exception{
        service.findUserPwd(response, vo);
    }

    @RequestMapping(value="/findUserPwd", method = RequestMethod.GET)
    public void findUserPwdGET() throws Exception{
    }

    @RequestMapping(value="/join", method = RequestMethod.GET)
    public String joinGET() {
        return "user/join";
    }


    @RequestMapping(value="/userModify", method = RequestMethod.GET)
    public String umGET(HttpSession session) {
        CustomerVO vo = (CustomerVO)session.getAttribute("login");
        System.out.println(service.read(vo.getUserNo()).toString());
        return "user/userModify";
    }
    //dto받아올때 @RequestBody로 받으면 안됨.. Json이라 그런듯?
    @RequestMapping(value="/userModify", method = RequestMethod.POST)
    public String modCustomerPOST(CustomerModifyDTO dto,HttpSession session) {
        System.out.println("받아온 파라미터들1 : "+dto.toString());
        //아래와 같은 방법은 인터셉트 방식
        try{
            service.modify(dto);
            CustomerVO vo = (CustomerVO)session.getAttribute("login");
            vo.setUserPwd(dto.getUserPwd());
            vo.setUserEmail(dto.getUserEmail());
            vo.setPhoneNo(dto.getPhoneNo());
            session.setAttribute("login",vo);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/user/userModify";
    }
    @RequestMapping(value ="/userDelete",method = RequestMethod.GET)
    public String delCustomerGET(HttpSession session, HttpServletRequest request, HttpServletResponse response){
        try {
            CustomerVO vo = (CustomerVO)session.getAttribute("login");
            System.out.println("받아온 유저넘버"+vo.getUserNo());
            session.removeAttribute("login");
            session.invalidate();
            Cookie loginCookie = WebUtils.getCookie(request,"loginCookie");
            if(loginCookie!=null) {
                loginCookie.setPath("/");
                loginCookie.setMaxAge(0);
                response.addCookie(loginCookie);
            }
            //당연히 에러남. (미해결)
            //Customer의 userNo를 외래키로 사용하는 모든 테이블의 데이터를 먼저 삭제해야 함
            //모든 테이블에 접근하는 service,dao,mapper가 구현되고 난 후에 이 부분을 구현해야 함.
            service.remove(vo.getUserNo());
        }catch (Exception e){
            e.printStackTrace();
        }

        //여기서 세션 날려도 됨.
        return "redirect:/";
    }


    //신용으로 가라고 했음!!!!!참고~~~~^^ㅜ 그냥 그렇게 해본거임
    @RequestMapping(value="/join",method = RequestMethod.POST)
    public String joinPOST(JoinDTO dto) throws Exception {

        System.out.println(("로고 찍히나 테스트,,,ㅋ 포스트 방식으로 넘길꺼임"+dto.toString()));

        service.regist(dto);

        return "redirect:/user/login";
    }
    //아이디 중복확인때 쓸것임----------------------------------------------
    @Autowired
    private CustomerService customerService;

    @ResponseBody
    @RequestMapping(value = "/joinIdCheck", method = RequestMethod.POST)
    public int registerPOST(String userID) throws Exception {
        System.out.println("regist 실행");
        int result = customerService.idCheck(userID);
        System.out.println("result=="+result);
        return result;
    }
}
