package com.tel.model;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tel.entity.DepartmentDTO;
import com.tel.entity.MemberDTO;

@Repository
public class AddBookDAO {
	
	@Autowired
	private SqlSessionFactory factory;

	//멤버정보 가져오기
	public MemberDTO member(int midx) {
		return factory.openSession().selectOne("my.memberMapper.selectMemberInfo", midx);
	}

	//모든 부서 목록 가져오기
	public List<DepartmentDTO> dep_list() {
		return factory.openSession().selectList("my.memberMapper.depList");
	}

	// 클릭한 부서 연명부 리스트
	public List<MemberDTO> addBooklist(int d_idx) {
		return factory.openSession().selectList("my.addBookMapper.addBooklist",d_idx);
	}

	// 클릭한 사원 프로필 수정
	public int ABupdate(MemberDTO member) {
		return factory.openSession().update("my.addBookMapper.ABupdate",member);
	}

	// 클릭한 사원 삭제
	public void MemberDelete(int m_idx) {
		factory.openSession().delete("my.addBookMapper.MemberDelete",m_idx);
	}
	

	


}
