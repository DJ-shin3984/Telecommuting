package com.tel.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tel.entity.BoardDTO;
import com.tel.entity.ConferenceDTO;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionFactory factory;
	
	private static BoardDAO instance;
	public static BoardDAO getInstance() {
		if (instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	}
	
	public int createBoard(BoardDTO dto) {
		return factory.openSession().insert("my.boardMapper.createBoard", dto);
	}

	public List<BoardDTO> readBoardList() {
		return factory.openSession().selectList("my.boardMapper.readBoardList");
	}

	public BoardDTO readBoard(int bIdx) {
		return factory.openSession().selectOne("my.boardMapper.readBoard", bIdx);
	}

	public int updateBoard(BoardDTO dto) {
		return factory.openSession().update("my.boardMapper.updateBoard", dto);
	}

	public int deleteBoard(int bIdx) {
		return factory.openSession().delete("my.boardMapper.deleteBoard", bIdx);
	}

	//페이징 처리한 리스트
	public List<BoardDTO> getBoardList(Map<String, Integer> map) {
		return factory.openSession().selectList("my.boardMapper.getBoardList", map);
	}
	
	//총게시물수
	public int getTotalArticle() { // 총 게시물 수
		int n = 0;
		try {
			n = factory.openSession().selectOne("my.boardMapper.getTotalArticle");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}


}
