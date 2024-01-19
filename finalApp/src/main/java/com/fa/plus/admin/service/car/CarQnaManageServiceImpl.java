package com.fa.plus.admin.service.car;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.car.CarQna;
import com.fa.plus.admin.mapper.CarQnaManageMapper;
import com.fa.plus.common.FileManager;

@Service
public class CarQnaManageServiceImpl implements CarQnaManageService{
	@Autowired
	private CarQnaManageMapper mapper;
	
	@Autowired
	private FileManager fileMnager;
	
	@Override
	public List<CarQna> listQna(Map<String, Object> map) {
		List<CarQna> list = null;
		
		try {
			list = mapper.listQna(map);
			
			String s;
			for(CarQna dto : list) {
				if(dto.getFilename() != null) {
					dto.setListFilename(dto.getFilename().split(","));
				}
				s = dto.getUserName().substring(0,1);
				if(dto.getUserName().length() <=2) {
					s += "*";
				} else {
					s += dto.getUserName().substring(2,  dto.getUserName().length()).replaceAll(".", "*");
				}
				s += dto.getUserName().substring(dto.getUserName().length()-1);
				dto.setUserName(s);
				
				dto.setQuestion(dto.getQuestion().replaceAll("\n", "<br>"));
				if(dto.getAnswer() != null) {
					dto.setAnswer(dto.getAnswer().replaceAll("\n", "<br>"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int qnaCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = mapper.qnaCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
