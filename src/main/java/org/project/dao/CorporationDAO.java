package org.project.dao;

import org.project.dto.CorporationBoardDTO;
import org.project.dto.CorporationDTO;
import org.project.dto.EvaluateSuccessDTO;
import org.project.vo.CustomerVO;
import org.project.vo.FileVO;
import org.project.vo.PagingVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CorporationDAO {

    public int create(CorporationDTO dto);

    // 평가 진행 목록
    public List<CorporationBoardDTO> listCorporation();

    public void modCS(EvaluateSuccessDTO dto) throws Exception;

    // 신용정보 등록
    void submitCreditInfo(CorporationDTO dto);

    // 파일 정보 가져오기
    FileVO getFileName(CorporationDTO dto);

    // 신용정보 등록 고객 목록 페이징처리
    int countCorporation() throws Exception;
    List<CustomerVO> selectSubmitCustomer(PagingVO vo);

}
