package com.fa.plus.admin.mapper;  
  
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.fa.plus.admin.domain.CsQnaManage;

@Mapper
public interface CsQnaManageMapper {
	public int dataCount(Map<String, Object> map);
	public List<CsQnaManage> listQna(Map<String, Object> map);
	
	public CsQnaManage findById(long num);
	
	public void updateAnswer(CsQnaManage dto) throws SQLException;
	public void deleteAnswer(long num) throws SQLException;
	public void deleteQna(long num) throws SQLException;
}
