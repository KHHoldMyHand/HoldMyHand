package org.project.controller;

import org.project.dto.CustomerModifyDTO;
import org.project.service.CustomerService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;

@Controller
@RequestMapping("/")
public class CustomerController {

    @Inject
    private CustomerService service;
    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String loginGET() {
        return "user/login";
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
