package com.comme.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping(value = "/toFindIdPage") // 아이디 찾기 페이지 요청
	public String toFindIdPage() {
		return "member/findId";
	}
	
	@RequestMapping(value = "/toFindPwPage") // 비밀번호 찾기 페이지 요청
	public String toFindPwPage() {
		return "member/findPw";
	}
	
}
