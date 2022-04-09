package com.mwt_wjd.models;

import java.sql.Date;

public class Appointement {
	private long id;
	private String appointementTime;
	private long estateId;
	private String buyerName;
	private String buyerMobile;
	private int status;
	public Appointement(long id, String appointementTime, long estateId, String buyerName, String buyerMobile,
			int status) {
		super();
		this.id = id;
		this.appointementTime = appointementTime;
		this.estateId = estateId;
		this.buyerName = buyerName;
		this.buyerMobile = buyerMobile;
		this.status = status;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getAppointementTime() {
		return appointementTime;
	}
	public void setAppointementTime(String appointementTime) {
		this.appointementTime = appointementTime;
	}
	public long getEstateId() {
		return estateId;
	}
	public void setEstateId(long estateId) {
		this.estateId = estateId;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public String getBuyerMobile() {
		return buyerMobile;
	}
	public void setBuyerMobile(String buyerMobile) {
		this.buyerMobile = buyerMobile;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Appointement [id=" + id + ", appointementTime=" + appointementTime + ", estateId=" + estateId
				+ ", buyerName=" + buyerName + ", buyerMobile=" + buyerMobile + ", status=" + status + "]";
	}
	
	
	
}
