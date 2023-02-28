package org.project.controller;

import org.apache.commons.io.FilenameUtils;
import org.project.dao.CorporationDAO;
import org.project.dao.CustomerDAO;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/")
public class CreditController {

    @Autowired
    CorporationDAO corporationDAO;
    @Autowired
    CustomerDAO CustomerDAO;
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

    /* 평가 진행 목록 */
    @RequestMapping(value="/creditManage", method = RequestMethod.GET)
    public String crbGET(Model model) {
        List<CorporationBoardDTO> list = corporationDAO.listCorporation();
        model.addAttribute("list", list);
        return "credit/creditManage";
    }

    /* 약관 동의 후 신용정보입력 화면 출력 */
    @RequestMapping(value="/creditForm", method = RequestMethod.POST)
    public String crfGET() {
        return "credit/creditForm";
    }

    /* 신용정보 등록과 동시에 CustomerVO : creditStatus,files : 0->1 변경 */
    @RequestMapping(value = "/submitCreditInfo", method = RequestMethod.POST)
    public String submitCreditInfo(CorporationDTO dto, HttpSession session) throws Exception {
        // 파일 업로드 처리
        String fileName = null;
        MultipartFile uploadFile = dto.getUploadFile();
        if (!uploadFile.isEmpty()) {
            String originalFileName = uploadFile.getOriginalFilename(); //원본파일 이름 구하기
            String ext = FilenameUtils.getExtension(originalFileName);  //확장자 구하기
//            UUID uuid = UUID.randomUUID();                              //UUID(중복방지) 구하기
            fileName = dto.getCompanyName() + originalFileName.replaceAll(" ", "_") //저장파일 이름 설정
                    .substring(0, originalFileName.length() - 4) + "." + ext;
            uploadFile.transferTo(new File("C:\\dev\\Project\\src\\main\\resources\\upload\\" + fileName)); //저장경로
        }
        dto.setFileName(fileName);
        corporationService.submitCreditInfo(dto);
        //세션 user의 vo객체 받아와서 업데이트
        CustomerVO vo = (CustomerVO) session.getAttribute("login");
        vo.setCreditStatus(1);
        session.setAttribute("login",vo);
        return "redirect:/";
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
