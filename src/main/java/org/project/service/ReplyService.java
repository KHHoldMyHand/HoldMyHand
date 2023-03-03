package org.project.service;

import org.project.vo.ReplyVO;

import java.util.List;

public interface ReplyService {
    //댓글 읽기
    public List<ReplyVO> readReply(Integer QANo) throws Exception;

}
