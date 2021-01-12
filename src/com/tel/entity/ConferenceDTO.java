package com.tel.entity;

public class ConferenceDTO {
	int c_Idx;
	String c_Title;
	String c_Content;
	String c_Date;
	int m_idx;
	int d_idx;
	
	public ConferenceDTO() {
		super();
	}

	public ConferenceDTO(int c_Idx, String c_Title, String c_Content, String c_Date, int m_idx, int d_idx) {
		super();
		this.c_Idx = c_Idx;
		this.c_Title = c_Title;
		this.c_Content = c_Content;
		this.c_Date = c_Date;
		this.m_idx = m_idx;
		this.d_idx = d_idx;
	}

	public int getC_Idx() {
		return c_Idx;
	}

	public void setC_Idx(int c_Idx) {
		this.c_Idx = c_Idx;
	}

	public String getC_Title() {
		return c_Title;
	}

	public void setC_Title(String c_Title) {
		this.c_Title = c_Title;
	}

	public String getC_Content() {
		return c_Content;
	}

	public void setC_Content(String c_Content) {
		this.c_Content = c_Content;
	}

	public String getC_Date() {
		return c_Date;
	}

	public void setC_Date(String c_Date) {
		this.c_Date = c_Date;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public int getD_idx() {
		return d_idx;
	}

	public void setD_idx(int d_idx) {
		this.d_idx = d_idx;
	}
	
}
