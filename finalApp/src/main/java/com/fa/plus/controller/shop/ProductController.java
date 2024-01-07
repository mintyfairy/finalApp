package com.fa.plus.controller.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.domain.shop.ShopProductManage;
import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.shop.Product;
import com.fa.plus.service.shop.ProductService;

@Controller
@RequestMapping("/shop/product/*")
public class ProductController {
	@Autowired
	private ProductService service;
	
	@Autowired
	@Qualifier("myUtil")
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public String main(@RequestParam(defaultValue = "0") long categoryNum,
					   @RequestParam(value = "page", defaultValue = "1") int current_page,
					   HttpServletRequest req,
					   Model model) throws Exception {
		
			String cp = req.getContextPath();
			
			int size = 20;
			int total_page;
			int dataCount;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("categoryNum", categoryNum);
			
			dataCount = service.dataCount(map);
			total_page = myUtil.pageCount(dataCount, size);
			if(current_page > total_page) {
				current_page = total_page;
			}
			
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			List<Product> list = service.listProduct(map);
			
			String listUrl = cp + "/shop/product/list?categoryNum="+categoryNum;
			
			String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
			
			model.addAttribute("list", list);
			model.addAttribute("categoryNum", categoryNum);
			model.addAttribute("page", current_page);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);
			
			// 띄울 파일의 위치
			return ".shop.product.list";
	}
	
	@GetMapping("listAllCategory")
	@ResponseBody
	public Map<String, Object> listAllCategory() {
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<Product> listMain = service.listCategory();
		List<Product> listAll = service.listAllCategory();
		
		model.put("listMain", listMain);
		model.put("listAll", listAll);
		
		return model;
	}
	
	@GetMapping("listCategory")
	@ResponseBody
	public List<Product> listCategory() {
		List<Product> list = service.listCategory();
		return list;
	}
	
	@GetMapping("listSubCategory")
	@ResponseBody
	public List<Product> listSubCategory(@RequestParam long parentNum) {
		List<Product> list = service.listSubCategory(parentNum);
		
		return list;
	}
	
	@GetMapping("listOptionDetail2")
	@ResponseBody
	public List<Product> listOptionDetail2(@RequestParam long optionNum,
				@RequestParam long optionNum2, @RequestParam long detailNum) {
			List<Product> list = service.listOptionDetail(optionNum2);
			return list;
	}
	
	@GetMapping("{product}")
	public String buyRequest(@PathVariable String product,
			Model model) throws Exception {
		
		try {
			long productNum = Long.parseLong(product);
			
			Product dto = service.findById(productNum);
			if(dto == null || dto.getShowSpecial() == 0) {
				return "redirect:/shop/product/list";
			}
			
			List<Product> listFile = service.listProductFile(productNum);
			
			List<Product> listOption = service.listProductOption(productNum);
			
			List<Product> listOptionDetail = null;
			if(listOption.size() > 0) {
				listOptionDetail = service.listOptionDetail(listOption.get(0).getOptionNum());
			}
			dto.setFilename(dto.getThumbnail());
			listFile.add(0, dto);
			
			model.addAttribute("dto", dto);
			model.addAttribute("listOption", listOption);
			model.addAttribute("listOptionDetail", listOptionDetail);
			model.addAttribute("listFile", listFile);
			
		} catch (Exception e) {
			return "redirect:/shop/product/list";
		}
		
		return ".shop.product.detail";
	}
}
