package com.comme.manager;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.comme.category.CategoryDTO;
import com.comme.member.BlackListDTO;

@Mapper
public interface ManagerDAO {
	
	void insertBlackList(BlackListDTO dto) throws Exception;
	
	void addMainCategory(CategoryDTO dto) throws Exception;
	
	void addSubCategory(CategoryDTO dto) throws Exception;
	
	void deleteCategory(int seq_cateogry) throws Exception;
	
	void modifyCategory(CategoryDTO dto) throws Exception;
	
	List<Map<String, Object>> selectAll(Map<String, Object> map);
	
	List<Map<String, Object>> selectAllBlackList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> search(Map<String, Object> map);
	
	List<Map<String, Object>> searchGrade(Map<String, Object> map);
	
	List<Map<String, Object>> userPayList(Map<String, Object> map);
	
	BlackListDTO selectId(String member_id) throws Exception;
	
	int totalCnt();
	
	int searchKeywordCnt(Map<String, String> map);
	
	int searchGradeCnt(String member_grade);
	
	int blackListCnt();
	
	int modifyGrade(Map<String, String> map);
	
	int deleteBlackList(String member_id) throws Exception;
	
	int countPay(Map<String, Object> map);
	
	int searchMoney(Map<String, Object> map);
	
}
