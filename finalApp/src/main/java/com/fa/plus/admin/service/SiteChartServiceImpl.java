package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.mapper.SiteChartMapper;

@Service
public class SiteChartServiceImpl implements SiteChartService {
	@Autowired
	private SiteChartMapper mapper;

	@Override
	public Map<String, Object> previousMonthBook() {
		// TODO Auto-generated method stub
		Map<String, Object> map = null;
		try {
			map = mapper.previousMonthBook();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public Map<String, Object> adEfect() {
		// TODO Auto-generated method stub
		Map<String, Object> map = null;
		try {
			map = mapper.adEfect();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public Map<String, Object> previousYearBook() {
		// TODO Auto-generated method stub
		Map<String, Object> map = null;
		try {
			map = mapper.previousYearBook();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public List<Map<String, Object>> siteRankYear() {
		// TODO Auto-generated method stub
		List<Map<String, Object>> map = null;
		try {
			map = mapper.siteRankYear();
			for (int i=0 ;i<map.size();i++) {
				String j=String.valueOf(map.get(i).get("SITELOCAL"));
				System.out.println(j);
				if (j.equals("1")) {
					map.get(i).put("SITELOCAL", "서울");
				}else if(j.equals("2")) {
					map.get(i).put("SITELOCAL", "인천");
				}else if(j.equals("3")) {
					map.get(i).put("SITELOCAL", "경기");
				}else if(j.equals("4")) {
					map.get(i).put("SITELOCAL", "강원");
				}else if(j.equals("5")) {
					map.get(i).put("SITELOCAL", "대전");
				}else if(j.equals("6")) {
					map.get(i).put("SITELOCAL", "세종");
				}else if(j.equals("7")) {
					map.get(i).put("SITELOCAL", "충북");
				}else if(j.equals("8")) {
					map.get(i).put("SITELOCAL", "충남");
				}else if(j.equals("9")) {
					map.get(i).put("SITELOCAL", "대구");
				}else if(j.equals("10")) {
					map.get(i).put("SITELOCAL", "울산");
				}else if(j.equals("11")) {
					map.get(i).put("SITELOCAL", "경북");
				}else if(j.equals("12")) {
					map.get(i).put("SITELOCAL", "경남");
				}else if(j.equals("13")) {
					map.get(i).put("SITELOCAL", "전북");
				}else if(j.equals("14")) {
					map.get(i).put("SITELOCAL", "전남");
				}else if(j.equals("15")) {
					map.get(i).put("SITELOCAL", "제주");
				}else {
					map.get(i).put("SITELOCAL", "기타");
				}
				System.out.println((String) map.get(i).get("SITELOCAL"));
				System.out.println(map.get(i).get("SITELOCAL"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public List<Map<String, Object>> monthsRankYear() {
		// TODO Auto-generated method stub
		List<Map<String, Object>> map = null;
		try {
			map = mapper.monthsRankYear();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public List<Map<String, Object>> daysRankYear() {
		// TODO Auto-generated method stub
		List<Map<String, Object>> map = null;
		try {
			map = mapper.daysRankYear();
			for (int i=0 ;i<map.size();i++) {
				String j=String.valueOf(map.get(i).get("ORDER_DAYS"));
				System.out.println(j);
				if (j.equals("1")) {
					map.get(i).put("ORDER_DAYS", "일요일");
				}else if(j.equals("2")) {
					map.get(i).put("ORDER_DAYS", "월요일");
				}else if(j.equals("3")) {
					map.get(i).put("ORDER_DAYS", "화요일");
				}else if(j.equals("4")) {
					map.get(i).put("ORDER_DAYS", "수요일");
				}else if(j.equals("5")) {
					map.get(i).put("ORDER_DAYS", "목요일");
				}else if(j.equals("6")) {
					map.get(i).put("ORDER_DAYS", "금요일");
				}else if(j.equals("7")) {
					map.get(i).put("ORDER_DAYS", "토요일");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public List<Map<String, Object>> thingsRankYear(String keyword) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> map = null;
		try {
			System.out.println(keyword+"@@2@");
			map = mapper.thingsRankYear(keyword);
			if(keyword.equals("environment")) {
				for (int i=0 ;i<map.size();i++) {
					String j=String.valueOf(map.get(i).get("THINGS"));
					if (j.equals("1")) {
						map.get(i).put("THINGS", "산");
					}else if(j.equals("2")) {
						map.get(i).put("THINGS", "강");
					}else if(j.equals("3")) {
						map.get(i).put("THINGS", "바다");
					}else if(j.equals("4")) {
						map.get(i).put("THINGS", "도심");
					}else if(j.equals("5")) {
						map.get(i).put("THINGS", "계곡");
					}else if(j.equals("6")) {
						map.get(i).put("THINGS", "호수");
					}else if(j.equals("7")) {
						map.get(i).put("THINGS", "평야");
					}else if(j.equals("8")) {
						map.get(i).put("THINGS", "기타");
					}else {
						map.get(i).put("THINGS", "기타");
					}
				}
			} else if (keyword.equals("category")) {
				for (int i=0 ;i<map.size();i++) {
					String j=String.valueOf(map.get(i).get("THINGS"));
					if (j.equals("1")) {
						map.get(i).put("THINGS", "오토캠핑");
					}else if(j.equals("2")) {
						map.get(i).put("THINGS", "글램핑");
					}else if(j.equals("3")) {
						map.get(i).put("THINGS", "카라반");
					}else if(j.equals("4")) {
						map.get(i).put("THINGS", "방갈로");
					}else if(j.equals("5")) {
						map.get(i).put("THINGS", "차박");
					}else {
						map.get(i).put("THINGS", "기타");
					}
				}
			} else if (keyword.equals("floor")) {
				for (int i=0 ;i<map.size();i++) {
					String j=String.valueOf(map.get(i).get("THINGS"));
					if (j.equals("1")) {
						map.get(i).put("THINGS", "데크");
					}else if(j.equals("2")) {
						map.get(i).put("THINGS", "잔디");
					}else if(j.equals("3")) {
						map.get(i).put("THINGS", "자갈");
					}else if(j.equals("4")) {
						map.get(i).put("THINGS", "흙");
					}else if(j.equals("5")) {
						map.get(i).put("THINGS", "기타");
					}else {
						map.get(i).put("THINGS", "기타");
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return map;
	}

}
