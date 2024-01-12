package com.fa.plus.admin.controller;  

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.admin.domain.CsNoticeManage;
import com.fa.plus.admin.service.CsNoticeService;
import com.fa.plus.common.FileManager;
import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;


@Controller
@RequestMapping("/admin/cs/notice/*")
public class CsNoticeController {
	@Autowired
	private CsNoticeService service;

	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;

	@Autowired
	private FileManager fileManager;

	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req, Model model) throws Exception {

		int size = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}

		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if (total_page < current_page) {
			current_page = total_page;
		}

		// 1페이지인 경우 공지리스트 가져오기
		List<CsNoticeManage> noticeList = null;
		if (current_page == 1) {
			noticeList = service.listNoticeTop();
		}

		// 리스트에 출력할 데이터를 가져오기
		int offset = (current_page - 1) * size;
		if (offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		// 글 리스트
		List<CsNoticeManage> list = service.listNotice(map);

		Date endDate = new Date();
		long gap;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (CsNoticeManage dto : list) {
			Date beginDate = formatter.parse(dto.getReg_date());
			// 날짜차이(시간)
			gap = (endDate.getTime() - beginDate.getTime()) / (60 * 60 * 1000);
			dto.setGap(gap);

			dto.setReg_date(dto.getReg_date().substring(0, 10));
		}

		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/admin/cs/notice/list";
		String articleUrl = cp + "/admin/cs/notice/article?page=" + current_page;
		if (kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");

			listUrl += "?" + query;
			articleUrl += "&" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("noticeList", noticeList);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);

		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);

		return ".admin.cs.csNoticeManage.list";

	}

	@GetMapping("write")
	public String writeForm(Model model) throws Exception {
		model.addAttribute("mode", "write");

		return ".admin.cs.csNoticeManage.write";

	}

	@PostMapping("write")
	public String writeSubmit(CsNoticeManage dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "notice";

			dto.setUserId(info.getUserId());
			service.insertNotice(dto, pathname);
		} catch (Exception e) {

		}
		return "redirect:/admin/cs/notice/list";
	}

	@GetMapping("article")
	public String article(@RequestParam long num, 
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType, 
			@RequestParam(defaultValue = "") String kwd,
			Model model) throws Exception {

		kwd = URLDecoder.decode(kwd, "utf-8");

		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}

		service.updateHitCount(num);

		CsNoticeManage dto = service.findById(num);
		if (dto == null) {
			return "redirect:/admin/cs/notice/list?"+query;
		}

		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("num", num);

		CsNoticeManage prevDto = service.findByPrev(map);
		CsNoticeManage nextDto = service.findByNext(map);
		
		List<CsNoticeManage> listFile = service.listNoticeFile(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		return ".admin.cs.csNoticeManage.article";

	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam long num,
			@RequestParam String page,
			HttpSession session,
			Model model)throws Exception{
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		CsNoticeManage dto = service.findById(num);		
		if(dto == null || ! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/admin/cs/notice/list?page=" + page;
		}
		List<CsNoticeManage> listFile = service.listNoticeFile(num);
		
		model.addAttribute("mode","update");
		model.addAttribute("page",page);
		model.addAttribute("dto",dto);
		model.addAttribute("listFile",listFile);
		

		return ".admin.cs.csNoticeManage.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(CsNoticeManage dto,
			@RequestParam String page,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "notice";

			dto.setUserId(info.getUserId());
			service.updateNotice(dto, pathname);
		} catch (Exception e) {
		} 

		return "redirect:/admin/cs/notice/list?page=" + page;
	}

	
	@GetMapping("download")
	public void download(@RequestParam long fileNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";

		boolean b = false;

		CsNoticeManage dto = service.findByFileId(fileNum);
		if (dto != null) {
			String saveFilename = dto.getSaveFilename();
			String originalFilename = dto.getOriginalFilename();

			b = fileManager.doFileDownload(saveFilename, originalFilename, pathname, resp);
		}

		if (! b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능 합니다 !!!');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}
}



