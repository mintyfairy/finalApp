package com.fa.plus.admin.service;
  
import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.CsEventManage;



public interface CsEventService {
	// 이벤트 등록 / 수정 / 삭제
		public void insertEvent(CsEventManage dto) throws Exception;
		public void updateEvent(CsEventManage dto) throws Exception;
		public void deleteEvent(long num) throws Exception;
		
		public int dataCount(Map<String, Object> map);
		public List<CsEventManage> listEvent(Map<String, Object> map);
		
		public CsEventManage findById(long num);
		public void updateHitCount(long num) throws Exception;
		public CsEventManage findByPrev(Map<String, Object> map);
		public CsEventManage findByNext(Map<String, Object> map);
		
		// 이벤트 응모자 리스트
		public List<CsEventManage> listEventTakers(long num);
		
		// 이벤트 당첨자 처리 / 리스트
		public void insertEventWinner(CsEventManage dto) throws Exception;
		public List<CsEventManage> listEventWinner(long num);
	}
