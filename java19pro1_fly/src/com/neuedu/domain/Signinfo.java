package com.neuedu.domain;

import java.util.Date;

public class Signinfo {
	private int id;
	private int signid;
	private Date signtime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSignid() {
		return signid;
	}
	public void setSignid(int signid) {
		this.signid = signid;
	}
	public Date getSigntime() {
		return signtime;
	}
	public void setSigntime(Date signtime) {
		this.signtime = signtime;
	}
}
