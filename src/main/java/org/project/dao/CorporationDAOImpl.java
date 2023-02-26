package org.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.project.dto.CorporationDTO;
import org.project.vo.CorporationVO;

import javax.inject.Inject;
import java.util.List;

public class CorporationDAOImpl implements CorporationDAO{

    @Inject
    private SqlSession session;


    private static String namespace = "org.project.dao.CorporationDAO";

    @Override
    public int create(CorporationDTO dto) {
        return 0;
    }

    @Override
    public List<CorporationVO> listCorporation() {
        return null;
    }
}
