package org.project.dao;

import org.project.dto.BoardWriteDTO;
import org.project.dto.ReplyDTO;
import org.project.vo.BoardVO;
import org.project.vo.PagingVO;
import org.project.vo.ReplyVO;

import java.util.List;
import java.util.Map;

public interface BoardDAO {

    //List<BoardVO> qnaList();

    // 글 작성
    public void write(BoardWriteDTO dto) throws Exception;

    int countBoard();

    // 리스트
    List<BoardVO> selectBoard(PagingVO vo);

    // BoardVO detail(Integer QANo);


    void boardCnt(Integer QANo);

    // 글 읽기
    BoardVO read(Integer QANo);


    // 글 삭제
    void delete(Integer QANo) throws Exception;

    // 글 수정
    void update(BoardWriteDTO dto) throws Exception;

    int countSearchBoard(Map<String, Object> paramMap) throws Exception;

    public List<BoardVO> selectSearchBoard(PagingVO vo) throws Exception;

    int saveReply(ReplyVO vo) throws Exception;


    List<ReplyDTO> getReplyList(ReplyVO vo) throws Exception;

}