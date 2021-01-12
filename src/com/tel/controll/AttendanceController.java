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

import com.tel.entity.AttendanceDTO;
import com.tel.entity.MemberDTO;
import com.tel.model.AttendanceService;

	@Controller
	public class AttendanceController {
		private  AttendanceService Service;
	
		@Autowired
		public AttendanceController(AttendanceService Service) {
			super();
			this.Service = Service;
		}

		// 근태 메뉴 클릭시 보여줄 dp
		@RequestMapping(value="/AttmainDP.do") 
		public String mainDP(HttpServletRequest request,Model model) {
			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			int didx = (int) session.getAttribute("didx");
			
			//로그인 한 사원의 정보
			MemberDTO member = Service.member(midx);
			model.addAttribute("member",member);
			
			//didx 부서번호로 해당 부서의 사원들 리스트!
			AttendanceDTO attDTO = new AttendanceDTO();
			attDTO.setD_idx(didx);
			attDTO.setM_idx(midx);
			
			Date date_now = new Date(System.currentTimeMillis());
			SimpleDateFormat selectdateformat = new SimpleDateFormat("yyyy년 MM월 dd일");
			String selectTime = selectdateformat.format(date_now);
			
			attDTO.setA_goTime(selectTime);
			
			List<AttendanceDTO> dm_list = Service.dMember(attDTO);
			model.addAttribute("dm_list",dm_list);
			
			for (int i = 0; i < dm_list.size(); i++) {
				System.out.println("멤버이름: "+dm_list.get(i).getM_name()+
						"\n멤버 출근시간: "+dm_list.get(i).getA_goTime());
			}
			
			
			return "/attendance/attMain";
		}
		
		// 출근 클릭 
		@RequestMapping(value="/AttGoTime.do") 
		public String AttGoTime(HttpServletRequest request,Model model) {
			HttpSession session = request.getSession();
			
			int midx = (int) session.getAttribute("midx");
			int didx = (int) session.getAttribute("didx");
			
			AttendanceDTO attDTO = new AttendanceDTO();
			
			Date date_now = new Date(System.currentTimeMillis());
			SimpleDateFormat dateformat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초"); 
			String today = dateformat.format(date_now);
			
			SimpleDateFormat selectdateformat = new SimpleDateFormat("yyyy년 MM월 dd일");
			String selectTime = selectdateformat.format(date_now);

			attDTO.setA_goTime(selectTime);
			attDTO.setM_idx(midx);
			
			int n = Service.checkTime(attDTO);
			
			System.out.println("n값: "+n);
			
			if(n < 1) {
			String latitude = request.getParameter("latitude");
			String longitude = request.getParameter("longitude");
			
			attDTO.setA_goTime(today);
			attDTO.setA_offTime("퇴근 안함");
			attDTO.setA_place_lat(latitude);
			attDTO.setA_place_lon(longitude);
			attDTO.setM_idx(midx);
			attDTO.setD_idx(didx);
			
			Service.onTime(attDTO);
			System.out.println("출근 성공 !!");
			return "/attendance/attOK";
			}else {
				System.out.println("출근 실패 !!");
				return "/attendance/attFail";
			}
		}

		// 퇴근 클릭 
		@RequestMapping(value="/AttOffTime.do") 
		public String AttOffTime(HttpServletRequest request,Model model) {
			HttpSession session = request.getSession();
			
			int midx = (int) session.getAttribute("midx");
			int didx = (int) session.getAttribute("didx");
			
			String latitude = request.getParameter("latitude");
			String longitude = request.getParameter("longitude");

			AttendanceDTO attDTO = new AttendanceDTO();
			
			Date date_now = new Date(System.currentTimeMillis());
			SimpleDateFormat dateformat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
			String todayOffTime = dateformat.format(date_now);
			
			SimpleDateFormat offdateformat = new SimpleDateFormat("yyyy년 MM월 dd일");
			String OffTime = offdateformat.format(date_now);
			
			System.out.println("offtime: "+OffTime);
			
			attDTO.setA_offTime(todayOffTime);
			attDTO.setA_goTime(OffTime);
			attDTO.setA_place_lat(latitude);
			attDTO.setA_place_lon(longitude);
			attDTO.setM_idx(midx);
			
			int n = Service.offTime(attDTO);
			if(n>0) {
				System.out.println("퇴근 성공");
			}
			return "/attendance/attOK";
		}
			
		
		
}

	
	
	
	
	
	
	
	
	
	