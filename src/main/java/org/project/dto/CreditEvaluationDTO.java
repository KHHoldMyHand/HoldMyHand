package org.project.dto;

import lombok.Data;
import lombok.ToString;

import java.util.Date;

@Data
@ToString
public class CreditEvaluationDTO {
    Integer reportNo;//보고서번호
    Integer employeers;//사원수
    String reportRank;//등급
    String establishmentName;//설립자명
    String establishmentDate;//설립일자
    String companyScale;//기업규모
    Date createDate;//보고서생성일자
    Date fileDate;//재무재표일자

}


