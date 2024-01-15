package com.fa.plus.domain.shop;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class QnA {
	private long qnaNum;
	private long productNum;
	private long questionIdx;
	private String question;
	private int secret;
	private String title;
	private String content;
	private String userId;
	private String userName;
	private String reg_date;

	private String answer;
	private String answerIdx;
	private String answerName;
	private String answerDate;
	private String questionDate;
	private int showQuestion;
	
	private long fileNum;
	private String filename;
	private List<MultipartFile> selectFile;

	private String[] listFilename;
	
	private String productName;

	private String lectureCode;
	private String category;
	private String lectureSubCode;
	private String subject;
	
	
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
		this.secret = secret;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getAnswerName() {
		return answerName;
	}
	public void setAnswerName(String answerName) {
		this.answerName = answerName;
	}
	public String getAnswer_date() {
		return answerDate;
	}
	public void setAnswer_date(String answerDate) {
		this.answerDate = answerDate;
	}
	public String getLectureCode() {
		return lectureCode;
	}
	public void setLectureCode(String lectureCode) {
		this.lectureCode = lectureCode;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getLectureSubCode() {
		return lectureSubCode;
	}
	public void setLectureSubCode(String lectureSubCode) {
		this.lectureSubCode = lectureSubCode;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public long getProductNum() {
		return productNum;
	}
	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}
	
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getQuestionDate() {
		return questionDate;
	}
	public void setQuestionDate(String questionDate) {
		this.questionDate = questionDate;
	}
	public int getShowQuestion() {
		return showQuestion;
	}
	public void setShowQuestion(int showQuestion) {
		this.showQuestion = showQuestion;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public long getFileNum() {
		return fileNum;
	}
	public void setFileNum(long fileNum) {
		this.fileNum = fileNum;
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
	public long getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(long qnaNum) {
		this.qnaNum = qnaNum;
	}
	public long getQuestionIdx() {
		return questionIdx;
	}
	public void setQuestionIdx(long questionIdx) {
		this.questionIdx = questionIdx;
	}
	public String getAnswerIdx() {
		return answerIdx;
	}
	public void setAnswerIdx(String answerIdx) {
		this.answerIdx = answerIdx;
	}

}
