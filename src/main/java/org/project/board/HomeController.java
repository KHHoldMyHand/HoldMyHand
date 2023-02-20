package org.project.board;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/")
public class HomeController {
	
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
	public String umGET() {
		return "userModify";
	}


	
}
