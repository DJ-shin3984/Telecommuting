package com.tel.entity;

public class Individual_work_DTO {
	
	private int iw_idx;
	private String iw_title;
	private String iw_content;
	private int m_idx;
	
	public Individual_work_DTO() {
		super();
	}

	public Individual_work_DTO(int iw_idx, String iw_title, String iw_content, int m_idx) {
		super();
		this.iw_idx = iw_idx;
		this.iw_title = iw_title;
		this.iw_content = iw_content;
		this.m_idx = m_idx;
	}
	
	public int getIw_idx() {
		return iw_idx;
	}
	public void setIw_idx(int iw_idx) {
		this.iw_idx = iw_idx;
	}
	public String getIw_title() {
		return iw_title;
	}
	public void setIw_title(String iw_title) {
		this.iw_title = iw_title;
	}
	public String getIw_content() {
		return iw_content;
	}
	public void setIw_content(String iw_content) {
		this.iw_content = iw_content;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}


	
	
	
	

}
