package com.tel.model;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tel.entity.AttendanceDTO;
import com.tel.entity.DepartmentDTO;
import com.tel.entity.Department_work_DTO;
import com.tel.entity.Individual_work_DTO;
import com.tel.entity.MemberDTO;

@Repository
public class MainDAO {
	@Autowired
	private SqlSessionFactory factory;

	//로그인
	public MemberDTO checklogin(MemberDTO member) {
		member=factory.openSession().selectOne("my.mainMapper.checklogin",member);
		System.out.println(member.getM_idx());
		return member;
	}

	//개인업무 리스트 가져오기
	public List<Individual_work_DTO> iw_list(int mIdx) {
		List<Individual_work_DTO> iw_list = factory.openSession().selectList("my.mainMapper.iw_list",mIdx);
		return iw_list;
	}
	
	// 개인업무 추가하기
	public int IWwriter(Individual_work_DTO iwDTO) {
		return factory.openSession().insert("my.mainMapper.IW_Insert",iwDTO);
	}
	
	// 개인업무 삭제하기
	public int IWDelete(int iw_idx) {
		return factory.openSession().delete("my.mainMapper.IWDelete",iw_idx);
	}
	
	// 개인업무 수정하기
	int IWUpdate(Individual_work_DTO iwDTO) {
		return factory.openSession().update("my.mainMapper.IWUpdate",iwDTO);
	}

	// 부서업무 리스트 가져오기
	public List<Department_work_DTO> dw_list(int dIdx) {
		return factory.openSession().selectList("my.mainMapper.dw_list",dIdx);
	}

	// 부서업무 추가하기
	public int DWinsert(Department_work_DTO dwDTO) {
		return factory.openSession().insert("my.mainMapper.DWinsert",dwDTO);
	}

	// 부서업무 삭제하기
	public int DWDelete(int dw_idx) {
		return factory.openSession().delete("my.mainMapper.DWDelete",dw_idx);
	}

	// 부서업무 수정하기
	public int DWUpdate(Department_work_DTO dwDTO) {
		return factory.openSession().update("my.mainMapper.DWUpdate",dwDTO);
	}
	//모든 부서 목록 가져오기
	public List<DepartmentDTO> dep_list() {
		return factory.openSession().selectList("my.memberMapper.depList");
	}

	//멤버정보 가져오기
	public MemberDTO member(int midx) {
		return factory.openSession().selectOne("my.memberMapper.selectMemberInfo", midx);
	}

	//부서명 가져오기
	public String depName(int dIdx) {
		return factory.openSession().selectOne("my.mainMapper.depName", dIdx);
	}

	public AttendanceDTO checkTime(AttendanceDTO attDTO) {
		return factory.openSession().selectOne("my.attendanceMapper.checkAtt",attDTO);
	}


}

