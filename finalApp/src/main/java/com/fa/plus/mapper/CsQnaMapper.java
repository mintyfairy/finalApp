package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.cs.Qna;

@Mapper
public interface CsQnaMapper {
	public void insertQna(Qna dto) throws SQLException;
	public void deleteQna(long num) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<Qna> listQna(Map<String, Object> map);
	
	public Qna findById(long num);
}
