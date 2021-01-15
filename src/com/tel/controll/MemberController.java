package com.tel.controll;

import java.io.FileOutputStream;
import java.io.InputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tel.entity.MemberDTO;
import com.tel.model.KakaoProfile;
import com.tel.model.MemberService;
import com.tel.model.OAuthToken;

@Controller
public class MemberController {
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	private MemberService memberService;

	@Autowired
	public MemberController(MemberService memberService) {
		super();
		this.memberService = memberService;
	}

// 카카오 회원가입 로그인 ------------------------------------------
	@RequestMapping(value = "/jojnK.do")
	public String kakaoCheck() {
		System.out.println("joinK 이동!");
		return "/join/joinK";
	}	
// 카카오 로그아웃 ------------------------------------------
	@RequestMapping(value = "/kakaologout.do")
	public String kakaologout() {
		return "../../index";
	}	
		
	// 카카오 로그인------------------------------------------
	@RequestMapping(value = "/kakaologin.do" ,produces="application/json;charset=UTF-8",  method = {RequestMethod.POST,  RequestMethod.GET})
	public String kakaoCallback(String code,Model model) throws JSONException {  // @ResponseBody로 인해 Date를 return해주는 컨트롤러 함수가 된다.
		
		RestTemplate rt = new RestTemplate(); 
		
		// HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		
		// HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type","authorization_code");
		params.add("client_id","dd12c43fae150aab7ef90981f5b597ea");
		params.add("redirect_uri","http://localhost:8080/Tel/kakaologin.do");
		params.add("code",code);
		
		// HttpHeader 와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequset = new HttpEntity<>(params,headers);
		
		// Http 요청하기 - Post 방식으로 - 그리고 response 변수의 응답 받음
		ResponseEntity<String> response = rt.exchange(
			"https://kauth.kakao.com/oauth/token",
			HttpMethod.POST,
			kakaoTokenRequset,
			String.class
		);		
		
		// Gson, Json Simple, ObjectMapper
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken=null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		System.out.println("카카오 엑세스 토큰: "+oauthToken.getAccess_token());
		
		String token = oauthToken.getAccess_token();
		model.addAttribute("token",token);
		
		// 프로필 가져오기
		RestTemplate rt2 = new RestTemplate(); 
		
		// HttpHeader 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization","Bearer "+token);
		headers2.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		
		
		// HttpHeader 와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequset = new HttpEntity<>(headers2);
		
		System.out.println("해더2: "+headers2.get("Authorization").toString());
		System.out.println("카카오메리2: "+kakaoProfileRequset.getHeaders());
		
		// Http 요청하기 - Post 방식으로 - 그리고 response 변수의 응답 받음
		ResponseEntity<String> response2 = rt2.exchange(
			"https://kapi.kakao.com/v2/user/me",
			HttpMethod.POST,
			kakaoProfileRequset,
			String.class
			);	
			
		System.out.println("ㄴㅇㅁㄴㅇ: "+response2.getBody());
		
		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoprofile = null;
		try {
			kakaoprofile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		//User 오브젝트:
		System.out.println("카카오 아이디(번호): "+kakaoprofile.getId());
		System.out.println("카카오 이메일: "+kakaoprofile.getKakao_account().getEmail());
		
		model.addAttribute("KPF",kakaoprofile);  // KPF=kakaoProFile
		
		return "/join/join";
	}
		
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
	public String insertJoin(HttpServletRequest request ,@RequestParam("m_photo") MultipartFile file, Model model) throws Exception {
		System.out.println("회원가입 컨트롤!!");
//		System.out.println("파일 이름 : " + file.getOriginalFilename());
//      System.out.println("파일 크기 : " + file.getSize());
        
		MemberDTO member = new MemberDTO();
		member.setM_name(request.getParameter("m_name"));
		member.setM_id(request.getParameter("m_id"));
		member.setM_pw(request.getParameter("m_pw"));
		member.setM_phone(request.getParameter("m_phone"));
		member.setM_subphone(request.getParameter("m_subphone"));
		member.setM_email(request.getParameter("m_email"));
		member.setM_add(request.getParameter("m_add"));
		member.setM_empdate(request.getParameter("m_empdate"));
		member.setD_idx(request.getParameter("d_idx"));
		member.setM_level(Integer.parseInt(request.getParameter("m_level")));
		
		//파일 이름
		String fileName = member.getM_empdate()+file.getOriginalFilename().toString();
		member.setM_photo(fileName);
		
		//저장 경로
		String fileSaveRoute = "C:/Users/kkm/git/Telecommuting/web/resources/profileImage/";
		System.out.println("저장 파일 이름: "+fileName);
		
		try (
			FileOutputStream fos = new FileOutputStream(fileSaveRoute+fileName);
            InputStream is = file.getInputStream();
        ) {
			 int readCount = 0;
             byte[] buffer = new byte[1024];
             while ((readCount = is.read(buffer)) != -1) {
            	 fos.write(buffer, 0, readCount); 
             }
		}catch (Exception ex) {
            throw new RuntimeException("file Save Error");
        }
		
		int n = memberService.insertMember(member);
		System.out.println("n: "+n);
		if(n>0) {
			System.out.println("회원가입 성공");
		}else {
			System.out.println("회원가입 실패");
		}
		
		return "../../index";
	}
		
	//로그인화면으로 이동-------------------------------------
	@RequestMapping(value="/login.do") 
	public String login() {
		return "../../index"; 
	}
				
	// 로그인------------------------------------------
	@RequestMapping(value = "/checklogin.do" , method = RequestMethod.POST)
	public String checklogin(HttpServletRequest request, Model model) throws Exception {

		MemberDTO member = new MemberDTO();
		
		String loginId = request.getParameter("id");
		String loginPw = request.getParameter("pw");
		
		member.setM_id(loginId);
		member.setM_pw(loginPw);
		
		member = memberService.checklogin(member);
			
		if(member != null) {
//			att.setM_idx(member.getM_idx());
//			memberService.onTime(att);
			
			System.out.println("didx: "+member.getD_idx());
			System.out.println("midx: "+member.getM_idx());
			
			model.addAttribute("member",member); 
			
			return "/login/logOK";
		}else {
			System.out.println("로긘 실패");
			return "login/logFail";
		}
	}
	
	// 로그아웃------------------------------------------
	@RequestMapping(value="/logout.do")
	public String logout(HttpServletRequest request) {
		System.out.println("로그아웃");
		HttpSession session=request.getSession();
		MemberDTO dto = null;
		try {
			dto=(MemberDTO)session.getAttribute("member");
		} catch (Exception e) {
			e.printStackTrace();
			dto=null;
		}
		if(dto != null){
			System.out.println("로그아웃");
			session.removeAttribute("attDTO"); 
			session.removeAttribute("midx"); 
			session.removeAttribute("didx"); 
			session.removeAttribute("member"); 
			session.removeAttribute("iwlistSessiom"); 
			session.removeAttribute("dwlistSessiom"); 
		}
		return "/login/logout";
	}
}
