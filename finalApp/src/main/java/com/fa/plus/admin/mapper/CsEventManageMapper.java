package com.fa.plus.admin.mapper; 

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.CsEventManage;

@Mapper
public interface CsEventManageMapper {
	public void insertEvent(CsEventManage dto) throws SQLException;
	public void updateEvent(CsEventManage dto) throws SQLException;
	public void deleteEvent(long num) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<CsEventManage> listEvent(Map<String, Object> map);

	public CsEventManage findById(long num);
	public void updateHitCount(long num) throws SQLException;
	public CsEventManage findByPrev(Map<String, Object> map);
	public CsEventManage findByNext(Map<String, Object> map);

	// 이벤트 응모자 리스트
	public List<CsEventManage> listEventTakers(long num);
	
	// 이벤트 당첨자 등록(발표)
	public void insertEventWinner1(CsEventManage dto) throws SQLException;
	public void insertEventWinner2(CsEventManage dto) throws SQLException;
	// 이벤트 당첨자 리스트
	public List<CsEventManage> listEventWinner(long num);

}
