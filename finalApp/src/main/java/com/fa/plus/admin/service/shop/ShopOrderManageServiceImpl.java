package com.fa.plus.admin.service.shop;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.shop.ShopOrderDetailManage;
import com.fa.plus.admin.domain.shop.ShopOrderManage;
import com.fa.plus.admin.mapper.ShopOrderManageMapper;
import com.fa.plus.state.OrderState;

@Service
public class ShopOrderManageServiceImpl implements ShopOrderManageService {
	@Autowired
	private ShopOrderManageMapper mapper;

	@Override
	public List<ShopOrderManage> listOrder(Map<String, Object> map) {
		List<ShopOrderManage> list = null;
		
		try {
			list = mapper.listOrder(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int orderCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = mapper.orderCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public ShopOrderManage findById(long orderNum) {
		ShopOrderManage dto = null;
		
		try {
			dto = mapper.findById(orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<ShopOrderManage> listOrderDetail(Map<String, Object> map) {
		List<ShopOrderManage> list = null;
		
		try {
			list = mapper.listOrderDetail(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

//	@Override
//	public List<ShopOrderDetailManage> findByOrderDetails(long orderNum) {
//		List<ShopOrderManage> list = null;
//		
//		try {
//			list = mapper.findByOrderDetails(orderNum);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return list;
//	}

	@Override
	public int orderDetailCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.orderDetailCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<ShopOrderDetailManage> orderDetails(long orderNum) {
		List<ShopOrderDetailManage> list = null;
		
		try {
			list = mapper.findByOrderDetails(orderNum);
			for(ShopOrderDetailManage dto : list) {
				dto.setDetailStateInfo(OrderState.DETAILSTATEMANAGER[dto.getDetailState()]);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> listDeliveryCompany() {
		List<Map<String, Object>> list = null;
		
		try {
			list = mapper.listDeliveryCompany();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateOrder(String mode, Map<String, Object> map) throws Exception {
		try {
			if (mode.equals("state")) {
				mapper.updateOrderState(map);
			} else if(mode.equals("invoiceNumber")) {
				mapper.updateOrderInvoiceNumber(map);
			} else if(mode.equals("delivery")) {
				mapper.updateOrderState(map);
			} else if(mode.equals("cancelAmout")) {
				mapper.updateCancelAmount(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int selectTotalStock(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.selectTotalStock(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void orderCancel(long orderDetailNum, Map<String, Object> cancelAmountMap, 
			Map<String, Object> updateStockMap, Map<String, Object> updateDetailStateMap) throws Exception {
		try {
//			mapper.updateOrderState(updateStateMap);
			mapper.updateCancelAmount(cancelAmountMap);
			mapper.updateProductStock(updateStockMap);
			mapper.orderDetailCancel(orderDetailNum);
			mapper.updateOrderDetailState(updateDetailStateMap);
			
			// 주문 정보의 모든 주문 내역이 취소이면 주문정보의 상태는 판매 취소로 변경
			Map<String, Object> map = new HashMap<String, Object>();
			long orderNum = Long.parseLong(String.valueOf(cancelAmountMap.get("orderNum")));
			int totalOrderCount = mapper.totalOrderCount(orderNum);
			if(totalOrderCount == 0) {
				map.put("orderNum", orderNum);
				map.put("orderState", 6);
				mapper.updateOrderState(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Map<String, Object>> listDetailStateInfo(long orderDetailNum) {
		List<Map<String, Object>> list = null;
		
		try {
			list = mapper.listDetailStateInfo(orderDetailNum);
			
			String detailStateInfo;
			for(Map<String, Object> map : list) {
				int detailState = ((BigDecimal) map.get("DETAILSTATE")).intValue();
				detailStateInfo = OrderState.DETAILSTATEMANAGER[detailState];
				map.put("DETAILSTATEINFO", detailStateInfo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateOrderDetailState(Map<String, Object> map) throws Exception {
		try {
			long orderNum = Long.parseLong((String)map.get("orderNum"));
			int detailState = Integer.parseInt((String)map.get("detailState"));
			int productMoney = Integer.parseInt((String)map.get("productMoney"));
			
			// 주문에 대한 전체 취소 금액 가져오기
			int cancelAmount = 0;
			if(detailState == 3 || detailState == 5 || detailState == 12) {
				cancelAmount = Integer.parseInt((String)map.get("cancelAmount"));
			}
			
			// orderDetail 테이블 상태 변경
			mapper.updateOrderDetailState(map);
			
			// detailStateInfo 테이블에 상태 내용 및 날짜 저장
			mapper.insertDetailStateInfo(map);
			
			if(detailState == 3 || detailState == 5 || detailState == 12) {
				cancelAmount += productMoney;
				map.put("cancelAmount", cancelAmount);
				
				mapper.updateCancelAmount(map);
				
				// 주문 정보의 모든 주문 내역이 취소이면 주문정보의 상태는 판매 취소로 변경
				int totalOrderCount = mapper.totalOrderCount(orderNum);
				if(totalOrderCount == 0) {
					map.put("orderState", 6);
					mapper.updateOrderState(map);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
