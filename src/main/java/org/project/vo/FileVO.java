package org.project.vo;

import lombok.Data;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

@Data
@ToString
public class FileVO {
    private Integer userNo;
    private String fileName;
    private MultipartFile uploadFile;

}
