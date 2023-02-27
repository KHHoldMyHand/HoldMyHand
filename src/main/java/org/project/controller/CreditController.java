package org.project.controller;

import org.project.dao.CorporationDAO;
import org.project.dto.CorporationBoardDTO;
import org.project.dto.CorporationDTO;
import org.project.dto.EvaluateSuccessDTO;
import org.project.service.CorporationService;
import org.project.service.CustomerService;
import org.project.vo.CorporationVO;
import org.project.vo.CustomerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/")
public class CreditController {

    @Autowired
    CorporationDAO corporationMapper;
    @Inject
    CustomerService customerService;
    @Inject
    CorporationService corporationService;

    //약관
    @RequestMapping(value="/credit", method = RequestMethod.GET)
    public String creditGET() {
        return "credit/credit";
    }

    @RequestMapping(value="/creditwait", method = RequestMethod.GET)
    public String creditWaitGET() {
        return "credit/creditWait";
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

    @RequestMapping(value="/creditmanage", method = RequestMethod.GET)
    public String crbGET(Model model) {
        List<CorporationBoardDTO> list = corporationMapper.listCorporation();
        model.addAttribute("list", list);


        return "credit/creditManage";
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

    @RequestMapping(value = "/evaluationPage",method = RequestMethod.GET)
    public String evalGET(@RequestParam("userNo") int userno, Model model){
        model.addAttribute("userNo",userno);
        return "credit/evaluationPage";
    }

    @RequestMapping(value = "/evaluateSuccess", method = RequestMethod.POST)
    public String evalPOST(EvaluateSuccessDTO dto) throws Exception{
        Integer userNo = dto.getUserNo();
        System.out.println(dto.toString());
        //여기에는 신용평가완료 되었을 시에 작용할 것들.
        //dto를 매개변수로 받아내고 서비스 2개 연결.
        //서비스에서는 user의 정보변경, corporation의 정보변경.(userNo 알고있으니 가능)
        corporationService.modCorpScore(dto);
        customerService.modUserStatus(userNo);
        return "redirect:/";
    }

}
