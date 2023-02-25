package org.project.controller;

import org.project.dao.CorporationDAO;
import org.project.dto.CorporationDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class CreditController {

    @Autowired
    CorporationDAO corporationMapper;

    //약관
    @RequestMapping(value="/credit", method = RequestMethod.GET)
    public String creditGET() {
        return "credit/credit";
    }
    @RequestMapping(value="/creditresult", method = RequestMethod.GET)
    public String crGET() {
        return "credit/creditresult";
    }

    @RequestMapping(value="/risksolution", method = RequestMethod.GET)
    public String rsGET(){return "credit/risksolution";};
    // 약관 동의 후 신용정보입력 화면 출력
    @RequestMapping(value="/creditForm", method = RequestMethod.POST)
    public String crfGET() {
        return "credit/creditForm";
    }
    
    // 신용정보입력 데이터 저장 후 메인페이지 출력(구현중), 실패시 입력 화면 값 그대로 유지하기(미구현)
    @RequestMapping(value = "/creditInfo", method = RequestMethod.POST)
    public String Corporation(CorporationDTO dto, RedirectAttributes rttr, HttpSession session) {
        int result = corporationMapper.create(dto);
        if(result==1){
            rttr.addFlashAttribute("msgType", "입력완료");
            rttr.addFlashAttribute("msg", "심사 진행을 시작합니다.");
            session.setAttribute("dto",dto);
            System.out.println("성공" + dto.toString());
            return "redirect:/";
        } else {
            return "redirect:/creditForm";
        }
    }

}
