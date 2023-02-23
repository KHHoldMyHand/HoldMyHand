package org.project.controller;

import org.project.dao.CustomerDAO;
import org.project.vo.CustomerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/")
public class OracleController {

    @Autowired
    private CustomerDAO customerDAO;

    @RequestMapping("/oracle")
    public String dept(Model model) {
        List<CustomerVO> list = customerDAO.listCustomer();
        model.addAttribute("list", list);
        return "oracle";
    }
}

