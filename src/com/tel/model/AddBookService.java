package com.tel.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tel.entity.DepartmentDTO;
import com.tel.entity.MemberDTO;

@Service
public class AddBookService {

	@Autowired
	AddBookDAO dao;

	//멤버정보 가져오기
	public MemberDTO member(int midx) {
		return dao.member(midx);
	}

	//모든 부서 목록 다가져오기
	public List<DepartmentDTO> dep_list() {
		return dao.dep_list();
	}

	// 클릭한 부서 연명부 리스트
	public List<MemberDTO> addBooklist(int d_idx) {
		return dao.addBooklist(d_idx);
	}

	// 클릭한 사원 프로필 수정
	public int ABupdate(MemberDTO member) {
		return dao.ABupdate(member);
	}

	// 클릭한 사원 삭제
	public void MemberDelete(int m_idx) {
		dao.MemberDelete(m_idx);
	}



}
