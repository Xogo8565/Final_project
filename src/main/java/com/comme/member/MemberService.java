package com.comme.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comme.support_board.SupportBoardDTO;
import com.comme.utils.PagingVO;

@Service
public class MemberService {
	@Autowired
	private MemberDAO dao;
	
	public MemberDTO ProfileInfo(String member_id) throws Exception{
		return dao.ProfileInfo(member_id);
	}
	
	public void updateVolSt(String seq_submit, String vol_status) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("seq_submit", seq_submit);
		map.put("vol_status", vol_status);
		dao.updateVolSt(map);
	}
	
	public int countVolSt(String seq_board) throws Exception{
		return dao.countVolSt(seq_board);
	}
	
	public int countMySP(String member_id) throws Exception{
		return dao.countMySP(member_id);
	}
	
	public int countMyPayList(String member_id) throws Exception{
		return dao.countMyPayList(member_id);
	}
	
	public int countPay(String member_id, String search_type , String search_keyword) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("search_type", search_type);
		map.put("search_keyword", search_keyword);
		return dao.countPay(map);
	}
	
	public int countUserVol(String member_id, String search_type , String search_keyword) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("search_type", search_type);
		map.put("search_keyword", search_keyword);
		return dao.countPay(map);
	}
	
	public String vol_status(String seq_submit) throws Exception{
		return dao.vol_status(seq_submit);
	}
	
	public int countComment(String comment_id, String search_keyword) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("comment_id", comment_id);
		map.put("search_keyword", search_keyword);
		return dao.countComment(map);
	}
	
	public int countBoard(String member_id, String search_type , String search_keyword) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("search_type", search_type);
		map.put("search_keyword", search_keyword);
		return dao.countBoard(map);
	}
	
	public int countVolList(String member_id, String search_type , String search_keyword) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("search_type", search_type);
		map.put("search_keyword", search_keyword);
		return dao.countVolList(map);
	}
	
	public List<Map<String, Object>> selectComment(PagingVO vo, String comment_id, String search_keyword) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("comment_id", comment_id);
		map.put("search_keyword", search_keyword);
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		return dao.selectComment(map);
	}
	
	public List<Map<String, Object>> selectMyBoard(PagingVO vo, String member_id, String search_type, String search_keyword) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("search_type", search_type);
		map.put("search_keyword", search_keyword);
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		return dao.selectMyBoard(map);
	}
	
	public List<Map<String, Object>> selectVolList(PagingVO vo, String member_id, String search_type, String search_keyword) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("search_type", search_type);
		map.put("search_keyword", search_keyword);
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		return dao.selectVolList(map);
	}
	
	public List<Map<String, Object>> userPayList(PagingVO vo, String member_id, String search_type, String search_keyword) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("search_type", search_type);
		map.put("search_keyword", search_keyword);
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		return dao.userPayList(map);
	}
	
	public List<Map<String, Object>> selectUserVol(PagingVO vo, String member_id, String search_type, String search_keyword) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("search_type", search_type);
		map.put("search_keyword", search_keyword);
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		return dao.selectUserVol(map);
	}
	
	public List<Map<String, Object>> mySupportBoard(PagingVO vo, String member_id) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		return dao.mySupportBoard(map);
	}
	
	public List<Map<String, Object>> myPayList(PagingVO vo, String member_id) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		return dao.myPayList(map);
	}
}
