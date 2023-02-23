package org.project.controller;

import org.project.service.CustomerService;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;
import javax.inject.Qualifier;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/")
public class HomeController {

	@Inject
	private CustomerService service;

	@RequestMapping(value="/home", method = RequestMethod.GET)
	public String homeGET() {
		return "home";
	}

	@RequestMapping(value="")
	public String main(){
		return "index";
	}

	//영빈이
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String loginGET() {
		return "login";
	}
	//근주
	@RequestMapping(value="/join", method = RequestMethod.GET)
	public String joinGET() {
		return "join";
	}
	//해란이(자주묻는질문)
	@RequestMapping(value="/faq", method = RequestMethod.GET)
	public String faqGET() {
		return "faq";
	}
	//창민이
	@RequestMapping(value="/qna", method = RequestMethod.GET)
	public String qnaGET() {
		return "qna";
	}
	//경현이
	@RequestMapping(value="/credit", method = RequestMethod.GET)
	public String creditGET() {
		return "credit";
	}
	//비오
	@RequestMapping(value="/creditresult", method = RequestMethod.GET)
	public String crGET() {
		return "creditresult";
	}
	//종훈
	@RequestMapping(value="/userModify", method = RequestMethod.GET)
	public String umGET(@RequestParam("userNo") int userno, Model model) {
		model.addAttribute(service.read(userno));
		System.out.println(service.read(userno).toString());
		return "userModify";
	}

	@RequestMapping(value="/creditForm", method = RequestMethod.POST)
	public String crfGET() {
		return "creditForm";
	}

	
}