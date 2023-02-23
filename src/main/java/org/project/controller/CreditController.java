package org.project.controller;

import org.project.dao.CorporationMapper;
import org.project.vo.CorporationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
public class CreditController {

    @Autowired
    private CorporationMapper corporationMapper;

    @RequestMapping("/creditInfo")
    public String Corporation(CorporationVO vo, RedirectAttributes rttr, HttpSession session) {
        int result = corporationMapper.create(vo);
        if (result == 1) {
//            session.setAttribute("mvo", vo);
            return "redirect:/";
        } else {
//            rttr.addFlashAttribute("msgType", "입력 완료");
//            rttr.addFlashAttribute("msg", "다시 입력 바람");
            return "redirect:/";
        }
    }
}
