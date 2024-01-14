package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.site.Book;
import com.fa.plus.domain.site.BookList;
import com.fa.plus.domain.site.SiteCart;
import com.fa.plus.domain.site.SiteReview;

/***
 * 
 * 카트에는 아직 결제하지않은 주문이 담긴다.
 * 카트에는 
 *			MEMBERIDX	NUMBER 		카트목록의 주인
			DETAILNUM	NUMBER		이 항목의 방번호
			STARTDATE	DATE		예약시작일
			ENDDATE		DATE		예약종료일
			REG_DATE	DATE		카트생성일 : 일정시간이 지난 카트를 삭제하려할때 사용될것

 */
@Mapper
public interface SiteMapper {
	// 카트를 생성한다.(장바구니에 넣기
	public void insertCart(SiteCart dto) throws SQLException;
	
	// 카트를 삭제한다.(카트페이지겸 결제페이지에서 각 항목 마다 존재하는 
	//		삭제버튼 혹은 x 버튼을 누르면 삭제된다 이후
	// 	1.ajax로 주문록목에서 삭제된부분만 지운다 .
	// 	2.해당페이지를 리다이렉트한다. 
	//	두가지 방법이 있다.
	//
	// cart 컬럼의 primarykey는 (memberidx,detailnum) 이라 둘다 넘겨줘야한다.
	// domain이 있으니 담아서 보내주자.
	public void deleteCart(SiteCart dto) throws SQLException;
	
	//리뷰 FindById
	public SiteCart findByCart(SiteCart dto) throws SQLException;
	
	//카트 개수
	public int dataCountCart(long memberIdx);
	
	//	memberidx로 그사람의 카트 목록을 불러온다. 
	public List<SiteCart> listCart(long memberIdx);
	
	//이하 4개의 메소드는 함꼐 행동한다. 결제검증(구현안됨 지금은 누르면 바로 결제)
	// 완료시 북리스트 생성후
	//    (북 등록)을 결제할 항목수만큼 반복해서 실행할것이다.
	//그후 결제등록
	//insert로시작하는 메소드는 트랜섹션이 되게설정되어잇을테니(아마도) 한메소드에서 진행한다.
	
	//booklist
	public void insertBookList(Map<String, Object> map) throws SQLException;
	//book
	public void insertBook(SiteCart dto) throws SQLException;
	
	
	//결제
	public void perchaseSite(Map<String, Object> map) throws SQLException;
	//결제끝났으니 카트를 비운다.
	public void deleteAllCart(long memberIdx) throws SQLException;
	
	//예약 리스트의 리스트
	public List<BookList> listBookList(long memberIdx);
	//예약 상세 리스트 
	public List<Book> listBook(long listNum);
	
	
	//리뷰 넣기
	public void insertReview(SiteReview dto) throws SQLException;
	
	//리뷰 사진 등록
	public void insertReviewFile(SiteReview dto) throws SQLException;
	//리뷰 리스트 1.(memberIdx 존재시) 유저의 예약리스트  2 업체 3 리스트
	
	// 리뷰수  1 유저의 리스트 2 업체 3 리스트
	

	
	//리뷰파일 리스트 
	
	//리뷰 수정
	//리뷰 삭제
	//리뷰 파일 삭제
	
	//리뷰 findById
	
	
	
	//리뷰답변입력
	//별점 갱신
	
	
	
	
	//하루지난 카레는 지울까 말까... 일단 나중에
	public void resetCart();
}
