package com.board.web.vo;

import java.util.Date;

public class BoardVO {
	private int num;
	private String name;
	private String password;
	private String title;
	private String content;
	private int read_count;
	private Date write_date;
	private String keyword;
	private String search_option;
	private int rn;
	private int rnum;
	private int rank;
	private int comment_count;
	private int comment_num;
	private int ref;
	private int step;
	private int depth;
	private String show;
	private int del;
	private int realnum;
	
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearch_option() {
		return search_option;
	}
	public void setSearch_option(String search_option) {
		this.search_option = search_option;
	}
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
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public int getRealnum() {
		return realnum;
	}
	public void setRealnum(int realnum) {
		this.realnum = realnum;
	}
	@Override
	public String toString() {
		return "BoardVO [num=" + num + ", name=" + name + ", password=" + password + ", title=" + title + ", content="
				+ content + ", read_count=" + read_count + ", write_date=" + write_date + ", keyword=" + keyword
				+ ", search_option=" + search_option + ", rn=" + rn + ", rnum=" + rnum + ", rank=" + rank
				+ ", comment_count=" + comment_count + ", comment_num=" + comment_num + ", ref=" + ref + ", step="
				+ step + ", depth=" + depth + ", show=" + show + ", del=" + del + ", realnum=" + realnum + "]";
	}

}
