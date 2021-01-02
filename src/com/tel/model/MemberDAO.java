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

//	public int selectMember(String user_id) {
//		System.out.println("dao user id: "+user_id);
//		int n=factory.openSession().selectOne("my.memberMapper.selectMember",user_id);
//		System.out.println("dao: "+n);
//		return n;
//	}
//
//	public int insertMember(MemberDTO member) {
//		System.out.println("회원가입 다오");
//		int n=factory.openSession().insert("my.memberMapper.insertMember",member);
//		return n;
//	}

}

