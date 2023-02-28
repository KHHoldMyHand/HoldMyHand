package org.project.service;

import org.project.dao.CorporationDAO;
import org.project.dao.CustomerDAO;
import org.project.dto.CorporationDTO;
import org.project.dto.EvaluateSuccessDTO;
import org.project.vo.CorporationVO;
import org.project.vo.CustomerVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class CorporationServiceImpl implements CorporationService{

    @Inject
    CorporationDAO dao;
    @Inject
    CustomerDAO customerDAO;

    @Override
    public int create(CorporationDTO dto) {
        return 0;
    }

    // 평가 진행 목록 페이지
    @Override
    public List<CorporationVO> listCorporation() {
        return null;
    }

    @Override
    public void modCorpScore(EvaluateSuccessDTO dto) throws Exception {
        dao.modCS(dto);
    }

    // 신용정보 등록
    @Override
    public void submitCreditInfo(CorporationDTO dto) throws Exception {
        dao.submitCreditInfo(dto);
    }




}
