package org.project.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CorporationBoardDTO {
    //Customer테이블과 Corporation을 Oracle JOIN 사용해서 특정 컬럼만 추출한 것.
    private Integer userNo;
    private String establishmentName;
    private String companyName;
    private String companyScale;
    private Integer employeers;
    private Integer tax;
    private Integer files;
}
