package org.project.dto;

import lombok.Data;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Data
@ToString
public class CorporationDTO {
    private String establishmentName;   //설립자명
    private String establishmentDate;   //설립일자
    private String companyName;         //기업이름
    private String companyScale;        //기업규모
    private Integer employeers;         //사원수
    private Integer score;              //점수
    private String tax;                 //세금
    private Integer userNo;             //기업(유저)번호

    private String fileName; // 원본 파일 이름
    private MultipartFile uploadFile;
//    private int fileAttached; // 파일 첨부 여부(첨부 1, 미첨부0)



}
