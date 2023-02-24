package org.project.dao;

import org.apache.ibatis.annotations.Mapper;
import org.project.dto.CorporationDTO;

@Mapper
public interface CorporationDAO {

      public int create(CorporationDTO dto);

}
