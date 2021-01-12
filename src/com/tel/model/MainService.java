package com.tel.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tel.entity.AttendanceDTO;
import com.tel.entity.DepartmentDTO;
import com.tel.entity.Department_work_DTO;
import com.tel.entity.Individual_work_DTO;
import com.tel.entity.MemberDTO;

@Service
public class MainService {
	
	private MainDAO mainDao;

	@Autowired
	public MainService(MainDAO mainDao) {
		super();
		this.mainDao = mainDao;
	}
	
	//개인업무 리스트 불러오기
	public List<Individual_work_DTO> iw_list(int mIdx) {
		return mainDao.iw_list(mIdx);
	}
	
	// 개인업무 추가 insert
	public int IWwriter(Individual_work_DTO iwDTO) {
		return mainDao.IWwriter(iwDTO);
	}
	
	// 개인업무 삭제 Delete
	public int IWDelete(int iw_idx) {
		return mainDao.IWDelete(iw_idx);
	}
	
	//개인업무 수정 update
	public int IWUpdate(Individual_work_DTO iwDTO) {
		return mainDao.IWUpdate(iwDTO);
	}
	
	//부서업무 리스트 불러오기
	public List<Department_work_DTO> dw_list(int dIdx) {
		return mainDao.dw_list(dIdx);
	}

	//부서업무 추가하기
	public int DWinsert(Department_work_DTO dwDTO) {
		return mainDao.DWinsert(dwDTO);
	}

	// 부서업무 삭제 Delete
	public int DWDelete(int dw_idx) {
		return mainDao.DWDelete(dw_idx);
	}

	// 부서업무 수정 update
	public int DWUpdate(Department_work_DTO dwDTO) {
		return mainDao.DWUpdate(dwDTO);
	}

	// 부서 리스트 불러오기
	public List<DepartmentDTO> dep_list() {
		return mainDao.dep_list();
	}

	//멤버정보 가져오기
	public MemberDTO member(int midx) {
		return mainDao.member(midx);
	}

	//부서명 가져오기
	public String depName(int dIdx) {
		return mainDao.depName(dIdx);
	}

	
	public AttendanceDTO checkTime(AttendanceDTO attDTO) {
		return mainDao.checkTime(attDTO);
	}
	
	


	
}