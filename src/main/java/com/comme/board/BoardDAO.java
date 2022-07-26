package com.comme.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.comme.category.CategoryDTO;
import com.comme.comment.CommentDTO;

@Mapper
public interface BoardDAO {
	
	int countBoard(Map<String, Object> map);
	
	int countBySearch(Map<String, Object> map);
	
	List<Map<String, Object>> selectAllBoard(Map<String, Object> map);
	
	List<Map<String, Object>> searchBoard(Map<String, Object> map);
	
	BoardDTO selectByModify(int seq_board);
	
	List<CategoryDTO> selectCategory(int seq_category);
	
	void insertBoard(BoardDTO dto);
	
	Board_CLOB detailPost(int seq_board);
	
	void commentInsert(CommentDTO dto);
	
	List<CommentDTO> selectComment(int seq_board);
	
	void updateView(int seq_board);
	
	String bigCategory(int seq_category);
	
	void deletePost(int seq_board);
	
	void deleteComment(int seq_comment);
	
	void updateComment(CommentDTO dto);
	
	void updateBoard(BoardDTO dto);
	
	List<CategoryDTO> mainCategory();
	
	CategoryDTO inquiryCategory();
	
	List<Map<String, Object>> mainContent();
	
}
