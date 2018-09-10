package com.board.web.vo;


import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;


public class CommentVO {
	private int comment_num ;
	private String name;
	private String password;
	private String content;
	private int comment_count;
	private int ref;
	private int step;
	private int depth;
	private int rn;
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	private int rnum;
	private int rank;
	private String del;
	
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	private Date comment_date;
	private int num;
	
	
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	@Override
	public String toString() {
		return "CommentVO [comment_num=" + comment_num + ", name=" + name + ", password=" + password + ", content="
				+ content + ", comment_count=" + comment_count + ", ref=" + ref + ", step=" + step + ", depth=" + depth
				+ ", rn=" + rn + ", rnum=" + rnum + ", rank=" + rank + ", del=" + del + ", comment_date=" + comment_date
				+ ", num=" + num + ", getDel()=" + getDel() + ", getRn()=" + getRn() + ", getRnum()=" + getRnum()
				+ ", getRank()=" + getRank() + ", getRef()=" + getRef() + ", getStep()=" + getStep() + ", getDepth()="
				+ getDepth() + ", getNum()=" + getNum() + ", getPassword()=" + getPassword() + ", getComment_count()="
				+ getComment_count() + ", getComment_num()=" + getComment_num() + ", getName()=" + getName()
				+ ", getContent()=" + getContent() + ", getComment_date()=" + getComment_date() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
