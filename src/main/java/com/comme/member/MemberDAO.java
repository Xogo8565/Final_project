package com.comme.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {
	
	int idCheck(String id); // 아이디 중복확인 
	
	void signupGeneral(MemberDTO dto); // 일반회원 회원가입

}
