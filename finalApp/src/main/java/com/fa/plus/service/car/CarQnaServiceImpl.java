package com.fa.plus.service.car;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fa.plus.common.FileManager;
import com.fa.plus.domain.car.CarQna;
import com.fa.plus.mapper.CarQnaMapper;

@Service
public class CarQnaServiceImpl implements CarQnaService {
	@Autowired
	private CarQnaMapper mapper;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertCarQna(CarQna dto, String pathname) throws Exception {
		try {
			mapper.insertCarQna(dto);
			
			if(! dto.getSelectFile().isEmpty()) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String filename = fileManager.doFileUpload(mf, pathname);
					if(filename != null) {
						dto.setFilename(filename);
						mapper.insertCarQnaFile(dto);
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<CarQna> listCarQna(Map<String, Object> map) {
		List<CarQna> list = null;
		
		try {
			list = mapper.listCarQna(map);
			
			String s;
			for(CarQna dto : list) {
				if(dto.getFilename() != null) {
					dto.setListFilename(dto.getFilename().split(","));
				}
				
				s = dto.getUserName().substring(0, 1);
				if(dto.getUserName().length() <= 2) {
					s += "*";
				} else {
					s += dto.getUserName().substring(2, dto.getUserName().length()).replaceAll(".", "*");
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
	public int dataCount2(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount2(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<CarQna> listQuestion2(Map<String, Object> map) {
		List<CarQna> list = null;
		
		try {
			list = mapper.listQuestion2(map);
			for(CarQna dto : list) {
				if(dto.getFilename() != null) {
					dto.setListFilename(dto.getFilename().split(",")); 
				}
				
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
	public void updateQuestion(CarQna dto) throws Exception {
		try {
			mapper.updateQuestion(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteQuestion(long qnaNum, String pathname) throws Exception {
		try {
			List<CarQna> listFile = mapper.listQnaFile(qnaNum);
			if(listFile != null) {
				for (CarQna dto : listFile) {
					fileManager.doFileDelete(dto.getFilename());
				}
			}
			
			mapper.deleteQuestion(qnaNum);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	
	
}
