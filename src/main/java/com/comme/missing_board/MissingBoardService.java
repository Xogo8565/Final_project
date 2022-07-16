package com.comme.missing_board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comme.comment.CommentDAO;
import com.comme.files.FileDAO;

@Service
public class MissingBoardService {
	@Autowired
	MissingBoardDAO dao;
	@Autowired
	FileDAO filedao;
	@Autowired
	CommentDAO commentdao;
	
	// 실종 게시판 요청
	public List<MissingBoardDTO> selectAllMissing() throws Exception{
		return dao.selectAllMissing();
	}
	
	// 검색 요청
	public List<MissingBoardDTO> search(String category, String keywordMissing) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("keywordMissing", keywordMissing);
		return dao.search(map);
	}
	// 조회수
	public void updateView_count(int seq_board) throws Exception{
		dao.updateView_count(seq_board);
	}
	// 상세보기 글 요청
	public Map<String, Object> selectOne(int seq_board) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("MissingBoardDTO", dao.selectOne(seq_board));
		map.put("FileDTO", filedao.selectByMissing(seq_board));
		map.put("commentDTO", commentdao.selectByMc(seq_board));
		return map;
	}
	// 글 작성
	public void insert(MissingBoardDTO dto) throws Exception{
		dao.insert(dto);
	}
	// 글 삭제
	public void delete(int seq_board) throws Exception{
		dao.delete(seq_board);
	}
}
