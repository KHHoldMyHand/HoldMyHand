package org.project.dao;

import org.project.dto.BoardWriteDTO;
import org.project.vo.BoardVO;
import org.project.vo.PagingVO;

import java.util.List;

public interface BoardDAO {

    List<BoardVO> qnaList();

    //±€ ¿€º∫
    public void write(BoardWriteDTO dto) throws Exception;

    int countBoard();

    List<BoardVO> selectBoard(PagingVO vo);
}