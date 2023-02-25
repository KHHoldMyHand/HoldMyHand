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




	
}
