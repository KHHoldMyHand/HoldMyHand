package org.project.service;

import org.project.dto.CorporationDTO;
import org.project.dto.EvaluateSuccessDTO;
import org.project.vo.CorporationVO;
import org.project.vo.CustomerVO;

import java.util.List;

public interface CorporationService {

    public int create(CorporationDTO dto);

    // 평가 진행 목록 페이지
    public List<CorporationVO> listCorporation();

    public void modCorpScore(EvaluateSuccessDTO dto) throws Exception;

    // 신용정보 등록
    void submitCreditInfo(CorporationDTO dto) throws Exception;


}
