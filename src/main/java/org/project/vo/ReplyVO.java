package org.project.vo;

import lombok.Data;

@Data
public class ReplyVO {
    private Integer ReplyNo;
    private String replyContent;
    private Integer QANo;
    private Integer userNo;
    private String ReWriter;
}
