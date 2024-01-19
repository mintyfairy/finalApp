package com.fa.plus.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.car.CarQna;

@Mapper
public interface CarQnaManageMapper {
	// 상품문의
	public List<CarQna> listQna(Map<String, Object> map);
	public List<CarQna> listQnaFile(long qnaNum);
	public int qnaCount (Map<String, Object> map);
}
