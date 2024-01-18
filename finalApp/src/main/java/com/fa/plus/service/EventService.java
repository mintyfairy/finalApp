package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.cs.Event;


public interface EventService {
	public int dataCount(Map<String, Object> map);
	public List<Event> listEvent(Map<String, Object> map);
	
	public void updateHitCount(long num) throws Exception;
	public Event findById(long num);
	public Event findByPrev(Map<String, Object> map);
	public Event findByNext(Map<String, Object> map);
	
	public void insertEventTakers(Event dto) throws Exception;
	public List<Event> listEventTakers(long num);
	public boolean userEventTakers(Map<String, Object> map);	

	public Event findByEventWinner(Map<String, Object> map);
	public List<Event> listEventWinner(long num);
}
