package org.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.project.dto.BoardWriteDTO;
import org.project.vo.BoardVO;
import org.project.vo.PagingVO;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class BoardDAOImpl implements BoardDAO{

    @Inject
    private SqlSession session;

    private static String namespace ="org.project.dao.BoardDAO";

    @Override
    public List<BoardVO> qnaList() {return null;}

    //±€ ¿€º∫
    @Override
    public void write(BoardWriteDTO dto) throws Exception{
        session.insert(namespace+".write", dto);
    }

    @Override
    public int countBoard() {

        return 0;
    }

    @Override
    public List<BoardVO> selectBoard(PagingVO vo) {

        return null;
    }

}