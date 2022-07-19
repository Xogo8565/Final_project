package com.comme.missing_board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MissingBoardDAO {
	
	// 목록 뿌려주기
	List<MissingBoardDTO> selectAllMissing();
	// 검색
	List<MissingBoardDTO> search(Map<String, String> map);
	
	// 조회수 +1
	void updateView_count(int seq_board);
	
	// 글 상세보기
	MissingBoardDTO selectOne(int seq_board);
	
	//글 작성
	void insert(MissingBoardDTO dto);
	
	// 글 수정
	void modify(MissingBoardDTO dto);
	
	// 글 삭제
	void delete(int seq_board);
}
