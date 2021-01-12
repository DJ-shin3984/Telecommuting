package com.tel.controll;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tel.entity.AttendanceDTO;
import com.tel.entity.DepartmentDTO;
import com.tel.entity.Department_work_DTO;
import com.tel.entity.Individual_work_DTO;
import com.tel.entity.MemberDTO;
import com.tel.model.MainService;

	@Controller
	public class MainController {
		private MainService mainService;
	
		@Autowired
		public MainController(MainService mainService) {
			super();
			this.mainService = mainService;
		}
		

		//메인 페이지 출력
		@RequestMapping(value="/mainDP.do") 
		public String mainDP(HttpServletRequest request,Model model) {
			System.out.println("메인 페이지 왔습니다.");
			int mIdx = Integer.parseInt(request.getParameter("midx"));
			int dIdx = Integer.parseInt(request.getParameter("didx"));
			MemberDTO member = mainService.member(mIdx);
			
			HttpSession session=request.getSession();
			
			List<Individual_work_DTO> iw_list = mainService.iw_list(mIdx);
			List<Department_work_DTO> dw_list = mainService.dw_list(dIdx);
			
			AttendanceDTO attDTO = new AttendanceDTO();
			Date date_now = new Date(System.currentTimeMillis());
			SimpleDateFormat selectdateformat = new SimpleDateFormat("yyyy년 MM월 dd일");
			String selectTime = selectdateformat.format(date_now);
			attDTO.setA_goTime(selectTime);
			attDTO.setM_idx(mIdx);
			
			attDTO = mainService.checkTime(attDTO);
			
			session.setAttribute("attDTO", attDTO);
			session.setAttribute("midx", mIdx);
			session.setAttribute("didx", dIdx);
			session.setAttribute("member", member);
			session.setAttribute("iwlistSessiom", iw_list);
			session.setAttribute("dwlistSessiom", dw_list);
			return "main";
		}
		
		//부서별 월 주간 업무 페이지 출력
		@RequestMapping(value="/DMWWlist.do") 
		public String DMWWlist(HttpServletRequest request,Model model) {
			int mIdx = Integer.parseInt(request.getParameter("midx"));
			int dIdx = Integer.parseInt(request.getParameter("didx"));
			
			List<Department_work_DTO> dw_list = mainService.dw_list(dIdx);
			String depName = mainService.depName(dIdx);
			
			model.addAttribute("dwlist",dw_list); // 부서번호에 해당하는 부서업무 리스트
			model.addAttribute("depName",depName); 
			model.addAttribute("midx",mIdx); 
			return "/DMWW/DMWWlist";
		}
		
		//개인업무 등록페이지 이동
		@RequestMapping(value="/IWwriter.do") 
		public String IWwriter(HttpServletRequest request,Model model) {
			String midx = request.getParameter("midx");
			String didx = request.getParameter("didx");
//			System.out.println("midx: "+midx);
//			System.out.println("didx: "+midx);
			model.addAttribute("midx",midx); 
			model.addAttribute("didx",midx); 
			return "/individual/IWinsert"; // kim_board.jsp에서 개인업무등록버튼 누르면 이동하게끔. 근데 이파일이름이 MemberController라서
			//이 do 내용의 조정이 필요할듯 , 설정 방법을 알고싶음
		}
		
		//개인업무 등록 insert
		@RequestMapping(value="/IWwriter.do", method = RequestMethod.POST) 
		public String IWinsert(HttpServletRequest request,Model model) {
			int M_idx=Integer.parseInt(request.getParameter("m_idx"));
			int D_idx=Integer.parseInt(request.getParameter("d_idx"));
			String iw_title=request.getParameter("iw_title");
			String iw_content=request.getParameter("iw_content");
			Individual_work_DTO iwDTO = new Individual_work_DTO();
			
			iwDTO.setM_idx(M_idx);
			iwDTO.setIw_title(iw_title);
			iwDTO.setIw_content(iw_content);
			
			int n = mainService.IWwriter(iwDTO);
			
			if(n > 0) {
				System.out.println("개인업무 추가 성공");
				model.addAttribute("midx",M_idx); 
				model.addAttribute("didx",D_idx); 
			}else {
				System.out.println("개인업무 추가 실패");
			}
			return "/individual/iwOK"; 
		}
		
		//개인업무 삭제
		@RequestMapping(value="/IWDelete.do" , method = RequestMethod.GET) 
		public String IWDelete(HttpServletRequest request,Model model) {
			int M_idx=Integer.parseInt(request.getParameter("midx"));  
			int D_idx=Integer.parseInt(request.getParameter("didx")); 
			int iw_idx=Integer.parseInt(request.getParameter("iw_idx"));  
			int n = mainService.IWDelete(iw_idx);
			
			if(n>0) {
				System.out.println("정상삭제완료");
				model.addAttribute("midx",M_idx);
				model.addAttribute("didx",D_idx);
			}
			else {
				System.out.println("삭제실패");
			}
			
			return "/individual/iwOK"; 
		}
		
		//개인업무 수정페이지 이동
		@RequestMapping(value="/IWModify.do") 
		public String IWModify(HttpServletRequest request,Model model) {
			int D_idx=Integer.parseInt(request.getParameter("didx"));
			Individual_work_DTO iwDTO = new Individual_work_DTO();
			iwDTO.setIw_idx(Integer.parseInt(request.getParameter("iw_idx")));
			iwDTO.setM_idx(Integer.parseInt(request.getParameter("midx")));
			iwDTO.setIw_title(request.getParameter("iw_title"));
			iwDTO.setIw_content(request.getParameter("iw_content"));

			model.addAttribute("didx",D_idx);
			model.addAttribute("iwDTO",iwDTO);
			
			return "/individual/IWmodify"; 

		}
		
		//개인업무 수정
		@RequestMapping(value="/IWUpdate.do" , method = RequestMethod.POST) 
		public String IWUpdate(HttpServletRequest request,Model model) {
			Individual_work_DTO iwDTO = new Individual_work_DTO();
			
			String D_idx=request.getParameter("d_idx");
			iwDTO.setM_idx(Integer.parseInt(request.getParameter("m_idx")));
			iwDTO.setIw_idx(Integer.parseInt(request.getParameter("iw_idx")));
			iwDTO.setIw_title(request.getParameter("iw_title"));
			iwDTO.setIw_content(request.getParameter("iw_content"));
			
			int n = mainService.IWUpdate(iwDTO);
			
			if(n>0) {
				System.out.println("정상수정완료");
				model.addAttribute("didx",D_idx);
				model.addAttribute("midx",iwDTO.getM_idx());
			}
			else {
				System.out.println("수정실패");
			}
			return "/individual/iwOK"; 

		}
		
		// 부서별 월/주 업무 메뉴 클릭시 보여줄 회의메뉴 
		@RequestMapping(value="/DMWWmainDP.do") 
		public String DMWWmainDP(HttpServletRequest request,Model model) {
			int midx = Integer.parseInt(request.getParameter("midx"));
			int didx = Integer.parseInt(request.getParameter("didx"));
			List<DepartmentDTO> dep_list = mainService.dep_list();
			MemberDTO member = mainService.member(midx);
			
			model.addAttribute("member",member);
			model.addAttribute("dep_list",dep_list);
			
			return "/DMWW/DMWWmainDP";
		}
		
		//부서업무 등록페이지 이동
		@RequestMapping(value="/DWwriter.do") 
		public String DWwriter(HttpServletRequest request,Model model) {
			System.out.println("부서업무 등록");
			String midx = request.getParameter("midx");
			String didx = request.getParameter("didx");
			System.out.println("midx2: "+midx);
			System.out.println("didx2: "+didx);
			model.addAttribute("midx",midx); 
			model.addAttribute("didx",didx); 
			return "/department/DWinsert";
		}
		
		//부서업무 등록 insert
		@RequestMapping(value="/DWinsert.do", method = RequestMethod.POST) 
		public String DWinsert(HttpServletRequest request,Model model) {
			int M_idx=Integer.parseInt(request.getParameter("m_idx"));
			int D_idx=Integer.parseInt(request.getParameter("d_idx"));
			String dw_title=request.getParameter("dw_title");
			String dw_content=request.getParameter("dw_content");
			String dw_schedule=request.getParameter("dw_schedule");
			String dw_monthwork=request.getParameter("dw_monthwork");
			String dw_weekwork=request.getParameter("dw_weekwork");
			
			Department_work_DTO dwDTO = new Department_work_DTO();
			
			dwDTO.setD_idx(D_idx);
			dwDTO.setDw_title(dw_title);
			dwDTO.setDw_content(dw_content);
			dwDTO.setDw_schedule(dw_schedule);
			dwDTO.setDw_monthwork(dw_monthwork);
			dwDTO.setDw_weekwork(dw_weekwork);
			
			int n = mainService.DWinsert(dwDTO);
			
			if(n > 0) {
				System.out.println("부서업무 추가 성공");
				model.addAttribute("midx",M_idx); 
				model.addAttribute("didx",D_idx); 
			}else {
				System.out.println("개인업무 추가 실패");
			}
			return "/department/dwOK"; 
		}

		
		//부서업무 삭제
		@RequestMapping(value="/DWDelete.do" , method = RequestMethod.GET) 
		public String DWDelete(HttpServletRequest request,Model model) {
			int M_idx=Integer.parseInt(request.getParameter("midx"));  
			int D_idx=Integer.parseInt(request.getParameter("didx")); 
			int dw_idx=Integer.parseInt(request.getParameter("dw_idx")); 
			
			int n = mainService.DWDelete(dw_idx);
			
			if(n>0) {
				System.out.println("정상삭제완료");
				model.addAttribute("midx",M_idx);
				model.addAttribute("didx",D_idx);
			}
			else {
				System.out.println("삭제실패");
			}
			
			return "/department/dwOK"; 
		}
		
		//개인업무 수정페이지 이동
		@RequestMapping(value="/DWModify.do") 
		public String DWModify(HttpServletRequest request,Model model) {
			int M_idx=Integer.parseInt(request.getParameter("midx"));
			Department_work_DTO dwDTO = new Department_work_DTO();
			dwDTO.setDw_idx(Integer.parseInt(request.getParameter("dw_idx")));
			dwDTO.setD_idx(Integer.parseInt(request.getParameter("didx")));
			dwDTO.setDw_title(request.getParameter("dw_title"));
			dwDTO.setDw_content(request.getParameter("dw_content"));
			dwDTO.setDw_schedule(request.getParameter("dw_schedule"));
			dwDTO.setDw_monthwork(request.getParameter("dw_monthwork"));
			dwDTO.setDw_weekwork(request.getParameter("dw_weekwork"));

			model.addAttribute("midx",M_idx);
			model.addAttribute("dwDTO",dwDTO);
			
			return "/department/DWmodify"; 

		}

		//개인업무 수정
		@RequestMapping(value="/DWUpdate.do" , method = RequestMethod.POST) 
		public String DWUpdate(HttpServletRequest request,Model model) {
			Department_work_DTO iwDTO = new Department_work_DTO();
			
			int M_idx=Integer.parseInt(request.getParameter("m_idx"));
			Department_work_DTO dwDTO = new Department_work_DTO();
			dwDTO.setD_idx(Integer.parseInt(request.getParameter("d_idx")));
			dwDTO.setDw_idx(Integer.parseInt(request.getParameter("dw_idx")));
			dwDTO.setDw_title(request.getParameter("dw_title"));
			dwDTO.setDw_content(request.getParameter("dw_content"));
			dwDTO.setDw_schedule(request.getParameter("dw_schedule"));
			dwDTO.setDw_monthwork(request.getParameter("dw_monthwork"));
			dwDTO.setDw_weekwork(request.getParameter("dw_weekwork"));
			
			int n = mainService.DWUpdate(dwDTO);
			
			if(n>0) {
				System.out.println("정상수정완료");
				model.addAttribute("didx",dwDTO.getD_idx());
				model.addAttribute("midx",M_idx);
			}
			else {
				System.out.println("수정실패");
			}
			return "/department/dwOK"; 

		}
		
		
}

	
	
	
	
	
	
	
	
	
	