package org.project.service;

import org.project.dao.CorporationDAO;
import org.project.dao.CustomerDAO;
import org.project.dto.CorporationDTO;
import org.project.dto.EvaluateSuccessDTO;
import org.project.vo.CorporationVO;
import org.project.vo.CustomerVO;
import org.project.vo.FileVO;
import org.project.vo.PagingVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class CorporationServiceImpl implements CorporationService{

    @Inject
    CorporationDAO dao;

    @Override
    public int create(CorporationDTO dto) {
        return 0;
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

    // 파일 정보 가져오기
    @Override
    public FileVO getFileName(CorporationDTO dto) {
        return dao.getFileName(dto);
    }

    // 신용정보 등록 고객 목록 페이징처리
    @Override
    public int countCorporation() throws Exception {
        return dao.countCorporation();
    }
    @Override
    public List<CustomerVO> selectSubmitCustomer(PagingVO vo) {
        return dao.selectSubmitCustomer(vo);
    }
}
