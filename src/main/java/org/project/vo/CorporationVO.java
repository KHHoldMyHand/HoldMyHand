package org.project.vo;

import lombok.Data;
import lombok.ToString;

import java.util.Date;

@Data
@ToString
public class CorporationVO {
    Integer corpNo;
    String establishmentName;
    Date establishmentDate;
    String companyScale;
    Integer employeers;
    Character file;
    Integer score;
    String tax;
}
