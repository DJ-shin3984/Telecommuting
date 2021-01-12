package com.tel.entity;

public class DepartmentDTO {
	int d_Idx;
	String d_Name;
	String d_Phone;
	public DepartmentDTO(int d_Idx, String d_Name, String d_Phone) {
		super();
		this.d_Idx = d_Idx;
		this.d_Name = d_Name;
		this.d_Phone = d_Phone;
	}
	public DepartmentDTO() {
		super();
	}
	public int getd_Idx() {
		return d_Idx;
	}
	public void setd_Idx(int d_Idx) {
		this.d_Idx = d_Idx;
	}
	public String getd_Name() {
		return d_Name;
	}
	public void setd_Name(String d_Name) {
		this.d_Name = d_Name;
	}
	public String getd_Phone() {
		return d_Phone;
	}
	public void setd_Phone(String d_Phone) {
		this.d_Phone = d_Phone;
	}

}
