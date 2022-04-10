package com.mwt_wjd.models;

import java.time.LocalDateTime;
import java.util.Date;

public class Estate {
	private long id;
	private Date uploadedOn;
	private int estateType;
	private int showType;
	private double estateSize;
	private String estateAddress;
	private String notes;
	private String sellerName;
	private String mobile1;
	private String mobile2;
	private double price;
	private String fileURL;
	private int status;
	public Estate(long id, Date uploadedOn, int estateType, int showType, double estateSize, String estateAddress,
			String notes, String sellerName, String mobile1, String mobile2, double price, String fileURL, int status) {
		super();
		this.id = id;
		this.uploadedOn = uploadedOn;
		this.estateType = estateType;
		this.showType = showType;
		this.estateSize = estateSize;
		this.estateAddress = estateAddress;
		this.notes = notes;
		this.sellerName = sellerName;
		this.mobile1 = mobile1;
		this.mobile2 = mobile2;
		this.price = price;
		this.fileURL = fileURL;
		this.status = status;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Date getUploadedOn() {
		return uploadedOn;
	}
	public void setUploadedOn(Date uploadedOn) {
		this.uploadedOn = uploadedOn;
	}
	public int getEstateType() {
		return estateType;
	}
	public void setEstateType(int estateType) {
		this.estateType = estateType;
	}
	public int getShowType() {
		return showType;
	}
	public void setShowType(int showType) {
		this.showType = showType;
	}
	public double getEstateSize() {
		return estateSize;
	}
	public void setEstateSize(double estateSize) {
		this.estateSize = estateSize;
	}
	public String getEstateAddress() {
		return estateAddress;
	}
	public void setEstateAddress(String estateAddress) {
		this.estateAddress = estateAddress;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public String getSellerName() {
		return sellerName;
	}
	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}
	public String getMobile1() {
		return mobile1;
	}
	public void setMobile1(String mobile1) {
		this.mobile1 = mobile1;
	}
	public String getMobile2() {
		return mobile2;
	}
	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getFileURL() {
		return fileURL;
	}
	public void setFileURL(String fileURL) {
		this.fileURL = fileURL;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Estate [id=" + id + ", uploadedOn=" + uploadedOn + ", estateType=" + estateType + ", showType="
				+ showType + ", estateSize=" + estateSize + ", estateAddress=" + estateAddress + ", notes=" + notes
				+ ", sellerName=" + sellerName + ", mobile1=" + mobile1 + ", mobile2=" + mobile2 + ", price=" + price
				+ ", fileURL=" + fileURL + ", status=" + status + "]";
	}
	
	

}
