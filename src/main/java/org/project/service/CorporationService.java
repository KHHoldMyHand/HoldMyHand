package org.project.service;

import org.project.dto.CorporationDTO;
import org.project.dto.EvaluateSuccessDTO;
import org.project.vo.CorporationVO;
import org.project.vo.CustomerVO;
import org.project.vo.FileVO;
import org.project.vo.PagingVO;

import java.util.List;

public interface CorporationService {

    public int create(CorporationDTO dto);

    public void modCorpScore(EvaluateSuccessDTO dto) throws Exception;

    // 신용정보 등록
    void submitCreditInfo(CorporationDTO dto) throws Exception;

    // 파일 정보 가져오기
    FileVO getFileName(CorporationDTO dto);

    // 신용정보 등록 고객 목록 페이징처리
    int countCorporation()throws Exception;
    List<CustomerVO> selectSubmitCustomer(PagingVO vo);

}
