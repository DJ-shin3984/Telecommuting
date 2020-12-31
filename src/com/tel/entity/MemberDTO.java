package com.tel.entity;

public class MemberDTO {
	private int m_idx;
	private String id;
	private String pw;
	private String name;
	private String phone;
	
	public MemberDTO() {
		super();
	}	

	public MemberDTO(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
		
	}
	
	public MemberDTO(int m_idx, String id, String pw, String name, String phone) {
		super();
		this.m_idx = m_idx;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
