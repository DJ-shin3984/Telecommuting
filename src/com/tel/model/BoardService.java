package com.tel.model;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tel.entity.BoardDTO;


@Service
public class BoardService {

	@Autowired
	BoardDAO dao;

	public int createBoard(String bTitle, String bContent, String midx, String didx) {
		BoardDTO dto = new BoardDTO();
		dto.setB_Title(bTitle);
		dto.setB_Content(bContent);
		dto.setM_idx(midx);
		dto.setD_idx(didx);
		
		System.out.println("보드 서비스1: "+dto.getB_Title());
		System.out.println("보드 서비스2: "+dto.getB_Content());
		System.out.println("보드 서비스3: "+dto.getM_idx());
		System.out.println("보드 서비스4: "+dto.getD_idx());
		
		return dao.createBoard(dto);
	}

	public List<BoardDTO> readBoardList() {
		return dao.readBoardList();
	}

	public BoardDTO readBoard(int bIdx) {
		return dao.readBoard(bIdx);
	}

	public int updateBoard(int bIdx, String bTitle, String bContent) {
		BoardDTO dto = new BoardDTO();
		dto.setB_Idx(bIdx);
		dto.setB_Title(bTitle);
		dto.setB_Content(bContent);
		
		return dao.updateBoard(dto);
	}

	public int deleteBoard(int bIdx) {
		return dao.deleteBoard(bIdx);
	}

	
	//페이지 처리한 리스트
	public List<BoardDTO> getBoardList(Map<String, Integer> map) {
		List<BoardDTO> list = dao.getBoardList(map);
		return list;
	}
	
StringBuffer pagingHTML;
	
	public void makePagingHTML(int currentPage, int pageBlock, int pageSize){
		pagingHTML=new StringBuffer();
		
		int totalA=dao.getTotalArticle();//총글수			
		int totalP=(totalA+pageSize-1)/pageSize;//총페이지수
	
		int startPage=((int)((currentPage-1)/pageBlock))*pageBlock+1;		
		int endPage=startPage+pageBlock-1;
				
		if(endPage>totalP){
			endPage=totalP;
		}		
		
		//----------------------------------------------------------------
		if(startPage>pageBlock){			
			pagingHTML.append("<a href='readBoardList.do?tIdx=1&pg="
		+(startPage-pageBlock)+"'>["+"이전]</a>");
		}		
		
		for(int i=startPage;i<=endPage;i++){
			if(currentPage==i){
				pagingHTML.append("<a href='readBoardList.do?tIdx=1&pg="
			                     +i+"'><font color=red>["+ i+ "]</font></a>");
			
			}else{
				pagingHTML.append("<a href='readBoardList.do?tIdx=1&pg="
			                      +i+"'>["+i+"]</a>");
			}
		}
				
		if(endPage<totalP){
			pagingHTML.append("<a href='readBoardList.do?tIdx=1&pg="
		+(startPage+pageBlock)+"'>["+"다음]</a>");
		}
	}
	
	public String getPagingHTML() {
		return pagingHTML.toString();
	}	

	
}
