package org.project.dao;

import org.apache.ibatis.annotations.Mapper;
import org.project.dto.CorporationDTO;
import org.project.vo.CorporationVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CorporationDAO {

      public int create(CorporationDTO dto);
      public List<CorporationVO> listCorporation();
}
