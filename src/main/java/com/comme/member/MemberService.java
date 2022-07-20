package com.comme.member;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.comme.utils.EncryptionUtils;

@Service
public class MemberService {
	@Autowired
	private MemberDAO dao;
//	@Autowired
//	private JavaMailSenderImpl mailSender;
	
	// 아이디 중복확인
	public int idCheck(String id) throws Exception {
		return dao.idCheck(id);
	}
	
	// 이메일 중복확인
	public int emailCheck(String email) throws Exception {
		return dao.emailCheck(email);
	}
	
	// 일반회원 회원가입
	public void signupGeneral(MemberDTO dto) throws Exception {
		dto.setMember_pw(EncryptionUtils.getSHA512(dto.getMember_pw()));
		dao.signupGeneral(dto);
	}
	
	// 기관회원 회원가입
	public void signupBusiness(MemberDTO dto) throws Exception {
		dto.setMember_pw(EncryptionUtils.getSHA512(dto.getMember_pw()));
		dao.signupBusiness(dto);
	}
	
	// 로그인 요청
	public MemberDTO loginProc(String member_id, String member_pw) throws Exception {
		member_pw = EncryptionUtils.getSHA512(member_pw);
		Map<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("member_pw", member_pw);
		return dao.loginProc(map);
	}
	
	// 아이디찾기(이메일)
	public String findToEmail(String member_email) throws Exception {
		return dao.findToEmail(member_email);
	}
	
	// 아이디찾기(전화번호)
	public String findToPhone(String member_phone) throws Exception {
		return dao.findToPhone(member_phone);
	}
	
	
}
