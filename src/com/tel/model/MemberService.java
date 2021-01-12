package com.tel.model;

import java.util.Random;

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
		public MemberDTO checklogin(MemberDTO member) throws Exception {
			Random rd = new Random();
			int rdNum = rd.nextInt(99999);
			if(member != null) {
				member.setM_pw(Sha256.MySha256(member.getM_pw()));
				member.setToken(Sha256.MySha256(member.getM_phone()+rdNum));
				System.out.println("멤버 토큰:"+member.getToken());
			}
			member = memberDao.checklogin(member);
			return member;
		}

	public void onTime(AttendanceDTO att) {
		memberDao.onTime(att);
	}

	//회원가입 (Insert)
	public int insertMember(MemberDTO member) throws Exception {
		if(member != null) {
			member.setM_pw(Sha256.MySha256(member.getM_pw()));
		}
		int n = memberDao.insertMember(member);
		System.out.println("멤버 비번:"+member.getM_pw());
		return n;
	}

	//아이디 중복체크 (Select)
	public int selectMember(String user_id) {
		return memberDao.selectMember(user_id);
	}
	
}