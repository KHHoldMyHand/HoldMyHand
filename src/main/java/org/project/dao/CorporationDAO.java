package org.project.dao;

import org.apache.ibatis.annotations.Mapper;
import org.project.dto.CorporationBoardDTO;
import org.project.dto.CorporationDTO;
import org.project.dto.EvaluateSuccessDTO;
import org.project.vo.CorporationVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CorporationDAO {

    public int create(CorporationDTO dto);

    public List<CorporationBoardDTO> listCorporation();

    public void modCS(EvaluateSuccessDTO dto) throws Exception;

    // 신용정보 등록
    void submitCreditInfo(CorporationDTO dto);
}
