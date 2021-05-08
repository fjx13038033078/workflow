package cn.edu.ustb.entity;

import java.util.Date;

public class Record {

	private Integer rid;
	private Date time;
	private Integer wid;
	private String wfType;
	private Integer uid;
	private Double value;
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Integer getWid() {
		return wid;
	}
	public void setWid(Integer wid) {
		this.wid = wid;
	}
	public String getWfType() {
		return wfType;
	}
	public void setWfType(String wfType) {
		this.wfType = wfType;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Double getValue() {
		return value;
	}
	public void setValue(Double value) {
		this.value = value;
	}
	
	
}
