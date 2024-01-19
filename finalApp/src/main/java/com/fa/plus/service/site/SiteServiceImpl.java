package com.fa.plus.service.site;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fa.plus.common.FileManager;
import com.fa.plus.domain.site.Book;
import com.fa.plus.domain.site.BookList;
import com.fa.plus.domain.site.SiteCart;
import com.fa.plus.domain.site.SiteReview;
import com.fa.plus.mapper.SiteMapper;

@Service
public class SiteServiceImpl implements SiteService {
	@Autowired
	private SiteMapper mapper;

	@Autowired
	private FileManager fileManager;

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
	public void deleteCart(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		try {
			mapper.deleteCart(map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
	}
	@Override
	public void deleteAllCart(long memberIdx) throws SQLException {
		// TODO Auto-generated method stub
		try {
			mapper.deleteAllCart(memberIdx);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<SiteCart> listCart(long memberIdx) {
		// TODO Auto-generated method stub
		List<SiteCart> list = null;
		int periods = 0;

		try {
			list = mapper.listCart(memberIdx);
			for (SiteCart dto : list) {
				periods = period(dto.getStartDate(), dto.getEndDate());
				dto.setPeriodPrice(periods * Integer.parseInt(dto.getPrice()));

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Map<String, Object> insertBookList(List<SiteCart> cartList) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		int totalPrice = 0;
		for (SiteCart dto : cartList) {
			totalPrice += dto.getPeriodPrice();
		}

		try {
			
			map.put("listNum",mapper.listNum());
			map.put("memberIdx", cartList.get(0).getMemberIdx());
			map.put("perchaseMethod", "카드");
			map.put("totalPrice", totalPrice);

			mapper.insertBookList(map);
			for (SiteCart dto : cartList) {
				System.out.println(dto.getDetailNum()+" 서비스");
				mapper.insertBook(dto);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
		return map;
	}
	@Override
	public void insertPerchase(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		try {
			mapper.perchaseSite(map);
			mapper.updateBokkState(map);
			mapper.deleteAllCart((long) map.get("memberIdx"));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
	}
	@Override
	public void deleteTrashBook(long num) {
		// TODO Auto-generated method stub
		
		try {
			long[] numlist=mapper.getTrashNum();
			if (numlist.length>0) {
				for(long a:numlist) {
					mapper.deleteTrashBook1(a);
				}
			}
			mapper.deleteTrashBook2();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
	}

	public int period(String date1, String date2) throws ParseException {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date d1 = format.parse(date1);
		Date d2 = format.parse(date2);
		long Sec = (d2.getTime() - d1.getTime()) / 1000; // 초
		int Days = (int) (Sec / (24 * 60 * 60));
		return Days;
	}

	@Override
	public List<BookList> listBookList(long memberIdx) {
		List<BookList> list = null;
		try {
			list = mapper.listBookList(memberIdx);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}

		return list;
	}

	@Override
	public List<Book> listBook(Map<String, Object> map) {
		List<Book> list = null;
		try {
			list = mapper.listBook(map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}

		return list;
	}

	@Override
	public void insertReview(SiteReview dto,String pathname) throws Exception {
		try {
			mapper.insertReview(dto);

			// 추가 이미지 저장
			String filename = null;
			if (!dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					filename = fileManager.doFileUpload(mf, pathname);
					if (filename == null) {
						continue;
					}
					dto.setFileName(filename);

					mapper.insertReviewFile(dto);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public List<SiteReview> listSiteReivew(Map<String, Object> map) {
		List<SiteReview> list = null;
		try {
			list = mapper.listSiteReivew(map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}

		return list;
	}
	@Override
	public List<SiteReview> listSiteGoodReivew(Map<String, Object> map) {
		List<SiteReview> list = null;
		try {
			list = mapper.listSiteGoodReivew(map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
		
		return list;
	}

	@Override
	public int dataCountReview(Map<String, Object> map) {
		int a = 0;
		try {
			a = mapper.dataCountReview(map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}

		return a;
	}

	@Override
	public void updateReview(SiteReview dto,String pathname) throws Exception {
		try {
			mapper.updateReview(dto);

			String filename = null;
			if (!dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					filename = fileManager.doFileUpload(mf, pathname);
					if (filename == null) {
						continue;
					}
					dto.setFileName(filename);

					mapper.insertReviewFile(dto);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
	
	}

	@Override
	public void deleteReview(long bookNum) {
		try {
			mapper.deleteReview(bookNum);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
	
	}

	@Override
	public void deleteReviewFile(long srPicNum,String pathname) {
		try {
			if (pathname != null) {
				fileManager.doFileDelete(pathname);
			}

			mapper.deleteReviewFile(srPicNum);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
	
	}

	@Override
	public SiteReview findByReview(long bookNum) {
		SiteReview dto = null;
		try {
			dto = mapper.findByReview(bookNum);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}

		return dto;
	}

	@Override
	public void updateReviewAnswer(SiteReview dto) throws Exception{
		try {
			mapper.updateReviewAnswer(dto);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
	
	}

	@Override
	public void updateSiteStar(Map<String, Object> map) {
		try {
			/*update campingsite set avgstar=#{star} 
			where sitenum=#{siteNum}*/
			double star=0;
			List<SiteReview> reviewlist=mapper.listSiteReivew(map);
			for (SiteReview s : reviewlist){
				star+=s.getScore();
			}
			star=star/reviewlist.size();
			map.put("star", star);
			mapper.updateSiteStar(map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
	
	}

	@Override
	public int dataCountBook(Map<String, Object> map) {
		int a=0;
		try {
			a=mapper.dataCountBook(map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
		return a;
	}

}