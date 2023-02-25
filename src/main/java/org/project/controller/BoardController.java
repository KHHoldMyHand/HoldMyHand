package org.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class BoardController {

    @RequestMapping(value="/faq", method = RequestMethod.GET)
    public String faqGET() {
        return "board/faq";
    }

    @RequestMapping(value="/qna", method = RequestMethod.GET)
    public String qnaGET() {
        return "board/qna";
    }
}
