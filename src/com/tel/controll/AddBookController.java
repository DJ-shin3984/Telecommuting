package com.tel.controll;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tel.entity.ConferenceDTO;
import com.tel.entity.DepartmentDTO;
import com.tel.entity.MemberDTO;
import com.tel.model.AddBookService;

	@Controller
	public class AddBookController {
		private AddBookService addBookService;
	
		@Autowired
		public AddBookController(AddBookService addBookService) {
			super();
			this.addBookService = addBookService;
		}

		// 연명부 메뉴 클릭시 보여줄 연명부 부서 메뉴 
		@RequestMapping(value="/addMainDP.do") 
		public String mainDP(HttpServletRequest request,Model model) {
			int midx = Integer.parseInt(request.getParameter("midx"));
			MemberDTO member = addBookService.member(midx);
			
			List<DepartmentDTO> dep_list = addBookService.dep_list();

			model.addAttribute("member",member);
			model.addAttribute("dep_list",dep_list);
			
			return "/addBook/ABmainDP";
		}
		
		// 클릭한 부서 연락처 리스트
		@RequestMapping(value="/addBookList.do") 
		public String depCFList(HttpServletRequest request,Model model) {
			int m_idx = Integer.parseInt(request.getParameter("midx"));
			int d_idx = Integer.parseInt(request.getParameter("didx"));
			
			List<MemberDTO> addBookList = addBookService.addBooklist(d_idx);

			model.addAttribute("addBookList",addBookList);
			model.addAttribute("midx",m_idx);
			model.addAttribute("didx",d_idx);
			
			return "/addBook/ABlist";
		}
		
		// 클릭한 사원 프로필
		@RequestMapping(value="/AddDetail.do") 
		public String AddDetail(HttpServletRequest request,Model model) {
			int m_idx = Integer.parseInt(request.getParameter("midx"));
			int d_idx = Integer.parseInt(request.getParameter("didx"));
			
			MemberDTO member = addBookService.member(m_idx);
			
			model.addAttribute("member",member);
			model.addAttribute("midx",m_idx);
			model.addAttribute("didx",d_idx);
			
			return "/addBook/ABdetail";
		}
		
		// 클릭한 사원 프로필 수정하기로 이동
		@RequestMapping(value="/Addmodify.do") 
		public String Addmodify(HttpServletRequest request,Model model) {
			int m_idx = Integer.parseInt(request.getParameter("midx"));
			int d_idx = Integer.parseInt(request.getParameter("didx"));
			
			MemberDTO member = addBookService.member(m_idx);
			
			model.addAttribute("member",member);
			model.addAttribute("midx",m_idx);
			model.addAttribute("didx",d_idx);
			
			return "/addBook/ABmodify";
		}
		
		// 클릭한 사원 프로필 수정하기로 이동
		@RequestMapping(value="/ABupdate.do") 
		public String ABupdate(HttpServletRequest request,Model model) {
			int m_idx = Integer.parseInt(request.getParameter("midx"));
			int d_idx = Integer.parseInt(request.getParameter("didx"));
			
			MemberDTO member = new MemberDTO();
			member.setM_idx(m_idx);
			member.setM_name(request.getParameter("name"));
			member.setM_id(request.getParameter("id"));
			member.setM_pw(request.getParameter("pw"));
			member.setM_phone(request.getParameter("phone"));
			member.setM_subphone(request.getParameter("subphone"));
			member.setM_email(request.getParameter("email"));
			member.setM_add(request.getParameter("add"));
			member.setM_empdate(request.getParameter("empdate"));
			member.setD_idx(request.getParameter("didx"));
			member.setM_level(Integer.parseInt(request.getParameter("level")));
			
			int n = addBookService.ABupdate(member);
			
			if(n>0) {
			model.addAttribute("midx",m_idx);
			model.addAttribute("didx",d_idx);
			System.out.println("멤버 프로필 수정 성공");
			}else {
				System.out.println("실패");
			}
			return "/addBook/abOK";
		}
		
		// 클릭한 사원 삭제
		@RequestMapping(value="/AddDelete.do") 
		public String MemberDelete(HttpServletRequest request,Model model) {
			int m_idx = Integer.parseInt(request.getParameter("midx"));
			int d_idx = Integer.parseInt(request.getParameter("didx"));
			
			addBookService.MemberDelete(m_idx);
			
			model.addAttribute("midx",m_idx);
			model.addAttribute("didx",d_idx);
			
			return "/addBook/abOK";
		}
		
}

	
	
	
	
	
	
	
	
	
	