package com.comme.comment;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.comme.files.FileDTO;

@Mapper
public interface CommentDAO {
	
	// 실종게시판 댓글
	List<FileDTO> selectByMc(int seq_board);
	
	// 실종게시판 댓글 입력
	void insertMissing(CommentDTO dto);
	
	// 실종게시판 댓글 삭제
	void deleteMissing(int seq_comment);
	
	// 실종게시판 댓글 수정
	void modifyMissing(Map<String, Object> map);
	// 실종게시판 댓글 갯수
	int selectCount(int seq_board);
}
