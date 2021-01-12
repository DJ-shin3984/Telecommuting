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
import com.tel.model.ConferenceService;

	@Controller
	public class ConferenceController {
		private ConferenceService conferenceService;
	
		@Autowired
		public ConferenceController(ConferenceService conferenceService) {
			super();
			this.conferenceService = conferenceService;
		}

		// 회의록 메뉴 클릭시 보여줄 회의메뉴 
		@RequestMapping(value="/CFmainDP.do") 
		public String mainDP(HttpServletRequest request,Model model) {
			int midx = Integer.parseInt(request.getParameter("midx"));
//			System.out.println(midx);
			MemberDTO member = conferenceService.member(midx);
//			System.out.println("레벨: "+member.getM_level());
			
			List<DepartmentDTO> dep_list = conferenceService.dep_list();

			model.addAttribute("member",member);
			model.addAttribute("dep_list",dep_list);
			
			return "/conference/CFmainDP";
		}
		
		// 클릭한 부서 회의게시판 리스트
		@RequestMapping(value="/depCFList.do") 
		public String depCFList(HttpServletRequest request,Model model) {
			int m_idx = Integer.parseInt(request.getParameter("midx"));
			int d_idx = Integer.parseInt(request.getParameter("didx"));
			System.out.println("클릭한 부서의 번호: "+d_idx);
			
			List<ConferenceDTO> CFlist = conferenceService.CFlist(d_idx);

			model.addAttribute("CFlist",CFlist);
			model.addAttribute("midx",m_idx);
			model.addAttribute("didx",d_idx);
			
			return "/conference/CFlist";
		}
		
		// 회의게시판 글쓰기
		@RequestMapping(value="/CFWriter.do") 
		public String CFWriter(HttpServletRequest request,Model model) {
			int m_idx = Integer.parseInt(request.getParameter("midx"));
			int d_idx = Integer.parseInt(request.getParameter("didx"));
			
			model.addAttribute("midx",m_idx);
			model.addAttribute("didx",d_idx);
			
			return "/conference/CFinsert";
		}
		
		// 회의게시판 글쓰기
		@RequestMapping(value="/insertCF.do") 
		public String insertCF(HttpServletRequest request,Model model) {
			int m_idx = Integer.parseInt(request.getParameter("midx"));
			int d_idx = Integer.parseInt(request.getParameter("didx"));
			
			ConferenceDTO cfDTO = new ConferenceDTO();
			cfDTO.setM_idx(Integer.parseInt(request.getParameter("midx")));
			cfDTO.setD_idx(Integer.parseInt(request.getParameter("didx")));
			cfDTO.setC_Title(request.getParameter("title"));
			cfDTO.setC_Content(request.getParameter("content"));
			
			conferenceService.insertCF(cfDTO);
			
			model.addAttribute("midx",m_idx);
			model.addAttribute("didx",d_idx);
			
			return "/conference/cfOK";
		}
		
		//  게시글 상세보기
			@RequestMapping(value="/CFdetail.do") 
			public String CFdetail(HttpServletRequest request,Model model) {
			int m_idx = Integer.parseInt(request.getParameter("midx"));
			int d_idx = Integer.parseInt(request.getParameter("didx"));
			int c_idx = Integer.parseInt(request.getParameter("cidx"));
			
			ConferenceDTO cfDTO = conferenceService.CFdetail(c_idx);

			System.out.println("상세보기");
			model.addAttribute("midx",m_idx);
			model.addAttribute("didx",d_idx);
			model.addAttribute("cfDTO",cfDTO);
			
			return "/conference/cfDetail";
		}
				
}

	
	
	
	
	
	
	
	
	
	