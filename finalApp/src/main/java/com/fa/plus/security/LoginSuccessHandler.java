package com.fa.plus.security;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.fa.plus.domain.Member;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.MemberService;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	private RequestCache requestCache=new HttpSessionRequestCache();//시큐리티에 들어올 당시의 모든정보를 기억하는 놈.
	private RedirectStrategy redirectStrategy =new DefaultRedirectStrategy();
	private String defaultUrl;

	@Autowired
	private MemberService memberservice;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		HttpSession session=request.getSession();
		
		try {

			//로그인 날짜 변경
			memberservice.updateLastLogin(authentication.getName());
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		// 로그인정보 세션에 저장
		Member member=memberservice.findById(authentication.getName());
		System.out.println(member+"@@@");
		System.out.println(member.getAuthority()+"@@@");
		SessionInfo info= new SessionInfo();
		info.setmemberIdx(member.getmemberIdx());
		info.setMembership(member.getMembership());
		info.setUserId(member.getUserId());
		info.setUserName(member.getUserName());
		info.setAuthority(member.getAuthority());
		
		session.setAttribute("member", info);
		
		//패스워드변경이 90일 이상인경우 비번바꾸기창으로 이동
		try {
			Date endDate=new Date();
			long gap;
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date modifyDate=sdf.parse(member.getModify_date());
			gap=(endDate.getTime()-modifyDate.getTime())/(60*60*1000*24);
			//90이상시
			if(gap>=90) {
				
				String targetUrl="/member/updatePwd";
				redirectStrategy.sendRedirect(request, response, targetUrl);
				return;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		//리다이렉트 설정
		resultRedirectStrategy(request, response, authentication);
		
		
	}
	
	protected void resultRedirectStrategy(
			HttpServletRequest request
			,HttpServletResponse response
			,Authentication authentication
			) throws IOException,ServletException{
		
		SavedRequest savedRequest=requestCache.getRequest(request, response);//requestCache 의 정보 꺼내는 집게
		
		if(savedRequest!=null) {
			//권한이 필요한 페이지에 접근하여 로그인 된 경우
			String targetUrl=savedRequest.getRedirectUrl();
			redirectStrategy.sendRedirect(request, response, targetUrl);
		}else {
			//직접 로그인 페이지로 이동하여 로그인된 경우
			redirectStrategy.sendRedirect(request, response, defaultUrl);
			
		}
			
		
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}

}
