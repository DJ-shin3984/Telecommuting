package com.tel.controll;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tel.entity.AttendanceDTO;
import com.tel.entity.MemberDTO;
import com.tel.model.MemberService;

@Controller
public class MemberController {
	private MemberService memberService;

	@Autowired
	public MemberController(MemberService memberService) {
		super();
		this.memberService = memberService;
	}

	// 로그인------------------------------------------
	@RequestMapping(value = "/checklogin.do" , method = RequestMethod.POST)
	public String checklogin(HttpServletRequest request) {

		MemberDTO member = new MemberDTO();
		AttendanceDTO att = new AttendanceDTO();
		
		String loginId = request.getParameter("id");
		String loginPw = request.getParameter("pw");
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		
		member.setM_id(loginId);
		member.setM_pw(loginPw);
		
		System.out.println("위도 경도:"+latitude+","+longitude);

		att.setA_place_lat(latitude);
		att.setA_place_lon(longitude);
		
		System.out.println("위도 경도2:"+att.getA_place_lat()+","+att.getA_place_lon());
		
		member = memberService.checklogin(member);
			
		if(member != null) {
			att.setM_idx(member.getM_idx());
			memberService.onTime(att);
			return "test";
		}else {
			System.out.println("로긘 실패");
			return "test";
		}
		
	}

}
