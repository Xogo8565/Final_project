package com.comme.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping(value = "/member")
@Controller
public class MemberController {
	@Autowired
	private MemberService service;

	@RequestMapping(value = "/toLoginPage") // 로그인페이지 요청
	public String toLogin() {
		return "member/login";
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
		System.out.println("rs : " + rs);
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
	
	@RequestMapping(value = "/toFindIdPage") // 아이디 찾기 페이지 요청
	public String toFindIdPage() {
		return "member/findId";
	}
	
	@RequestMapping(value = "/toFindPwPage") // 비밀번호 찾기 페이지 요청
	public String toFindPwPage() {
		return "member/findPw";
	}
	
}
