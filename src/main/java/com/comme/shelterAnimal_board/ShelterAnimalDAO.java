package com.comme.shelterAnimal_board;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ShelterAnimalDAO {
	
	void insert(ShelterAnimalDTO dto);
	
	ShelterAnimalDTO selectDetail(String desertionNo) throws Exception;
}
