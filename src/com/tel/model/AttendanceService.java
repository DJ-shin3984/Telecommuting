package com.tel.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tel.entity.AttendanceDTO;
import com.tel.entity.MemberDTO;

@Service
public class AttendanceService {

	@Autowired
	AttendanceDAO dao;

	//출근 여부 확인
	public int checkTime(AttendanceDTO attDTO) {
		return dao.checkTime(attDTO);
	}
	
	//출근시 출근시간과 위도경도 저장
	public void onTime(AttendanceDTO attDTO) {
		dao.onTime(attDTO);
	}

	//퇴근시 저장되어있던 정보의 퇴근시간 업데이트
	public int offTime(AttendanceDTO attDTO) {
		return dao.offTime(attDTO);
	}
	
	//멤버 정보
	public MemberDTO member(int midx) {
		return dao.member(midx);
	}

	//부서 멤버 리스트
	public List<AttendanceDTO> dMember(AttendanceDTO attDTO) {
		return dao.dMember(attDTO);
	}






}
