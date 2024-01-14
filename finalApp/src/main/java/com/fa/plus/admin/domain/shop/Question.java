package com.fa.plus.admin.domain.shop;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Question {
	private long qnaNum;
	private long productNum;
	private long memberIdx;
	private String userName;
	private int secret;
	private String question;
	private String answer;
	private String answerId;
	private String answerName;
	private String questionDate;
	private String answerDate;
	private int showQuestion;
	
	private long fileNum;
	private String filename;
	private List<MultipartFile> selectFile;

	private String[] listFilename;
	
	private String productName;

	public long getQnaNum() {
		return qnaNum;
	}

	public void setQnaNum(long qnaNum) {
		this.qnaNum = qnaNum;
	}

	public long getProductNum() {
		return productNum;
	}

	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}

	public long getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getSecret() {
		return secret;
	}

	public void setSecret(int secret) {
		this.secret = secret;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getAnswerId() {
		return answerId;
	}

	public void setAnswerId(String answerId) {
		this.answerId = answerId;
	}

	public String getAnswerName() {
		return answerName;
	}

	public void setAnswerName(String answerName) {
		this.answerName = answerName;
	}

	public String getQuestionDate() {
		return questionDate;
	}

	public void setQuestionDate(String questionDate) {
		this.questionDate = questionDate;
	}

	public String getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}

	public int getShowQuestion() {
		return showQuestion;
	}

	public void setShowQuestion(int showQuestion) {
		this.showQuestion = showQuestion;
	}

	public long getFileNum() {
		return fileNum;
	}

	public void setFileNum(long fileNum) {
		this.fileNum = fileNum;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}

	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}

	public String[] getListFilename() {
		return listFilename;
	}

	public void setListFilename(String[] listFilename) {
		this.listFilename = listFilename;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
}
