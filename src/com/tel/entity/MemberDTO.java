package com.tel.entity;

public class MemberDTO {
	private int m_idx; // 사원번호
	private String m_name; // 이름
	private String m_id; // 아이디
	private String m_pw; // 비밀번호
	private String m_phone; // 연락처
	private String m_subphone; // 비상연락처
	private String m_email; // 이메일
	private String m_add; // 주소
	private String m_empdate; // 입사일
	private String d_idx; // 부서 번호
	private String m_photo; // 사진
	private String token; // 토큰
	private int m_level; // 토큰
	
	public MemberDTO() {
		super();
	}

	public MemberDTO(int m_idx, String m_name, String m_id, String m_pw, String m_phone, String m_subphone,
			String m_email, String m_add, String m_empdate, String d_idx, String m_photo, String token, int m_level) {
		super();
		this.m_idx = m_idx;
		this.m_name = m_name;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_phone = m_phone;
		this.m_subphone = m_subphone;
		this.m_email = m_email;
		this.m_add = m_add;
		this.m_empdate = m_empdate;
		this.d_idx = d_idx;
		this.m_photo = m_photo;
		this.token = token;
		this.m_level = m_level;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_subphone() {
		return m_subphone;
	}

	public void setM_subphone(String m_subphone) {
		this.m_subphone = m_subphone;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_add() {
		return m_add;
	}

	public void setM_add(String m_add) {
		this.m_add = m_add;
	}

	public String getM_empdate() {
		return m_empdate;
	}

	public void setM_empdate(String m_empdate) {
		this.m_empdate = m_empdate;
	}

	public String getD_idx() {
		return d_idx;
	}

	public void setD_idx(String d_idx) {
		this.d_idx = d_idx;
	}

	public String getM_photo() {
		return m_photo;
	}

	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public int getM_level() {
		return m_level;
	}

	public void setM_level(int m_level) {
		this.m_level = m_level;
	}
	
}
