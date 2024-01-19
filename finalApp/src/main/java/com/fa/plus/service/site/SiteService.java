package com.fa.plus.service.site;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.fa.plus.domain.site.Book;
import com.fa.plus.domain.site.BookList;
import com.fa.plus.domain.site.SiteCart;
import com.fa.plus.domain.site.SiteReview;

public interface SiteService {
	// 카트를 생성한다.(장바구니에 넣기
	public void insertCart(SiteCart dto) throws SQLException;

	// 카트를 삭제한다.(카트페이지겸 결제페이지에서 각 항목 마다 존재하는
	// 삭제버튼 혹은 x 버튼을 누르면 삭제된다 이후
	// 1.ajax로 주문록목에서 삭제된부분만 지운다 .
	// 2.해당페이지를 리다이렉트한다.
	// 두가지 방법이 있다.
	//
	// cart 컬럼의 primarykey는 (memberIdx,detailNum) 이라 둘다 넘겨줘야한다.
	// domain이 있으니 담아서 보내주자.
	public void deleteCart(Map<String, Object> map) throws SQLException;
	public void deleteAllCart(long memberIdx) throws SQLException;

	// memberIdx로 그사람의 카트 목록을 불러온다.
	public List<SiteCart> listCart(long memberIdx);

	// 여기안에 map안에 3개의 map이 저장되어 날아가야한다...
	public Map<String, Object> insertBookList(List<SiteCart> cartList) throws Exception;
	public void insertPerchase(Map<String,Object> map) throws Exception;

	// 예약 리스트의 리스트
	public List<BookList> listBookList(long memberIdx);

	// 예약 상세 리스트
	public List<Book> listBook(Map<String, Object> map);

	// 리뷰 넣기 리뷰의 주요키는 결제목록인 booknum, 1대1관계다
	public void insertReview(SiteReview dto,String pathname) throws Exception;

	
	// 리뷰 리스트 1.(memberIdx 존재시) 유저의 예약리스트 2 업체(siteNum) 3 방(detailNum)
	public List<SiteReview> listSiteReivew(Map<String, Object> map);
	public List<SiteReview> listSiteGoodReivew(Map<String, Object> map);

	public int dataCountBook(Map<String, Object> map);
	// 리뷰수 1 유저의 리스트 2 업체 3 방
	public int dataCountReview(Map<String, Object> map);

	// 리뷰파일 리스트 리부 dto에 fileList필드로 반환시켯다. 그것은
	// 이름1.jpg,이름2.jpg... 와같은 형태를 하고 있다.
	// public List<SiteReview> listReviewFile(long bookNum) ;

	// 리뷰 수정
	public void updateReview(SiteReview dto,String pathname) throws Exception;

	// 리뷰 삭제
	public void deleteReview(long bookNum);
	public void deleteTrashBook(long Num);

	// 리뷰 파일 삭제
	public void deleteReviewFile(long srPicNum,String pathname);

	// 리뷰 findById
	public SiteReview findByReview(long bookNum);

	// 리뷰답변입력
	public void updateReviewAnswer(SiteReview dto) throws Exception;

	// 별점 갱신
	public void updateSiteStar(Map<String, Object> map);

}
