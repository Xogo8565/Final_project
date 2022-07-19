package com.comme.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comme.utils.EncryptionUtils;

@Service
public class MemberService {
	@Autowired
	private MemberDAO dao;
	
	// 아이디 중복확인
	public int idCheck(String id) throws Exception {
		return dao.idCheck(id);
	}
	
	// 일반회원 회원가입
	public void signupGeneral(MemberDTO dto) throws Exception {
		dto.setMember_pw(EncryptionUtils.getSHA512(dto.getMember_pw()));
		dao.signupGeneral(dto);
	}

}
