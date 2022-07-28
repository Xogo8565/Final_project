package com.comme.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comme.board.BoardDAO;
import com.comme.category.CategoryDTO;
import com.comme.member.BlackListDTO;
import com.comme.utils.PagingVO;

@Service
public class ManagerService implements ManagerDAO {
	@Autowired
	private ManagerDAO dao;
	@Autowired
	private BoardDAO boardDao;
	
	public void insertBlackList(BlackListDTO dto) throws Exception {
		dao.insertBlackList(dto);
	}
	
	public List<Map<String, Object>> selectAll(int start, int end) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return dao.selectAll(map);
	}
	
	public List<Map<String, Object>> selectAllBlackList(int start, int end) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return dao.selectAllBlackList(map);
	}
	
	public List<Map<String, Object>> search(String category, String keyword, int start, int end) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);		
		return dao.search(map);
	}
	
	public List<Map<String, Object>> searchGrade(String member_grade, int start, int end) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("member_grade", member_grade);
		map.put("start", start);
		map.put("end", end);	
		return dao.searchGrade(map);
	}
	
	public BlackListDTO selectId(String member_id) throws Exception {
		return dao.selectId(member_id);
	}
	
	public int modifyGrade(String member_id, String member_grade) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("member_grade", member_grade);
		return dao.modifyGrade(map);
	}
	
	public int deleteBlackList(String member_id) throws Exception {
		return dao.deleteBlackList(member_id);
	}
	
	public Map<String, Object> getAllPage(int curPage) {
		int totalCnt = dao.totalCnt(); 
		int recordCntPerPage = 10; 
		int naviCntPerPage = 10; 
		
		return getPage(curPage, totalCnt, recordCntPerPage, naviCntPerPage);
	}

	public Map<String, Object> getSearchPage(int curPage, String category, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);
		int totalCnt = dao.searchKeywordCnt(map); 
		int recordCntPerPage = 10; 
		int naviCntPerPage = 10; 
		
		return getPage(curPage, totalCnt, recordCntPerPage, naviCntPerPage);
	}
	
	public Map<String, Object> getSearchGradePage(int curPage, String member_grade) {
		int totalCnt = dao.searchGradeCnt(member_grade);
		int recordCntPerPage = 10; 
		int naviCntPerPage = 10; 
		
		return getPage(curPage, totalCnt, recordCntPerPage, naviCntPerPage);
	}
	
	public Map<String, Object> getBlackListPage(int curPage) {
		int totalCnt = dao.blackListCnt(); 
		int recordCntPerPage = 10; 
		int naviCntPerPage = 10; 
		
		return getPage(curPage, totalCnt, recordCntPerPage, naviCntPerPage);
	}

	public Map<String, Object> getPage(int curPage, int totalCnt, int recordCntPerPage, int naviCntPerPage) {
		int pageTotalCnt = 0; // 총 페이지 개수
		
		if (totalCnt % recordCntPerPage > 0) {
			pageTotalCnt = totalCnt / recordCntPerPage + 1;
		} else {
			pageTotalCnt = totalCnt / recordCntPerPage;
		}

		if (curPage < 1) {
			curPage = 1;
		} else if (curPage > pageTotalCnt) {
			curPage = pageTotalCnt;
		}

		int startNavi = ((curPage - 1) / naviCntPerPage) * naviCntPerPage + 1;
		int endNavi = startNavi + naviCntPerPage - 1;

		if (pageTotalCnt < endNavi) {
			endNavi = pageTotalCnt;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCnt) {
			needNext = false;
		}

		Map<String, Object> map = new HashMap<>();
		map.put("startNavi", startNavi);
		map.put("endNavi", endNavi);
		map.put("needPrev", needPrev);
		map.put("needNext", needNext);
		
		return map;
	}
	
	@Override
	public List<Map<String, Object>> selectAll(Map<String, Object> map) {
		return null;
	}

	@Override
	public List<Map<String, Object>> search(Map<String, Object> map) {
		return null;
	}
	
	@Override
	public int totalCnt() {
		return 0;
	}

	@Override
	public int searchKeywordCnt(Map<String, String> map) {
		return 0;
	}

	@Override
	public List<Map<String, Object>> searchGrade(Map<String, Object> map) {
		return null;
	}

	@Override
	public int searchGradeCnt(String member_id) {
		return 0;
	}

	@Override
	public int modifyGrade(Map<String, String> map) {
		return 0;
	}

	@Override
	public int blackListCnt() {
		return 0;
	}

	@Override
	public List<Map<String, Object>> selectAllBlackList(Map<String, Object> map) throws Exception {
		return null;
	}

	public List<CategoryDTO> selectCategory(int seq_category) throws Exception{
		return boardDao.selectCategory(seq_category);
	}

	@Override
	public void addMainCategory(CategoryDTO dto) throws Exception {
		dao.addMainCategory(dto);
	}

	@Override
	public void deleteCategory(int seq_cateogry) throws Exception {
		dao.deleteCategory(seq_cateogry);
	}

	@Override
	public void modifyCategory(CategoryDTO dto) throws Exception {
		dao.modifyCategory(dto);
	}

	@Override
	public void addSubCategory(CategoryDTO dto) throws Exception {
		dao.addSubCategory(dto);
	}

	public List<Map<String, Object>> userPayList(PagingVO vo, String search_type, String search_keyword) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("search_type", search_type);
		map.put("search_keyword", search_keyword);
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		return dao.userPayList(map);
	}

	public int countPay(String search_type , String search_keyword) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("search_type", search_type);
		map.put("search_keyword", search_keyword);
		return dao.countPay(map);
	}

	@Override
	public List<Map<String, Object>> userPayList(Map<String, Object> map) {
		return null;
	}

	@Override
	public int countPay(Map<String, Object> map) {
		return 0;
	}

	
	public int searchMoney(String search_type, String search_keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_type", search_type);
		map.put("search_keyword", search_keyword);
		return dao.searchMoney(map);
	}

	@Override
	public int searchMoney(Map<String, Object> map) {
		return 0;
	}


}
