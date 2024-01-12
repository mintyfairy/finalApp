package com.fa.plus.admin.mapper; 
 
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.CsFaqManage;

@Mapper
public interface CsFaqManageMapper {
	public void insertFaq(CsFaqManage dto) throws SQLException;
	public void updateFaq(CsFaqManage dto) throws SQLException;
	public void deleteFaq(Map<String, Object> map) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<CsFaqManage> listFaq(Map<String, Object> map);
	
	public CsFaqManage findById(long num);
	public CsFaqManage findByPrev(Map<String, Object> map);
	public CsFaqManage findByNext(Map<String, Object> map);
	
	public void insertCategory(CsFaqManage dto) throws SQLException;
	public List<CsFaqManage> listCategory(Map<String, Object> map);
	public void updateCategory(CsFaqManage dto) throws SQLException;
	public void deleteCategory(long num) throws SQLException;
}
