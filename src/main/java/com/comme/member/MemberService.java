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

@Component
@Service
public class MemberService {
	@Autowired
	private MemberDAO dao;
	@Autowired
	private JavaMailSenderImpl mailSender;
	
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
	

	// 비밀번호 찾기(이메일 인증)

	public int makeRandomNumber() { // 난수생성
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		int authNumber = checkNum;
		return authNumber;
	}

	public String joinEmail(String email) { //이메일 보낼 양식
		int authNumber = makeRandomNumber();
		String setFrom = "alsrbald04@gmail.com";
		String toMail = email;
		String title = "비밀번호 찾기 인증 이메일입니다."; // 이메일 제목 
		String content = 
				"Comme 비밀번호 찾기 인증 이메일입니다.." + 
		        "<br><br>" + 
			    "인증 번호는 " + authNumber + " 입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		//이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	public void mailSend(String setFrom, String toMail, String title, String content) { //이메일 전송
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	
	// 비밀번호 찾기 -> 비밀번호 변경
	public void changePw(String member_email, String member_pw) throws Exception {
		member_pw = EncryptionUtils.getSHA512(member_pw);
		System.out.println(member_email + " : " + member_pw);
		Map<String, Object> map = new HashMap<>();
		map.put("member_pw", member_pw);
		map.put("member_email", member_email);
		System.out.println(map);
		dao.changePw(map);
		
	}
	
	

}
