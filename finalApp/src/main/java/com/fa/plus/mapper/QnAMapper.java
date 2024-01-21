package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.shop.QnA;

@Mapper
public interface QnAMapper {
	public void insertQuestion(QnA dto) throws SQLException;
	public void insertQuestionFile(QnA dto) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<QnA>listQuestion(Map<String, Object> map);
	
	public int dataCount2(Map<String, Object> map);
	public List<QnA>listQuestion2(Map<String, Object> map);
	
	public void updateQuestion(QnA dto) throws SQLException;

	public List<QnA>listQuestionFile(long qnaNum);
	public void deleteQuestion(long qnaNum) throws SQLException;
	public void deleteQnAFile(long qnaNum) throws SQLException;
}
