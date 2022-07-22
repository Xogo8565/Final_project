package com.comme.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.comme.support_board.SupportBoardDTO;

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
	
}
