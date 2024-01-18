package com.fa.plus.admin.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.mapper.SiteChartMapper;

@Service
public class SiteChartServiceImpl implements SiteChartService{
	@Autowired
	private SiteChartMapper mapper;
	
	@Override
	public Map<String, Object> previousMonthBook() {
		// TODO Auto-generated method stub
		Map<String, Object> map=null;
		try {
			map=mapper.previousMonthBook();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public Map<String, Object> adEfect() {
		// TODO Auto-generated method stub
		Map<String, Object> map=null;
		try {
			map=mapper.adEfect();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public Map<String, Object> previousYearBook() {
		// TODO Auto-generated method stub
		Map<String, Object> map=null;
		try {
			map=mapper.previousYearBook();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return map;
	}

}
