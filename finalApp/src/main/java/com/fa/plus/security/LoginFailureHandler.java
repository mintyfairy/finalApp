package com.fa.plus.security;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.fa.plus.domain.Member;
import com.fa.plus.service.MemberService;


public class LoginFailureHandler implements AuthenticationFailureHandler {


	@Autowired
	private MemberService service;	
	
	private String defaultFailureUrl;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
	
		String userId=request.getParameter("userId");
		
		String errorMsg="아이디 또는 패스워드가 일치하지않습니다.";
		
		try {
			
			if(exception instanceof BadCredentialsException) {
				//패스워드가 일치하지않는 경우
				
				//패스워드 실패 횟수 누적
				service.updateFailureCount(userId);
				
				//패스워드 실패횟수
				int cnt=service.checkFailureCount(userId);
				if(cnt>=5) {
					//계정 비활성화
					Map<String, Object> map=new HashMap<String, Object>();
					map.put("enabled",0);
					map.put("userId", userId);
					service.updateMemberEnabled(map);
					
					//비활성화상태저장
					Member dto= new Member();
					dto.setUserId(userId);
					dto.setRegisterId(userId);
					dto.setStateCode(1);
					dto.setMemo("패스워드 5회이상 실패");
					service.insertMemberState(dto);
					
				}
				
			}else if(exception instanceof InternalAuthenticationServiceException) {
				//존재하지않는 아이디
				
			}else if(exception instanceof DisabledException) {
				//인증거부-계정비활성화(enabled=0)
				errorMsg="계정이 비활성화 되었습니다. 관리자에게 문의하세요";
			}
				
				
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		request.setAttribute("message", errorMsg);
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
		
		
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}


}
