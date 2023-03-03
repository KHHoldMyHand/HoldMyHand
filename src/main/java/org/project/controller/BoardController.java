package org.project.controller;

import org.project.dao.BoardDAO;
import org.project.dto.BoardWriteDTO;
import org.project.service.BoardService;
import org.project.service.ReplyService;
import org.project.vo.BoardVO;
import org.project.vo.PagingVO;
import org.project.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/")
public class BoardController {

    @Inject
    private BoardDAO boardDAO;
    @Inject
    private BoardService boardService;
    @Inject
    ReplyService replyService;

    @RequestMapping(value="/faq", method = RequestMethod.GET)
    public String faqGET() {
        return "board/faq";
    }


    //�Խ��� ����Ʈ
//    @RequestMapping(value="/qna", method = RequestMethod.GET)
//    public String list(Model model) {
//        List<BoardVO> list = boardDAO.qnaList();
//        model.addAttribute("list", list);
//        return "board/qna";
//    }

    @RequestMapping(value="/qnaWriter", method = RequestMethod.GET)
    public String writeGET(){ return "board/qnaWriter";}

    //�۾��� post
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
            cntPerPage = "10";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "10";
        }
        vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        model.addAttribute("paging", vo);
        model.addAttribute("viewAll", boardService.selectBoard(vo));
        return "board/qna";
        }

    @RequestMapping(value ="/qnaResult", method = RequestMethod.GET)
    public String boardResultList(PagingVO vo, Model model
            , @RequestParam(value="nowPage", required=false)String nowPage
            , @RequestParam(value="cntPerPage", required=false)String cntPerPage
    , @RequestParam(value = "keyword", required = false)String keyword
    , @RequestParam(value = "searchType", required = false) String searchType) throws Exception {

        int total = boardService.countSearchBoard(keyword,searchType);
        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "10";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "10";
        }
        vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),vo.getKeyword(),vo.getSearchType());
        model.addAttribute("paging", vo);
        model.addAttribute("viewAll", boardService.selectSearchBoard(vo));
        return "board/qnaResult";
    }

//    @RequestMapping(value = "/qnaInfo", method = RequestMethod.GET)
//    public String detail(Model model, @RequestParam int QANo){
//        BoardVO data = boardService.detail(QANo);
//        boardService.boardCnt(QANo);
//        model.addAttribute("data", data);
//
//        return "board/qnaInfo";
//    }

    // 게시글 읽기
    @RequestMapping(value = "/qnaInfo", method = RequestMethod.GET)
    public String read(Model model, @RequestParam Integer QANo) throws Exception {
        BoardVO vo = boardService.read(QANo);
        boardService.boardCnt(QANo);
        model.addAttribute("vo", vo);

        List<ReplyVO> replyList = replyService.readReply(QANo);
        model.addAttribute("replyList", replyList);
        return "board/qnaInfo";
    }



    // 글 삭제
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public void delete(@RequestParam("QANo") Integer QANo, Model model) throws Exception {
        model.addAttribute("delete", QANo);
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam("QANo") Integer QANo) throws Exception {
        boardService.delete(QANo);
        return "redirect:/qna";
    }


    // 글 수정
    @RequestMapping(value = "/Gupdate", method= RequestMethod.GET)
    public String updateGET(@RequestParam("QANo") Integer QANo, Model model) throws  Exception{
        model.addAttribute("update", boardService.read(QANo));
        return "board/update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@ModelAttribute("update") BoardWriteDTO dto) throws Exception{
        boardService.update(dto);
        return "redirect:/qna";
    }

    //댓글



}
