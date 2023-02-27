package org.project.service;

import org.project.dto.CorporationDTO;
import org.project.dto.EvaluateSuccessDTO;
import org.project.vo.CorporationVO;

import java.util.List;

public interface CorporationService {
    public int create(CorporationDTO dto);
    public List<CorporationVO> listCorporation();

    public void modCorpScore(EvaluateSuccessDTO dto) throws Exception;

    void submitCreditInfo(CorporationDTO dto) throws Exception;
}
