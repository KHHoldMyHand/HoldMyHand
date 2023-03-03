package org.project.service;

import org.project.dao.ReplyDAO;
import org.project.vo.ReplyVO;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;
@Repository
public class ReplyServiceImpl implements  ReplyService{
    @Inject
    private ReplyDAO dao;

    //댓글 읽기
    @Override
    public List<ReplyVO> readReply(Integer QANo) throws Exception{
        return dao.readReply(QANo);
    }
}
