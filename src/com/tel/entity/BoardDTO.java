package com.tel.entity;

public class BoardDTO {
	int b_Idx;
	String token;
	String b_Title;
	String b_Content;
	String b_Date;
	String m_Name;
	String m_idx;
	String d_idx;

	public BoardDTO() {
		super();
	}

	public BoardDTO(String b_Title, String b_Content, String m_idx, String d_idx) {
		super();
		this.b_Title = b_Title;
		this.b_Content = b_Content;
		this.m_idx = m_idx;
		this.d_idx = d_idx;
	}

	public BoardDTO(int b_Idx, String token, String b_Title, String b_Content, String b_Date, String m_Name,
			String m_idx, String d_idx) {
		super();
		this.b_Idx = b_Idx;
		this.token = token;
		this.b_Title = b_Title;
		this.b_Content = b_Content;
		this.b_Date = b_Date;
		this.m_Name = m_Name;
		this.m_idx = m_idx;
		this.d_idx = d_idx;
	}

	public int getB_Idx() {
		return b_Idx;
	}

	public void setB_Idx(int b_Idx) {
		this.b_Idx = b_Idx;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getB_Title() {
		return b_Title;
	}

	public void setB_Title(String b_Title) {
		this.b_Title = b_Title;
	}

	public String getB_Content() {
		return b_Content;
	}

	public void setB_Content(String b_Content) {
		this.b_Content = b_Content;
	}

	public String getB_Date() {
		return b_Date;
	}

	public void setB_Date(String b_Date) {
		this.b_Date = b_Date;
	}

	public String getM_Name() {
		return m_Name;
	}

	public void setM_Name(String m_Name) {
		this.m_Name = m_Name;
	}

	public String getM_idx() {
		return m_idx;
	}

	public void setM_idx(String m_idx) {
		this.m_idx = m_idx;
	}

	public String getD_idx() {
		return d_idx;
	}

	public void setD_idx(String d_idx) {
		this.d_idx = d_idx;
	}	
	
}
