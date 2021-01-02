package com.tel.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tel.entity.AttendanceDTO;
import com.tel.entity.MemberDTO;

@Service("memberService")
public class MemberService {
	
	private MemberDAO memberDao;

	@Autowired
	public MemberService(MemberDAO memberDao) {
		super();
		this.memberDao = memberDao;
	}
	
	// 로그인 (Select)
	public MemberDTO checklogin(MemberDTO member) {
		member = memberDao.checklogin(member);
		return member;
	}

	public void onTime(AttendanceDTO att) {
		memberDao.onTime(att);
	}
	
//	//로그인 성공시 현재위치
//	public AttendanceDTO onTime() {
//		AttendanceDTO att = new AttendanceDTO();
//		
//		att =memberDao.onTime();
//		return att;
//	}

//	//아이디 중복체크 (Select)
//	public int selectMember(String user_id) {
//		return memberDao.selectMember(user_id);
//	}
//	
//	//회원가입 (Insert)
//	public int insertMember(MemberDTO member) {
//		System.out.println("회원가입 서비스");
//		return memberDao.insertMember(member);
//	}
//	//로그인(select)
//	public MemberDTO checklogin(String id, String pwd) {
//		MemberDTO member = new MemberDTO(id,pwd);
//		return memberDao.checklogin(member);
//	}
	
}