package org.project.controller;

import org.jetbrains.annotations.NotNull;
import org.project.dao.BoardDAO;
import org.project.dto.BoardWriteDTO;
import org.project.searchandpaging.Criteria;
import org.project.searchandpaging.PageMaker;
import org.project.service.BoardService;
import org.project.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class BoardController {

    @Autowired
    private BoardDAO boardDAO;
    @Autowired
    private BoardService boardService;

    @RequestMapping(value="/faq", method = RequestMethod.GET)
    public String faqGET() {
        return "board/faq";
    }


    //게시판 리스트
    @RequestMapping(value="/qna", method = RequestMethod.GET)
    public String list(Model model) {
        List<BoardVO> list = boardDAO.qnaList();
        model.addAttribute("list", list);
        return "board/qna";
    }

    @RequestMapping(value="/qnaWriter", method = RequestMethod.GET)
    public String writeGET(){ return "board/qnaWriter";}

    //글쓰기 post
    @RequestMapping(value = "/qnaWrite", method = RequestMethod.POST)
    public String write(BoardWriteDTO dto, HttpSession session) throws Exception{

        boardService.write(dto);
        return "/board/qna";
    }
}
