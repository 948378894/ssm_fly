package com.neuedu.domain;

import java.util.Date;

public class Messageinfo {
	private int id;
	private int commid;
	private int articleid;
	private int writerid;
	private int empty;
	private Date replytime;
	public Date getReplytime() {
		return replytime;
	}
	public void setReplytime(Date replytime) {
		this.replytime = replytime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCommid() {
		return commid;
	}
	public void setCommid(int commid) {
		this.commid = commid;
	}
	public int getArticleid() {
		return articleid;
	}
	public void setArticleid(int articleid) {
		this.articleid = articleid;
	}
	public int getWriterid() {
		return writerid;
	}
	public void setWriterid(int writerid) {
		this.writerid = writerid;
	}
	public int getEmpty() {
		return empty;
	}
	public void setEmpty(int empty) {
		this.empty = empty;
	}
}
