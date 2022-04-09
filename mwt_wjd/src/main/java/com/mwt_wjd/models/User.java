package com.mwt_wjd.models;

import java.util.Date;

public class User {

	private int id;
	private String username;
	private String password;
	private String fullName;
	private int role;
	private int status;
	private Date dateCreated;
	private Date dateModified;
	
	public User() {
		this.id = 0;
		this.username = "";
		this.password = "";
		this.role = 0;
		this.status = 0;
	}

	public User(int id, String username, String password, String fullName, int role, int status, Date dateCreated,
			Date dateModified) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.fullName = fullName;
		this.role = role;
		this.status = status;
		this.dateCreated = dateCreated;
		this.dateModified = dateModified;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public Date getDateModified() {
		return dateModified;
	}

	public void setDateModified(Date dateModified) {
		this.dateModified = dateModified;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", fullName=" + fullName
				+ ", role=" + role + ", status=" + status + ", dateCreated=" + dateCreated + ", dateModified="
				+ dateModified + "]";
	}
	
	
}
