package com.tel.controll;



import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

//	// 회원가입 클릭시 회원가입.jsp로 이동 -------------------------------------
//	@RequestMapping(value="/join.do")
//	public String join() {
//		System.out.println("회원가입 창으로 이동");
//		return "login/join";
//	}
	
	// 아이디 중복확인 -------------------------------------
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String idCheck(@RequestParam("userId") String user_id) {
		System.out.println("테스트: "+user_id);
		Integer n = memberService.selectMember(user_id);
		System.out.println("n: " + n);
		return n.toString();
	}
	
	// 회원가입 -------------------------------------
	@RequestMapping(value = "/insertJoin.do", method = RequestMethod.POST)
	public String insertJoin(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("회원가입");
		
		MemberDTO member = new MemberDTO();
		member.setId(request.getParameter("user_id"));
		member.setPw(request.getParameter("inputPW"));
		member.setName(request.getParameter("inputName"));
		member.setPhone(request.getParameter("inputPhone"));
		
		int n = memberService.insertMember(member);
		System.out.println("n: "+n);
		if(n>0) {
			System.out.println("회원가입 성공");
		}else {
			System.out.println("회원가입 실패");
		}
		return "test";
	}
	
//	//로그인화면으로 이동-------------------------------------
//		@RequestMapping(value="/login.do") 
//		public String login() {
//			return "login/login"; 
//		}
//
//	//로그인------------------------------------------
//		@RequestMapping(value="/checklogin.do")
//			public String checklogin(HttpServletRequest request) {
//
//			String loginId = request.getParameter("id");
//			String loginPw = request.getParameter("pw");
//			
//			System.out.println("loginId: " + loginId);
//			System.out.println("loginPw: " + loginPw);
//			
//			MemberDTO member = new MemberDTO();
//			member =memberService.checklogin(loginId,loginPw);
//			
////			System.out.println("mIdx : " + member.getM_idx());
////			System.out.println("name : " + member.getName());
//
//			if(member!=null) {
//			HttpSession session=request.getSession();
//			session.setAttribute("logOK", member);
//			}else {
//				return "login/logFail";
//			}
//			return "login/logOK";
//		}
//	
//		@RequestMapping(value="/logout.do")
//		public String logout(HttpServletRequest request) {
//			HttpSession session=request.getSession();
//			MemberDTO dto = null;
//			try {
//				dto=(MemberDTO)session.getAttribute("logOK");
//			} catch (Exception e) {
//				e.printStackTrace();
//				dto=null;
//			}
//			if(dto != null)
//			{
//				session.removeAttribute("logOK"); 
//				session.removeAttribute("list"); 
//			}
//			return "login/logoutOK";
//		}
		
}
