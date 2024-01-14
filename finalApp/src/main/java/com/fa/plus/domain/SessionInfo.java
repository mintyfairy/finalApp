package com.fa.plus.domain;

// 세션에 저장할 정보
public class SessionInfo {
	private long memberIdx;
	private String userId;
	private String userName;
	private int membership;

	private String authority;
	
	
	
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public long getmemberIdx() {
		return memberIdx;
	}
	public void setmemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getMembership() {
		return membership;
	}
	public void setMembership(int membership) {
		this.membership = membership;
	}
}
