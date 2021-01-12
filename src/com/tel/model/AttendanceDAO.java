package com.tel.model;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tel.entity.AttendanceDTO;
import com.tel.entity.MemberDTO;


@Repository
public class AttendanceDAO {
	
	@Autowired
	private SqlSessionFactory factory;

	//출근 있는지 여부 확인
	public int checkTime(AttendanceDTO attDTO) {
		return factory.openSession().selectOne("my.attendanceMapper.checkTime",attDTO);
	}
	
	//출근시 출근시간과 위도경도 저장
	public void onTime(AttendanceDTO att) {
		System.out.println("출근시간: "+att.getA_goTime());
		System.out.println("퇴근시간: "+att.getA_offTime());
		System.out.println("위도: "+att.getA_place_lat());
		System.out.println("경도: "+att.getA_place_lon());
		System.out.println("midx: "+att.getM_idx());
		System.out.println("didx: "+att.getD_idx());
		factory.openSession().insert("my.attendanceMapper.onTime",att);
	}

	//퇴근!
	public int offTime(AttendanceDTO attDTO) {
		return factory.openSession().update("my.attendanceMapper.offTime",attDTO);
	}

	//멤버
	public MemberDTO member(int midx) {
		return factory.openSession().selectOne("my.memberMapper.selectMemberInfo", midx);
	}

	//부서 사원 리스트
	public List<AttendanceDTO> dMember(AttendanceDTO attDTO) {
		return factory.openSession().selectList("my.attendanceMapper.dMember", attDTO);
	}

	

	
	


}
