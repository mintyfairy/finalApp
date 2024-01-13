package com.fa.plus.service.site;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Period;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.site.SiteCart;
import com.fa.plus.mapper.SiteMapper;

@Service
public class SiteServiceImpl implements SiteService {
	@Autowired
	private SiteMapper mapper;
	@Override
	public void insertCart(SiteCart dto) throws SQLException {
		// TODO Auto-generated method stub
		try {
			mapper.insertCart(dto);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteCart(SiteCart dto) throws SQLException {
		// TODO Auto-generated method stub
		try {
			mapper.deleteCart(dto);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<SiteCart> listCart(long memberIdx) {
		// TODO Auto-generated method stub
		List<SiteCart> list=null;
		try {
			list= mapper.listCart(memberIdx);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
				
		return list;
	}

	@Override
	public void insertPerchase(List<SiteCart> cartList) throws Exception {
	
	}
	public int period(String date1,String date2) throws ParseException {
		 DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		 Date d1 = format.parse(date1);
		 Date d2 = format.parse(date2);
		 long Sec = (d1.getTime() - d2.getTime()) / 1000; // 초
		 int Days = (int) (Sec / (24*60*60));
		 return Days;
	}
}
