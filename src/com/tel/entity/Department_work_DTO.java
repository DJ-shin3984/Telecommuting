package com.tel.entity;

public class Department_work_DTO {

	
	private int dw_idx ;
	private String dw_title;
	private String dw_content; 
	private String dw_schedule ;
	private String dw_monthwork ;
	private String dw_weekwork ;
	private int d_idx;
	
	public Department_work_DTO() {
		super();
	}

	public Department_work_DTO(int dw_idx, String dw_title, String dw_content, String dw_schedule, String dw_monthwork,
			String dw_weekwork, int d_idx) {
		super();
		this.dw_idx = dw_idx;
		this.dw_title = dw_title;
		this.dw_content = dw_content;
		this.dw_schedule = dw_schedule;
		this.dw_monthwork = dw_monthwork;
		this.dw_weekwork = dw_weekwork;
		this.d_idx = d_idx;
	}

	public int getDw_idx() {
		return dw_idx;
	}

	public void setDw_idx(int dw_idx) {
		this.dw_idx = dw_idx;
	}

	public String getDw_title() {
		return dw_title;
	}

	public void setDw_title(String dw_title) {
		this.dw_title = dw_title;
	}

	public String getDw_content() {
		return dw_content;
	}

	public void setDw_content(String dw_content) {
		this.dw_content = dw_content;
	}

	public String getDw_schedule() {
		return dw_schedule;
	}

	public void setDw_schedule(String dw_schedule) {
		this.dw_schedule = dw_schedule;
	}

	public String getDw_monthwork() {
		return dw_monthwork;
	}

	public void setDw_monthwork(String dw_monthwork) {
		this.dw_monthwork = dw_monthwork;
	}

	public String getDw_weekwork() {
		return dw_weekwork;
	}

	public void setDw_weekwork(String dw_weekwork) {
		this.dw_weekwork = dw_weekwork;
	}

	public int getD_idx() {
		return d_idx;
	}

	public void setD_idx(int d_idx) {
		this.d_idx = d_idx;
	}
	
}
