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
            cntPerPage="5";
        }else if(nowPage==null){
            nowPage="1";
        } else if (cntPerPage==null) {
            cntPerPage="5";
        }
        vo=new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        model.addAttribute("paging",vo);
        model.addAttribute("list", service.selectCustomer(vo));
        return "oracle";
    }
}

