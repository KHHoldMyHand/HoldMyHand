package org.project.dao;

import org.project.dto.BoardWriteDTO;
import org.project.vo.BoardVO;
import org.project.vo.PagingVO;

import java.util.List;

public interface BoardDAO {

    //List<BoardVO> qnaList();

    //글 작성
    public void write(BoardWriteDTO dto) throws Exception;

    int countBoard();
    // 페이징
    List<BoardVO> selectBoard(PagingVO vo);

//    void boardCount(int qano);
}