package org.project.service;

import org.project.dto.BoardWriteDTO;
import org.project.vo.BoardVO;
import org.project.vo.PagingVO;

import java.util.List;

public interface BoardService {
    //List<BoardVO> qnaList() throws Exception;


    public void write(BoardWriteDTO dto) throws Exception;


    public int countBoard();


    public List<BoardVO> selectBoard(PagingVO vo);

//    BoardVO detail(Integer QANo);

    public void boardCnt(Integer QANo);

    // 글 읽기
    public BoardVO read(Integer QANo);


    // 글 삭제
    public void delete(Integer QANo) throws Exception;

    // 글 수정
    public void update(BoardWriteDTO dto) throws Exception;

    public int countSearchBoard(String keyword,String searchType)throws Exception;

    public List<BoardVO> selectSearchBoard(PagingVO vo) throws Exception;
}