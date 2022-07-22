package com.comme.missing_board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MissingBoardDAO {
	
	// 목록 뿌려주기
	 List<Map<String, Object>> selectAllMissing(@Param("start") int start, @Param("end") int end) throws Exception;
	int selectTotalCnt(@Param("category") String category, @Param("keywordMissing") String keywordMissing) throws Exception;
	// 검색
	List<Map<String, Object>> searchMissing(@Param("start") int start, @Param("end") int end,@Param("category") String category, @Param("keywordMissing") String keywordMissing ) throws Exception;
	
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
