package com.fa.plus.admin.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.domain.shop.ShopProductManage;
import com.fa.plus.admin.service.shop.ShopProductManageService;
import com.fa.plus.common.MyUtil;

@Controller
@RequestMapping("/admin/shopProduct/*")
public class ShopProductController {
	@Autowired
	private ShopProductManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("main")
	public String list(@RequestParam(defaultValue = "0") int special, 
			@RequestParam(defaultValue = "0") int md, 
			@RequestParam(defaultValue = "0") int starter, 
			@RequestParam(defaultValue = "0") long parentNum, 
			@RequestParam(defaultValue = "0") long categoryNum, 
			@RequestParam(defaultValue = "0") long brandNum, 
			@RequestParam(defaultValue = "1") int productShow, 
			@RequestParam(defaultValue = "1") int tab, 
			@RequestParam(defaultValue = "all") String schType, 
			@RequestParam(defaultValue = "") String kwd, 
			@RequestParam(value = "page", defaultValue = "1") int current_page, 
			HttpServletRequest req, 
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page;
		int dataCount;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "UTF-8");
		}
		
		List<ShopProductManage> listCategory = service.listCategory();
		List<ShopProductManage> listSubCategory = null;
		if(parentNum == 0 && listCategory.size() != 0) {
			parentNum = listCategory.get(0).getCategoryNum();
		}
		listSubCategory = service.listSubCategory(parentNum);
		
		List<ShopProductManage> listBrand = service.listBrand();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("special", special);
		map.put("parentNum", parentNum);
		map.put("md", md);
		map.put("starter", starter);
		map.put("productShow", productShow);
		map.put("categoryNum", categoryNum);
		map.put("brandNum", brandNum);
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset  = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<ShopProductManage> list = service.listProduct(map);
		
		String listUrl = cp + "/admin/shopProduct/main";
		String articleUrl = cp + "/admin/shopProduct/article?page=" + current_page;
		
		String query = "parentNum=" + parentNum + "&categoryNum="+categoryNum;
		if (special != 0) {
			query = "&special=" + special;
		}
		if(brandNum != 0) {
			query = "&brandNum=" + brandNum;
		}
		if(md != 0) {
			query = "&md=" + md;
		}
		if(starter != 0) {
			query = "&starter" + starter;
		}
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		listUrl += "?" + query;
		articleUrl += "&" + query;
		
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listSubCategory", listSubCategory);
		model.addAttribute("listBrand", listBrand);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("special", special);
		model.addAttribute("productShow", productShow);
		model.addAttribute("parentNum", parentNum);
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("brandNum", brandNum);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("tab", tab);
		
		model.addAttribute("articleUrl", articleUrl);
		
		model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".admin.shopProduct.main";
	}

	@GetMapping("listSubCategory")
	@ResponseBody
	public Map<String, Object> listSubCategory(
			@RequestParam long parentNum) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<ShopProductManage> listSubCategory = service.listSubCategory(parentNum);
		
		model.put("listSubCategory", listSubCategory);
		
		return model;
	}
	
	@GetMapping("listBrand")
	@ResponseBody
	public Map<String, Object> listBrand() throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<ShopProductManage> listBrand = service.listBrand();
		
		model.put("listBrand", listBrand);
		
		return model;
	}
	
	@GetMapping("write")
	public String writeForm(
			@RequestParam(defaultValue = "0") int special, 
			@RequestParam(defaultValue = "0") long parentNum, 
			Model model) {
		List<ShopProductManage> listCategory = service.listCategory();
		List<ShopProductManage> listSubCategory = null;
		List<ShopProductManage> listBrand = service.listBrand();
		if(listCategory.size() !=0 ) {
			parentNum = listCategory.get(0).getCategoryNum();
		}
		listSubCategory = service.listSubCategory(parentNum);
		
		
		model.addAttribute("mode", "write");
		model.addAttribute("special", special);
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listSubCategory", listSubCategory);
		model.addAttribute("listBrand", listBrand);
		
		return ".admin.shopProduct.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(
			ShopProductManage dto, 
			HttpSession session, 
			Model model) {
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "shop";
		
		try {
			service.insertProduct(dto, path);
		} catch (Exception e) {
		}
		
		String url = "redirect:/admin/shopProduct/main?parentNum=" + dto.getParentNum()
						+ "&categoryNum=" + dto.getCategoryNum() + "&brandNum=" + dto.getBrandNum();
		
		return url;
	}
	
	@GetMapping("update/{productNum}")
	public String updateForm(
			@PathVariable long productNum, 
			@RequestParam(defaultValue = "0") long parentNum, 
			@RequestParam String page, 
			Model model) {
		
		ShopProductManage dto = service.findById(productNum);
		
		if(dto == null) {
			return "redirect:/admin/shopProduct/main";
		}
		
		// 카테고리
		List<ShopProductManage> listCategory = service.listCategory();
		List<ShopProductManage> listSubCategory = service.listSubCategory(parentNum);
		List<ShopProductManage> listBrand = service.listBrand();
		
		// 추가 이미지
		List<ShopProductManage> listFile = service.listProductFile(productNum);
		// 상위/하위 옵션명
		List<ShopProductManage> listOption = service.listProductOption(productNum);
		// 상위/하위 상세 옵션
		List<ShopProductManage> listOptionDetail = null;
		List<ShopProductManage> listOptionDetail2 = null;
		if(listOption.size() > 0) {
			dto.setOptionNum(listOption.get(0).getOptionNum());
			dto.setOptionName(listOption.get(0).getOptionName());
			listOptionDetail = service.listOptionDetail(listOption.get(0).getOptionNum());
		}
		if(listOption.size() > 1) {
			dto.setOptionNum2(listOption.get(1).getOptionNum());
			dto.setOptionName2(listOption.get(1).getOptionName());
			listOptionDetail2 = service.listOptionDetail(listOption.get(1).getOptionNum());
		}
		
		model.addAttribute("mode", "update");
		
		model.addAttribute("dto", dto);
		
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listSubCategory", listSubCategory);
		model.addAttribute("listBrand", listBrand);
		model.addAttribute("listFile", listFile);
		model.addAttribute("listOptionDetail", listOptionDetail);
		model.addAttribute("listOptionDetail2", listOptionDetail2);
		
		return ".admin.shopProduct.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(
			ShopProductManage dto, 
			@RequestParam String page, 
			HttpSession session, 
			Model model) {
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "shop";
		
		try {
			service.updateProduct(dto, path);
		} catch (Exception e) {
		}
		
		//String query;
		
//		if(dto.getSpecial() == 1) {
//			query = "special=" + dto.getSpecial();
//		} else if(dto.getMd() == 1) {
//			query = "md=" + dto.getMd();
//		} else if(dto.getStarter() == 1) {
//			query = "starter=" + dto.getStarter();
//		} else {
//			query = "parentNum=" + dto.getParentNum() + "&categoryNum=" + dto.getCategoryNum() + "&brandNum=" + dto.getBrandNum() + "&page=" + page;
//		}
		
		return "redirect:/admin/shopProduct/main";
	}
	
	@GetMapping("article")
	@ResponseBody
	public ShopProductManage article(@RequestParam long productNum) throws Exception {
		ShopProductManage dto = service.findById(productNum);
		
		try {
			List<ShopProductManage> listProductFile = service.listProductFile(productNum);
			List<ShopProductManage> listOption = service.listProductOption(productNum);
			List<ShopProductManage> listOptionDetail = null;
			if(listOption.size() > 0) {
				if(listOption.size() == 1) {
					listOptionDetail = service.listOptionDetail(listOption.get(0).getOptionNum());
					System.out.println(listOption);
					dto.setOptionNum(listOption.get(0).getOptionNum());
					dto.setOptionName(listOption.get(0).getOptionName());
					List<Long> detailNums = new ArrayList<Long>();
					List<String> detailValues = new ArrayList<String>();
					for(ShopProductManage item : listOptionDetail) {
						detailNums.add(item.getDetailNum());
						detailValues.add(item.getOptionValue());
						dto.setDetailNums(detailNums);
						dto.setOptionValues(detailValues);
					}
				} else if(listOption.size() == 2) {
					// 옵션1
					listOptionDetail = service.listOptionDetail(listOption.get(0).getOptionNum());
					System.out.println(listOption);
					dto.setOptionNum(listOption.get(0).getOptionNum());
					dto.setOptionName(listOption.get(0).getOptionName());
					List<Long> detailNums = new ArrayList<Long>();
					List<String> detailValues = new ArrayList<String>();
					for(ShopProductManage item : listOptionDetail) {
						detailNums.add(item.getDetailNum());
						detailValues.add(item.getOptionValue());
						System.out.println(item.getOptionValue()+"@@@@");
					}
					dto.setDetailNums(detailNums);
					System.out.println(detailValues.toString());
					dto.setOptionValues(detailValues);
					
					// 옵션2
					listOptionDetail = service.listOptionDetail(listOption.get(1).getOptionNum());
					dto.setOptionNum2(listOption.get(1).getOptionNum());
					dto.setOptionName2(listOption.get(1).getOptionName());
					System.out.println(listOption);
					detailNums = new ArrayList<Long>();
					detailValues = new ArrayList<String>();
					for(ShopProductManage item : listOptionDetail) {
						detailNums.add(item.getDetailNum());
						detailValues.add(item.getOptionValue());
					}
					dto.setDetailNums2(detailNums);
					dto.setOptionValues2(detailValues);
				}
			}
			dto.setFilename(dto.getThumbnail());
			listProductFile.add(0, dto);	

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@GetMapping("stock")
	@ResponseBody
	public List<ShopProductManage> listStock(@RequestParam long productNum) throws Exception {
		
		List<ShopProductManage> listStock = service.listProductStock(productNum);
		System.out.println(listStock);
		
		return listStock;
	}
	
	@PostMapping("stock")
	@ResponseBody
	public ShopProductManage updateStock(
			@RequestParam long stockNum, 
			@RequestParam int totalStock) throws Exception {
		
		ShopProductManage dto = new ShopProductManage();
		
		dto.setStockNum(stockNum);
		dto.setTotalStock(totalStock);
		
		try {
			service.updateProductStock(dto);
			totalStock = service.findTotalStock(stockNum);
			dto.setTotalStock(totalStock);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return dto;
	}
	
	@GetMapping("hide")
	@ResponseBody
	public Map<String, Object> hideForm(@RequestParam long productNum
			) throws Exception {
		
		ShopProductManage dto = service.findById(productNum);
		
		String productName = dto.getProductName();
		int productShow = dto.getProductShow();		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("productNum", productNum);
		map.put("productName", productName);
		map.put("productShow", productShow);
		
		return map;
	}
	
	@PostMapping("hide")
	@ResponseBody
	public String hideSubmit(@RequestParam long productNum, 
			@RequestParam int productShow) throws Exception {
		
		if(productShow == 0) {
			productShow = 1;
		} else {
			productShow = 0;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("productNum", productNum);
		map.put("productShow", productShow);
		
		service.updateHide(map);
		
		String url = "/admin/shopProduct/main";
		String query = "?productShow=" + productShow;
		
		url += query;
		
		return url;
	}
	
	@PostMapping("deleteFile")
	@ResponseBody
	public Map<String, Object> deleteFile(@RequestParam long fileNum, 
			@RequestParam String filename,
			HttpSession session) throws Exception {

		String state = "true";
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "shop" + File.separator + filename;

			service.deleteProductFile(fileNum, pathname);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@PostMapping("deleteOptionDetail1")
	@ResponseBody
	public Map<String, Object> deleteOptionDetail1(@RequestParam long detailNum) throws Exception {
		
		String state = "true";
		try {
			service.deleteProductStock1(detailNum);
			service.deleteOptionDetail(detailNum);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@PostMapping("deleteOptionDetail2")
	@ResponseBody
	public Map<String, Object> deleteOptionDetail2(@RequestParam long detailNum) throws Exception {
		
		String state = "true";
		try {
			service.deleteProductStock2(detailNum);
			service.deleteOptionDetail(detailNum);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	
}
