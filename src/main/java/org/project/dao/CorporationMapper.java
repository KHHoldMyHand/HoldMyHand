package org.project.dao;

import org.apache.ibatis.annotations.Mapper;
import org.project.searchandpaging.Criteria;
import org.project.searchandpaging.SearchCriteria;
import org.project.vo.CorporationVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CorporationMapper {
//    public List<CorporationVO> listAllCorp();

      public int create(CorporationVO vo);

//    public CorporationVO read(Integer bno) throws Exception;
//
////    public void update(CorporationVO vo) throws Exception;
////
////    public void delete(Integer bno) throws Exception;
//
//    public List<CorporationVO> listPage(int page) throws Exception;
//
//    public List<CorporationVO> listCriteria(Criteria cri) throws Exception;
//
//    public int countPaging(Criteria cri) throws Exception;
//
//    //use for dynamic sql
//
//    public List<CorporationVO> listSearch(SearchCriteria cri)throws Exception;
//
//    public int listSearchCount(SearchCriteria cri)throws Exception;

}
