package org.project.service;

import org.project.dto.CorporationDTO;
import org.project.vo.CorporationVO;

import java.util.List;

public interface CorporationService {
    public int create(CorporationDTO dto);
    public List<CorporationVO> listCorporation();

}
