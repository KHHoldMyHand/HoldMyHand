package org.project.dto;

import lombok.Data;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Data
@ToString
public class CorporationDTO {
    private String establishmentName;
    private String establishmentDate;
    private String companyName;
    private String companyScale;
    private Integer employeers;

    private MultipartFile addfile;   // jsp -> controller : 파일 담는 용도
    private String originalFileName; // 원본 파일 이름
    private String storedFileName;   // 서버 저장용 파일 이름
    private int fileAttached; // 파일 첨부 여부(첨부 1, 미첨부0)



    private Integer score;
    private String tax;
    private Integer corpNo;

}
