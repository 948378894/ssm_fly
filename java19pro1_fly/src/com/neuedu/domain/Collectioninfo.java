package com.neuedu.domain;
import java.util.*;



public class Collectioninfo {

  private int id;
  private int userid;
  private int articleid;
  private Date colltime;


  public int getId() {
    return id;
  }
  public void setId(int id){
    this.id = id;
  }
  public int getUserid() {
    return userid;
  }
  public void setUserid(int userid){
    this.userid = userid;
  }
  public int getArticleid() {
    return articleid;
  }
  public void setArticleid(int articleid){
    this.articleid = articleid;
  }
  public Date getColltime() {
    return colltime;
  }
  public void setColltime(Date colltime){
    this.colltime = colltime;
  }
}
