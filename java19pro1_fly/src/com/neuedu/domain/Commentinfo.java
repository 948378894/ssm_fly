package com.neuedu.domain;
import java.util.*;



public class Commentinfo {

  private int id;
  private int authorid;
  private Date commtime;
  private String commcontent;
  private int artidorcommid;
  private int commtype;
  private int praisepoints;
  private int isaccept;


  public int getId() {
    return id;
  }
  public void setId(int id){
    this.id = id;
  }
  public int getAuthorid() {
    return authorid;
  }
  public void setAuthorid(int authorid){
    this.authorid = authorid;
  }
  public Date getCommtime() {
    return commtime;
  }
  public void setCommtime(Date commtime){
    this.commtime = commtime;
  }
  public String getCommcontent() {
    return commcontent;
  }
  public void setCommcontent(String commcontent){
    this.commcontent = commcontent;
  }
  public int getArtidorcommid() {
    return artidorcommid;
  }
  public void setArtidorcommid(int artidorcommid){
    this.artidorcommid = artidorcommid;
  }
  public int getCommtype() {
    return commtype;
  }
  public void setCommtype(int commtype){
    this.commtype = commtype;
  }
  public int getPraisepoints() {
    return praisepoints;
  }
  public void setPraisepoints(int praisepoints){
    this.praisepoints = praisepoints;
  }
  public int getIsaccept() {
    return isaccept;
  }
  public void setIsaccept(int isaccept){
    this.isaccept = isaccept;
  }
}
