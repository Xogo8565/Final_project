package com.comme.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {
	@Autowired
	private CommentDAO dao;
	
	// 실종게시판 댓글 입력
	public void insertMissing(CommentDTO dto) throws Exception{
		dao.insertMissing(dto);
	}
	// 실종게시판 댓글 삭제
	public void deleteMissing(int seq_comment) throws Exception{
		dao.deleteMissing(seq_comment);
	}
	// 실종게시판 댓글 수정
	public void modifyMissing(int seq_comment, String comment_content) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("seq_comment", seq_comment);
		map.put("comment_content", comment_content);
		dao.modifyMissing(map);
	}

    public List<CommentDTO> missingComment(int seq_board) {
		return dao.selectByMc(seq_board);
    }
}
