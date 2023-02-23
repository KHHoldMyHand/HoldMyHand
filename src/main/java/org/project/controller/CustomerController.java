package org.project.controller;

import org.project.dto.CustomerModifyDTO;
import org.project.service.CustomerService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;

@Controller
@RequestMapping("/mypage")
public class CustomerController {

    @Inject
    private CustomerService service;

    @RequestMapping(value ="userModify",method = RequestMethod.GET)
    public void modGET(@ModelAttribute("dto") CustomerModifyDTO dto){

    }

    //dto받아올때 @RequestBody로 받으면 안됨.. Json이라 그런듯?
    @RequestMapping(value="/userModify", method = RequestMethod.POST)
    public String modPOST(CustomerModifyDTO dto) {
        System.out.println("RequestBody로 받아온 파라미터들1 : "+dto.toString());
//        service.modify(dto);
        return "redirect:/";
//        ResponseEntity<String> entity=null;
//        try{
//            System.out.println("RequestBody로 받아온 파라미터들2 : "+dto.toString());
//            entity=new ResponseEntity<>("SUCCESS", HttpStatus.OK);
//        }catch (Exception e){
//            e.printStackTrace();
//            entity=new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
//        }
//        return entity;
    }

}
