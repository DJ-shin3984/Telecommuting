package com.tel.model;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tel.entity.AttendanceDTO;
import com.tel.entity.MemberDTO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionFactory factory;

	//로그인
	public MemberDTO checklogin(MemberDTO member) {
		member=factory.openSession().selectOne("my.memberMapper.checklogin",member);
		return member;
	}

	public void onTime(AttendanceDTO att) {
		factory.openSession().insert("my.memberMapper.onTime",att);
	}

	// 회원가입
	public int insertMember(MemberDTO member) {
		int n=factory.openSession().insert("my.memberMapper.insertMember",member);
		return n;
	}

	// 아이디 중복체크
	public int selectMember(String user_id) {
		int n=factory.openSession().selectOne("my.memberMapper.selectMember",user_id);
		System.out.println("dao: "+n);
		return n;
	}


}

