package org.project.controller;

import org.project.dao.CustomerMapper;
import org.project.vo.CustomerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/oracle/")
public class OracleController {

    @Autowired
    private CustomerMapper customerMapper;

    @RequestMapping("/dept")
    public String dept(Model model) {
        List<CustomerVO> list = customerMapper.listCustomer();
        model.addAttribute("list", list);
        return "oracle/dept";
    }
}

