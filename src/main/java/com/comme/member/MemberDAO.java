package com.comme.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {
	
	MemberDTO ProfileInfo(String member_id);
	
	int countComment(Map<String, Object> map);
	
	int countBoard(Map<String, Object> map);
	
	int countVolList(Map<String, Object> map);
	
	int countVolSt(String seq_board);
	
	int countMySP(String member_id);
	
	int countMyPayList(String member_id);
	
	int countPay(Map<String, Object> map);
	
	int countUserVol(Map<String, Object> map);
	
	String vol_status(String seq_submit);
	
	void updateVolSt(Map<String, Object> map);
	
	List<Map<String, Object>> selectComment(Map<String, Object> map);
	
	List<Map<String, Object>> selectMyBoard(Map<String, Object> map);
	
	List<Map<String, Object>> selectVolList(Map<String, Object> map);
	
	List<Map<String, Object>> mySupportBoard(Map<String, Object> map);
	
	List<Map<String, Object>> userPayList(Map<String, Object> map);
	
	List<Map<String, Object>> selectUserVol(Map<String, Object> map);
	
	List<Map<String, Object>> myPayList(Map<String, Object> map);
	
	int idCheck(String id); // 아이디 중복확인 
	
	int emailCheck(String email); // 이메일 중복확인
	
	int nicknameCheck(String nickname); // 닉네임 중복확인
	
	void signupGeneral(MemberDTO dto); // 일반회원 회원가입
	
	void signupBusiness(MemberDTO dto); // 기관회원 회원가입
	
	void updateMember(MemberDTO dto); // 회원 정보 수정
	
	MemberDTO loginProc(Map<String, Object> map); // 로그인
	
	String findToEmail(String member_email); // 아이디찾기 (이메일)
	
	String findToPhone(String member_phone); // 아이디찾기 (전화번호)
	
	void changePw(Map<String, Object> map); // 비밀번호찾기 -> 비밀번호변경
	
	void deleteMember(String member_id); // 회원탈퇴
}
