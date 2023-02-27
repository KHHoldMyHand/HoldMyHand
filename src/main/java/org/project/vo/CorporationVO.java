package org.project.vo;

import lombok.Data;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

@Data
@ToString
public class CorporationVO {
    private Integer userNo;                 //기업번호(유저번호)
    private String establishmentName;       //설립자명
    private String establishmentDate;       //설립일자
    private String companyName;             //기업이름
    private String companyScale;            //기업규모
    private Integer employeers;             //사원수
    private Integer tax;                    //세금
    private String score;                   //진단점수(재무재표점수)
    private String receiptDate;             //신청날짜

    private String fileName;
    private MultipartFile uploadFile;
}
