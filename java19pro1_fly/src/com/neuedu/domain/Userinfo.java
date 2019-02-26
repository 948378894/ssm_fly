package com.neuedu.domain;
import java.util.*;



public class Userinfo {
  private int id;
  private String email;
  private String nickname;
  private String password;
  private String head;
  private String city;
  private String sex;
  private String sign;
  private int kissnum;
  private Date regtime;
  private int authority;
  private int experience;
  private String oldemail;
  private int active;
  private String activecode;


  public int getActive() {
	return active;
}
public void setActive(int active) {
	this.active = active;
}
public String getActivecode() {
	return activecode;
}
public void setActivecode(String activecode) {
	this.activecode = activecode;
}
public String getOldemail() {
	return oldemail;
}
public void setOldemail(String oldemail) {
	this.oldemail = oldemail;
}
public int getId() {
    return id;
  }
  public void setId(int id){
    this.id = id;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email){
    this.email = email;
  }
  public String getNickname() {
    return nickname;
  }
  public void setNickname(String nickname){
    this.nickname = nickname;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password){
    this.password = password;
  }
  public String getHead() {
    return head;
  }
  public void setHead(String head){
    this.head = head;
  }
  public String getCity() {
    return city;
  }
  public void setCity(String city){
    this.city = city;
  }
  public String getSex() {
    return sex;
  }
  public void setSex(String sex){
    this.sex = sex;
  }
  public String getSign() {
    return sign;
  }
  public void setSign(String sign){
    this.sign = sign;
  }
  public int getKissnum() {
    return kissnum;
  }
  public void setKissnum(int kissnum){
    this.kissnum = kissnum;
  }
  public Date getRegtime() {
    return regtime;
  }
  public void setRegtime(Date regtime){
    this.regtime = regtime;
  }
  public int getAuthority() {
    return authority;
  }
  public void setAuthority(int authority){
    this.authority = authority;
  }
  public int getExperience() {
    return experience;
  }
  public void setExperience(int experience){
    this.experience = experience;
  }
}
