package com.tel.entity;

public class AttendanceDTO {
	private int a_idx; // 근태번호
	private String a_goTime; // 출근시간
	private String a_offTime; // 퇴근시간
	private String a_place_lat; // 현재위치_위도
	private String a_place_lon; // 현재위치_경도
	private String m_name; // 현재위치_경도
	private int m_idx; // 사원번호
	private int d_idx; // 부서번호
	
	public AttendanceDTO() {
		super();
	}

	public AttendanceDTO(int a_idx, String a_goTime, String a_offTime, String a_place_lat, String a_place_lon,
			String m_name, int m_idx, int d_idx) {
		super();
		this.a_idx = a_idx;
		this.a_goTime = a_goTime;
		this.a_offTime = a_offTime;
		this.a_place_lat = a_place_lat;
		this.a_place_lon = a_place_lon;
		this.m_name = m_name;
		this.m_idx = m_idx;
		this.d_idx = d_idx;
	}

	public int getA_idx() {
		return a_idx;
	}

	public void setA_idx(int a_idx) {
		this.a_idx = a_idx;
	}

	public String getA_goTime() {
		return a_goTime;
	}

	public void setA_goTime(String a_goTime) {
		this.a_goTime = a_goTime;
	}

	public String getA_offTime() {
		return a_offTime;
	}

	public void setA_offTime(String a_offTime) {
		this.a_offTime = a_offTime;
	}

	public String getA_place_lat() {
		return a_place_lat;
	}

	public void setA_place_lat(String a_place_lat) {
		this.a_place_lat = a_place_lat;
	}

	public String getA_place_lon() {
		return a_place_lon;
	}

	public void setA_place_lon(String a_place_lon) {
		this.a_place_lon = a_place_lon;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
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
