package com.tel.controll;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tel.entity.BoardDTO;
import com.tel.model.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService service;
	//웹 ================================================================================ ================================================================================
	
	//게시판 페이지 이동 ================================================================================
	@RequestMapping(value="/createBoardePg.do")
	public String createBoardePg(HttpServletRequest request, Model model) {
		return "board/createBoardePg";
		
	}
	
	//게시판 추가 ================================================================================
	@RequestMapping(value="/createBoard.do", method=RequestMethod.POST)
	public String createBoard(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		String midx = request.getParameter("midx");
		String didx = request.getParameter("didx");
		
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		
		int n = service.createBoard(bTitle, bContent, midx, didx);
		
		return "redirect:readBoardList.do";
		
	}

	//게시판 리스트 불러오기 ================================================================================
	@RequestMapping(value="/readBoardList.do")
	public String readBoardList(HttpServletRequest request, Model model) {
		
		String midx = request.getParameter("midx");
		String didx = request.getParameter("didx");

		//데이터 가져오기
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		//select DB
		int pageSize = 5;			// 한 페이지에 출력할 게시물 수
		int endNum=pg*pageSize;		// 끝 번호
		int startNum=endNum-(pageSize-1);
		
		service.makePagingHTML(pg,4,pageSize);

		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<BoardDTO> list = service.getBoardList(map);
//		List<BoardDTO> list = service.readBoardList();
		
		//페이지 처리
		
		model.addAttribute("paging", service);
		model.addAttribute("midx", midx);
		model.addAttribute("didx", didx);
		model.addAttribute("list", list);
		return "board/boardList";
		
	}
	
	//게시판 객체 불러오기 ================================================================================
	@RequestMapping(value="/readBoard.do")
	public String readBoard(HttpServletRequest request, Model model) {

		String midx = request.getParameter("midx");
		String didx = request.getParameter("didx");
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		
		BoardDTO dto =service.readBoard(bIdx);

		model.addAttribute("midx", midx);
		model.addAttribute("didx", didx);
		model.addAttribute("dto", dto);
		
		return "board/boardOb";
	}
	
	//게시판 수정 페이지 불러오기 ================================================================================
	@RequestMapping(value="/updateBoardPg.do")
	public String updateBoardPg(HttpServletRequest request, Model model) {
		
		model.addAttribute("bIdx", Integer.parseInt(request.getParameter("bIdx")));
		model.addAttribute("bTitle", request.getParameter("bTitle"));
		model.addAttribute("bContent", request.getParameter("bContent"));
		model.addAttribute("bDate", request.getParameter("bDate"));
		model.addAttribute("mName", request.getParameter("mName"));
		
		return "board/boardUpPg";
		
	}
	
	//게시판 수정 ================================================================================
	@RequestMapping(value="/updateBoard.do")
	public String updateBoard(HttpServletRequest request, Model model) {
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		
		int n = service.updateBoard(bIdx, bTitle, bContent);
		
		model.addAttribute("bIdx", bIdx);
		return "redirect:readBoard.do";
	}
	
	//게시판 삭제 ================================================================================
	@RequestMapping(value="/deleteBoard.do")
	public String deleteBoard(HttpServletRequest request, Model model) {
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		int n = service.deleteBoard(bIdx);
		
		return "redirect:readBoardList.do";
	}
	

}
