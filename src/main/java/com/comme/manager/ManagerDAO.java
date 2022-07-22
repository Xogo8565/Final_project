package com.comme.manager;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.comme.member.BlackListDTO;
import com.comme.member.MemberDTO;

@Mapper
public interface ManagerDAO {
	
	void insertBlackList(BlackListDTO dto) throws Exception;
	
	List<Map<String, Object>> selectAll(Map<String, Object> map);
	
	List<Map<String, Object>> selectAllBlackList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> search(Map<String, Object> map);
	
	List<Map<String, Object>> searchGrade(Map<String, Object> map);
	
	int totalCnt();
	
	int searchKeywordCnt(Map<String, String> map);
	
	int searchGradeCnt(String member_grade);
	
	int blackListCnt();
	
	int modifyGrade(Map<String, String> map);
	
	int deleteBlackList(String member_id) throws Exception;
	
}
