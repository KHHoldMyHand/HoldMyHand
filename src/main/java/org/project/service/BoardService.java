package org.project.service;

import org.project.dto.BoardWriteDTO;
import org.project.searchandpaging.Criteria;
import org.project.vo.BoardVO;
import org.project.vo.PagingVO;

import java.util.List;

public interface BoardService {
    //List<BoardVO> qnaList() throws Exception;

    //글 작성
    public void write(BoardWriteDTO dto) throws Exception;

    // 게시물 총 갯수
    public int countBoard();

    // 페이징 처리 게시글 조회
    public List<BoardVO> selectBoard(PagingVO vo);
}