package com.tel.model;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tel.entity.ConferenceDTO;
import com.tel.entity.DepartmentDTO;
import com.tel.entity.MemberDTO;

@Repository
public class ConferenceDAO {
	
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

	// 클릭한 부서 회의게시판 리스트
	public List<ConferenceDTO> CFlist(int d_idx) {
		return factory.openSession().selectList("my.conferenceMapper.CFlist",d_idx);
	}

	// 회의록 글쓰기
	public void insertCF(ConferenceDTO cfDTO) {
		factory.openSession().insert("my.conferenceMapper.insertCF",cfDTO);
	}
	
	//게시글 상세보기
	public ConferenceDTO CFdetail(int c_idx) {
		return factory.openSession().selectOne("my.conferenceMapper.CFdetail",c_idx);
	}


	


}
