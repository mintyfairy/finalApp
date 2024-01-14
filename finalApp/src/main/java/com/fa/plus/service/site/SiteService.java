package com.fa.plus.service.site;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.fa.plus.domain.site.SiteCart;

public interface SiteService {
	// 카트를 생성한다.(장바구니에 넣기
	public void insertCart(SiteCart dto) throws SQLException;
	
	// 카트를 삭제한다.(카트페이지겸 결제페이지에서 각 항목 마다 존재하는 
	//		삭제버튼 혹은 x 버튼을 누르면 삭제된다 이후
	// 	1.ajax로 주문록목에서 삭제된부분만 지운다 .
	// 	2.해당페이지를 리다이렉트한다. 
	//	두가지 방법이 있다.
	//
	// cart 컬럼의 primarykey는 (memberIdx,detailNum) 이라 둘다 넘겨줘야한다.
	// domain이 있으니 담아서 보내주자.
	public void deleteCart(SiteCart dto) throws SQLException;
	
	//	memberIdx로 그사람의 카트 목록을 불러온다. 
	public List<SiteCart> listCart(long memberIdx);
	
	//여기안에 map안에 3개의 map이 저장되어 날아가야한다...
	public void insertPerchase(List<SiteCart> cartList) throws Exception;

	
	
}
