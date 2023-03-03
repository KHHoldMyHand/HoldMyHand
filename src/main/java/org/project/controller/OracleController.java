package org.project.controller;

import org.project.dao.CustomerDAO;
import org.project.service.CustomerService;
import org.project.vo.CustomerVO;
import org.project.vo.PagingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;
import java.util.List;

@Controller
@RequestMapping("/")
public class OracleController {

    @Inject
    private CustomerService service;
    @RequestMapping("/oracle")
    public String dept(Model model, PagingVO vo, @RequestParam(value = "nowPage", required = false) String nowPage,
                       @RequestParam(value = "cntPerPage", required = false) String cntPerPage) throws Exception {
        int total = service.countCustomer();
        if(nowPage==null&&cntPerPage==null){
            nowPage="1";
            cntPerPage="10";
        }else if(nowPage==null){
            nowPage="1";
        } else if (cntPerPage==null) {
            cntPerPage="10";
        }
        vo=new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), vo.getKeyword());
        model.addAttribute("paging",vo);
        model.addAttribute("list", service.selectCustomer(vo));
        return "oracle";
    }

    @RequestMapping("/oracle2")
    public String dept2(Model model, PagingVO vo, @RequestParam(value = "nowPage", required = false) String nowPage,
                       @RequestParam(value = "cntPerPage", required = false) String cntPerPage, @RequestParam(value = "keyword", required = false) String keyword) throws Exception {
        System.out.println("dept2실행됨");
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@22"+vo.getKeyword());
        int total = service.countCustomerByKeyword(keyword);
        if(nowPage==null&&cntPerPage==null){
            nowPage="1";
            cntPerPage="10";
        }else if(nowPage==null){
            nowPage="1";
        } else if (cntPerPage==null) {
            cntPerPage="10";
        }
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@개수출력"+total);
        vo=new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), vo.getKeyword());
        model.addAttribute("paging",vo);
        model.addAttribute("list", service.selectCustomerByKeyword(vo));
        return "oracle2";
    }
}

