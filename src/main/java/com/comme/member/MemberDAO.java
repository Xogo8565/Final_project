package com.comme.member;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {
	
	int idCheck(String id); // 아이디 중복확인 
	
	int emailCheck(String email); // 이메일 중복확인
	
	void signupGeneral(MemberDTO dto); // 일반회원 회원가입
	
	void signupBusiness(MemberDTO dto); // 기관회원 회원가입
	
	MemberDTO loginProc(Map<String, Object> map); // 로그인
	
	String findToEmail(String member_email); // 아이디찾기 (이메일)
	
	String findToPhone(String member_phone); // 아이디찾기 (전화번호)
	
	void changePw(Map<String, Object> map); // 비밀번호찾기 -> 비밀번호변경
	

}
