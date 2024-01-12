package com.fa.plus.admin.service.shop;

import java.util.List;
import java.util.Map;

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
			mapper.selectTotalStock(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void orderCancel(long orderDetailNum, Map<String, Object> updateStateMap,
			Map<String, Object> cancelAmountMap, Map<String, Object> updateStockMap) throws Exception {
		try {
			mapper.updateOrderState(updateStateMap);
			mapper.updateCancelAmount(cancelAmountMap);
			mapper.updateProductStock(updateStockMap);
			mapper.orderDetailCancel(orderDetailNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}


}
