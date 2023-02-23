package org.project.vo;

import lombok.Data;
import lombok.ToString;

import java.util.Date;

@Data
@ToString
public class CorporationVO {
    String establishmentName;
    Integer establishmentDate;
    String companyName;
    String companyScale;
    Integer employeers;
    String addfile;
    Integer score;
    String tax;
    Integer corpNo;
}
