package com.tel.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tel.entity.ConferenceDTO;
import com.tel.entity.DepartmentDTO;
import com.tel.entity.MemberDTO;

@Service
public class ConferenceService {

	@Autowired
	ConferenceDAO dao;

	//멤버정보 가져오기
	public MemberDTO member(int midx) {
		return dao.member(midx);
	}

	//모든 부서 목록 다가져오기
	public List<DepartmentDTO> dep_list() {
		return dao.dep_list();
	}
	
	// 클릭한 부서 회의게시판 리스트
	public List<ConferenceDTO> CFlist(int d_idx) {
		return dao.CFlist(d_idx);
	}

	// 회의게시판 글쓰기
	public void insertCF(ConferenceDTO cfDTO) {
		dao.insertCF(cfDTO);
	}

	//게시글 상세보기
	public ConferenceDTO CFdetail(int c_idx) {
		return dao.CFdetail(c_idx);
	}



}
