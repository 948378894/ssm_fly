package com.neuedu.domain;

import java.util.*;



public class Articleinfo {

  private int id;
  private String title;
  private int authorid;
  private Date releasetime;
  private int typeid;
  private int visitnum;
  private int commentnum;
  private int cream;
  private int stick;
  private int isdone;
  private int paykiss;
  private String artcontent;
  private String markdown_content;
  private String html_content;
  private int exsits;


  public int getExsits() {
	return exsits;
}
public void setExsits(int exsits) {
	this.exsits = exsits;
}
public String getMarkdown_content() {
	return markdown_content;
}
public void setMarkdown_content(String markdown_content) {
	this.markdown_content = markdown_content;
}
public String getHtml_content() {
	return html_content;
}
public void setHtml_content(String html_content) {
	this.html_content = html_content;
}
public int getId() {
    return id;
  }
  public void setId(int id){
    this.id = id;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title){
    this.title = title;
  }
  public int getAuthorid() {
    return authorid;
  }
  public void setAuthorid(int authorid){
    this.authorid = authorid;
  }
  public Date getReleasetime() {
    return releasetime;
  }
  public void setReleasetime(Date releasetime){
    this.releasetime = releasetime;
  }
  public int getTypeid() {
    return typeid;
  }
  public void setTypeid(int typeid){
    this.typeid = typeid;
  }
  public int getVisitnum() {
    return visitnum;
  }
  public void setVisitnum(int visitnum){
    this.visitnum = visitnum;
  }
  public int getCommentnum() {
    return commentnum;
  }
  public void setCommentnum(int commentnum){
    this.commentnum = commentnum;
  }
  public int getCream() {
    return cream;
  }
  public void setCream(int cream){
    this.cream = cream;
  }
  public int getStick() {
    return stick;
  }
  public void setStick(int stick){
    this.stick = stick;
  }
  public int getIsdone() {
    return isdone;
  }
  public void setIsdone(int isdone){
    this.isdone = isdone;
  }
  public int getPaykiss() {
    return paykiss;
  }
  public void setPaykiss(int paykiss){
    this.paykiss = paykiss;
  }
  public String getArtcontent() {
    return artcontent;
  }
  public void setArtcontent(String artcontent){
    this.artcontent = artcontent;
  }
}
