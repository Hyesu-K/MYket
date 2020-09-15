package model;

import java.util.Date;

public class Board {
	private int no;
	private String id;
	private String category1;
	private String category2;
	private String subject;
	private String content;
	private String author;
	private Date regdate;
	private int readcnt;
	private String datetime;
	private String file1;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	@Override
	public String toString() {
		return "Board [no=" + no + ", id=" + id + ", category1=" + category1 + ", category2=" + category2 + ", subject="
				+ subject + ", content=" + content + ", author=" + author + ", regdate=" + regdate + ", readcnt="
				+ readcnt + ", datetime=" + datetime + ", file1=" + file1 + "]";
	}
}
