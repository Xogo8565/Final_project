package com.comme.shelterAnimal_board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ShelterAnimalDAO {
	
	void insert(ShelterAnimalDTO dto);
	
	List<ShelterAnimalDTO> selectAll(Map<String, Object> map);

	List<ShelterAnimalDTO> selectKeyword(Map<String, Object> map);
	
	int selectTotalCnt();
	
	int selectKeywordCount(String keyword); 
	
	ShelterAnimalDTO selectDetail(String desertionNo) throws Exception;
}
