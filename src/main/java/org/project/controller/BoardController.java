package org.project.controller;

import org.project.dao.BoardDAO;
import org.project.dto.BoardWriteDTO;
import org.project.service.BoardService;
import org.project.vo.BoardVO;
import org.project.vo.PagingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

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
//    @RequestMapping(value="/qna", method = RequestMethod.GET)
//    public String list(Model model) {
//        List<BoardVO> list = boardDAO.qnaList();
//        model.addAttribute("list", list);
//        return "board/qna";
//    }

    @RequestMapping(value="/qnaWriter", method = RequestMethod.GET)
    public String writeGET(){ return "board/qnaWriter";}

    //글쓰기 post
    @RequestMapping(value = "/qnaWrite", method = RequestMethod.POST)
    public String write(BoardWriteDTO dto, HttpSession session) throws Exception{

        boardService.write(dto);
        return "redirect:/qna";
    }

    @RequestMapping(value ="/qna", method = RequestMethod.GET)
    public String boardList(PagingVO vo, Model model
            , @RequestParam(value="nowPage", required=false)String nowPage
            , @RequestParam(value="cntPerPage", required=false)String cntPerPage) {

        int total = boardService.countBoard();
        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "5";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "5";
        }
        vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        model.addAttribute("paging", vo);
        model.addAttribute("viewAll", boardService.selectBoard(vo));
        return "board/qna";
        }

    @RequestMapping(value = "/qnaInfo", method = RequestMethod.GET)
    public String detail(Model model, @RequestParam int QANo){
        BoardVO data = boardService.detail(QANo);
        boardService.boardCnt(QANo);
        model.addAttribute("data", data);

        return "board/qnaInfo";
    }


}
