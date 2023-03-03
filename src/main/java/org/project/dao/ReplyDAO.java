package org.project.dao;

import org.project.vo.ReplyVO;

import java.util.List;

public interface ReplyDAO {
    //댓글 읽기
    public List<ReplyVO> readReply(Integer QANo) throws Exception;
}
