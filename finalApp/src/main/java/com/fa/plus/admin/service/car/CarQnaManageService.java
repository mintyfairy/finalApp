package com.fa.plus.admin.service.car;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.car.CarQna;

public interface CarQnaManageService {
	// qna 관리
	public List<CarQna> listQna(Map<String, Object> map);
	public int qnaCount (Map<String, Object> map);
	
}
