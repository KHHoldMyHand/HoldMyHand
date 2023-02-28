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

    //±€ ¿€º∫
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

}