package org.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.project.dto.BoardWriteDTO;
import org.project.dto.ReplyDTO;
import org.project.vo.BoardVO;
import org.project.vo.PagingVO;
import org.project.vo.ReplyVO;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

@Repository
public class BoardDAOImpl implements BoardDAO{

    @Inject
    private SqlSession session;

    private static String namespace ="org.project.dao.BoardDAO";

    //@Override
    //public List<BoardVO> qnaList() {return null;}

    // 글 쓰기
    @Override
    public void write(BoardWriteDTO dto) {
        session.insert(namespace+".write", dto);
    }

    @Override
    public int countBoard() {

        return session.selectOne(namespace+".countBoard");
    }

    @Override
    public List<BoardVO> selectBoard(PagingVO vo) {

        return session.selectList(namespace + ".selectBoard", vo);
    }

//    @Override
//    public BoardVO detail(Integer QANo) {
//
//        return session.selectOne(namespace + ".detail", QANo);
//    }

    @Override
    public void boardCnt(Integer QANo) {
        session.update(namespace + ".boardCnt", QANo);
    }

    @Override
    public BoardVO read(Integer QANo) {
        return session.selectOne(namespace + ".read", QANo);
    }


    // 글 삭데
    @Override
    public void delete(Integer QANo) throws Exception{
        session.delete(namespace+".delete", QANo);
    }

    // 글 수정
    @Override
    public void update(BoardWriteDTO dto) throws Exception {
        session.update(namespace+".update", dto);
    }

    @Override
    public int countSearchBoard(Map<String,Object> paramMap) throws Exception{
        return session.selectOne(namespace+".countSearchBoard",paramMap);
    }

    @Override
    public List<BoardVO> selectSearchBoard(PagingVO vo) throws Exception {
        return session.selectList(namespace + ".selectSearchBoard", vo);
    }

    @Override
    public int saveReply(ReplyVO vo) throws Exception {
        return session.insert(namespace + ".saveReply", vo);
    }

    @Override
    public List<ReplyDTO> getReplyList(ReplyVO vo) throws Exception {
        return session.selectList(namespace + ".getReplyList", vo);
    }
}