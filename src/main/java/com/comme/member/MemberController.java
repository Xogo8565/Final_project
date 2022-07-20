package com.comme.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping(value = "/member")
@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private HttpSession session;

	@RequestMapping(value = "/toLoginPage") // 로그인페이지 요청
	public String toLogin() {
		return "member/login";
	}
	
	@ResponseBody
	@RequestMapping(value= "/loginProc") // 로그인 버튼을 눌렀을 때
	public String loginProc(String member_id, String member_pw) throws Exception {
		System.out.println("id : " + member_id + " / pw : " + member_pw);
		MemberDTO dto = service.loginProc(member_id, member_pw);
		if(dto != null) {
			session.setAttribute("loginSession", dto);
			System.out.println(((MemberDTO)session.getAttribute("loginSession")).toString());
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping(value = "/toSignupPage") // 회원가입 페이지 요청
	public String toSignup() {
		return "member/signup";
	}
	
	@RequestMapping(value= "/toSingup_general") // 일반회원가입 페이지 요청
	public String toSingup_general() {
		return "member/signup_general";
	}
	
	@RequestMapping(value= "/toSignup_business") // 기관회원가입 페이지 요청
	public String toSignup_business() {
		return "member/signup_business";
	}
	
	@ResponseBody
	@RequestMapping(value= "/idCheck") // 아이디 중복확인
	public String idCheck(String id) throws Exception {
		System.out.println("id : " + id);
		int rs = service.idCheck(id);
		if (rs == 0) {
			return "ok";
		} else {
			return "nope";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value= "/emailCheck") // 이메일 중복확인
	public String emailCheck(String email) throws Exception {
		System.out.println("email : " + email);
		int rs = service.emailCheck(email);
		if (rs == 0) {
			return "ok";
		} else {
			return "nope";
		}
	}
	
	
	@RequestMapping(value = "/signupGeneral") // 일반회원 회원가입
	public String signupGeneral(MemberDTO dto) throws Exception {
		service.signupGeneral(dto);
		return "redirect:/member/toLoginPage";
	}
	
	
	@RequestMapping(value = "/signupBusiness") // 기관회원 회원가입
	public String signupBusiness(MemberDTO dto) throws Exception {
		service.signupBusiness(dto);
		return "redirect:/member/toLoginPage";
	}

	
	@RequestMapping(value = "/toFindIdPage") // 아이디 찾기 페이지 요청
	public String toFindIdPage() {
		return "member/findId";
	}
	
	@ResponseBody
	@RequestMapping(value = "/findToEmail") // 아이디찾기 (이메일)
	public String findToEmail(String member_email) throws Exception {
		String member_id = service.findToEmail(member_email);
		return member_id;
	}
	
	@ResponseBody
	@RequestMapping(value = "/findToPhone") // 아이디찾기 (전화번호)
	public String findToPhone(String member_phone) throws Exception {
		System.out.println(member_phone);
		String member_id = service.findToPhone(member_phone);
		return member_id;
	}
	
	@RequestMapping(value = "/toFindPwPage") // 비밀번호 찾기 페이지 요청
	public String toFindPwPage() {
		return "member/findPw";
	}
	

	
	@RequestMapping(value= "/toError") // 에러페이지로 이동
	public String toError() {
		return "error";
	}

	@ExceptionHandler
	public String handleError(Exception e){
		System.out.println("에러 발생");
		e.printStackTrace();
		return "redirect:/toError";
	}

	
}
