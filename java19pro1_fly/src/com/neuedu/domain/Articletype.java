package com.neuedu.domain;
import java.util.*;



public class Articletype {

  private int id;
  private String typename;
  private int power;

  public int getId() {
    return id;
  }
  public int getPower() {
	return power;
}
public void setPower(int power) {
	this.power = power;
}
public void setId(int id){
    this.id = id;
  }
  public String getTypename() {
    return typename;
  }
  public void setTypename(String typename){
    this.typename = typename;
  }
}
