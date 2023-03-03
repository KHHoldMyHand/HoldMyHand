package org.project.service;

import org.project.dao.BoardDAO;
import org.project.dto.BoardWriteDTO;
import org.project.vo.BoardVO;
import org.project.vo.PagingVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class BoardServiceImpl implements BoardService{
    @Inject
    private BoardDAO boardDAO;

//    @Override
//    public List<BoardVO> qnaList() throws Exception{
//        return null;
//    }

    @Override
    public void write(BoardWriteDTO dto) throws Exception{
        boardDAO.write(dto);
    }

    @Override
    public int countBoard() {
        return boardDAO.countBoard();
    }

    @Override
    public List<BoardVO> selectBoard(PagingVO vo) {
        return boardDAO.selectBoard(vo);
    }

//    @Override
//    public BoardVO detail(Integer QANo) {
//        return boardDAO.detail(QANo);
//    }
//
    @Override
    public void boardCnt(Integer QANo) {
        boardDAO.boardCnt(QANo);
    }

    // 글 읽기
    @Override
    public BoardVO read(Integer QANo) {
        return boardDAO.read(QANo);
    }


    // 글 삭제
    @Override
    public void delete(Integer QANo) throws Exception {
        boardDAO.delete(QANo);
    }

    // 글 수정
    @Override
    public void update(BoardWriteDTO dto) throws Exception{
        boardDAO.update(dto);
    }

}