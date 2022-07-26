package com.comme.board;

import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comme.category.CategoryDTO;
import com.comme.comment.CommentDTO;
import com.comme.files.FileDTO;
import com.comme.files.FileService;
import com.comme.utils.PagingVO;

@Service
public class BoardService {
	@Autowired
	private BoardDAO dao;
	@Autowired
	private FileService fileService;
	
	// 해당 글번호에 해당하는 모든 파일을 삭제할때 사용하는 메서드
	public void deleteFiles(List<FileDTO> deleteFiles) throws Exception{
		if(deleteFiles.size() > 0) {
			for(int i = 0; i < deleteFiles.size(); i++) {
				File garbageFile = new File(
						deleteFiles.get(i).getFiles_upload() + File.separatorChar  + deleteFiles.get(i).getFiles_sys());
				if(garbageFile.exists()) {
					garbageFile.delete();
				}
			}
		}
	}
	
	public void boardModifyFileCk(List<FileDTO> deleteFiles, String[] imgSrc) throws Exception{
		for(int i = 0; i < deleteFiles.size(); i++) {
			if(!Arrays.asList(imgSrc).contains("/files/" + deleteFiles.get(i).getFiles_sys())) { // 수정할때 남아잇는 파일의 정보와 db에 해당 글번호로 인서트 되어 있던 파일 정보를 비교함 잇으면 트루 없으면 펄스
				File garbageFile = new File(
						deleteFiles.get(i).getFiles_upload() + File.separatorChar  + deleteFiles.get(i).getFiles_sys());
				if(garbageFile.exists()) {
					garbageFile.delete(); // 실제 파일을 삭제
					fileService.deleteByFileSys(deleteFiles.get(i).getFiles_sys()); // db에서도 삭제해줌 sysname 으로 명확히 지정해서 삭제
				}
			}
		}
	}
	
	
	public void boardFileCheck(List<Map<String, Object>> jsonData, String[] imgSrc, BoardDTO dto) throws Exception{
		for(int i = 0; i < jsonData.size()-1; i++) { // 파일정보만 비교할거라 마지막인자는 폼의 값이므로 -1해서 돌려줌
			if(Arrays.asList(imgSrc).contains("/files/" + (String)jsonData.get(i).get("files_sys"))) { // 게시물 등록할때 남아잇는 파일정보랑 모든 파일정보랑 비교해서 일치하면 트루 아니면 펄스
				FileDTO fileDTO = new FileDTO(0, dto.getSeq_board(), (String)jsonData.get(i).get("files_upload"), (String)jsonData.get(i).get("files_ori"), (String)jsonData.get(i).get("files_sys"));
				fileService.insertFile(fileDTO); // 남아잇는 파일정보랑 넘겨받은 파일정보랑 동일해서 db에 저장해줌
			}else { // 이 말은 즉 사용자가 이미지를 쓸려고 썸머노트에 올렷다가 지운경우임 그래서 최종에는 없지만 파일이 업로드된거
				File garbageFile = new File(
						(String)jsonData.get(i).get("files_upload") + File.separatorChar  + (String)jsonData.get(i).get("files_sys")); // 그 i번째 파일을 파일객체 선언함
				if(garbageFile.exists()) { // 디렉토리에 남아잇는지 체크 사실 무조건 잇는게 정배긴함
					garbageFile.delete(); // 삭제
				}
			}
		}
	}
	
	public int countBoard(int seq_category, int small_category, String category_name, String member_id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("seq_category", seq_category);
		map.put("small_category", small_category);
		map.put("category_name", category_name);
		map.put("member_id", member_id);
		return dao.countBoard(map);
	}
	
	public int countBySearch(int seq_category, int small_category , String category_name , String member_id, String search_type, String search_keyword) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("seq_category", seq_category);
		map.put("small_category", small_category);
		map.put("category_name", category_name);
		map.put("member_id", member_id);
		map.put("search_type", search_type);
		map.put("search_keyword", search_keyword);
		return dao.countBySearch(map);
	}

	public List<Map<String, Object>> selectAllBoard(PagingVO vo, int seq_category, int small_category, String category_name , String member_id) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("seq_category", seq_category);
		map.put("small_category", small_category);
		map.put("category_name", category_name);
		map.put("member_id", member_id);
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		return dao.selectAllBoard(map);
	}
	
	public List<Map<String, Object>> searchBoard(PagingVO vo, int seq_category, int small_category, String search_type, String search_keyword, String category_name , String member_id) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("seq_category", seq_category);
		map.put("small_category", small_category);
		map.put("category_name", category_name);
		map.put("member_id", member_id);
		map.put("search_type", search_type);
		map.put("search_keyword", search_keyword);
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		return dao.searchBoard(map);
	}
	
	public List<CategoryDTO> selectCategory(int seq_category) throws Exception{
		return dao.selectCategory(seq_category);
	}
	
	
	public void insertBoard(BoardDTO dto) throws Exception{
		dao.insertBoard(dto);
	}
	
	public Board_CLOB detailPost(int seq_board) throws Exception{
		return dao.detailPost(seq_board);
	}
	
	public void commentInsert(CommentDTO dto) throws Exception{
		dao.commentInsert(dto);
	}
	
	public List<CommentDTO> selectComment(int seq_board) throws Exception{
		return dao.selectComment(seq_board);
	}
	
	public void updateView(int seq_board) throws Exception{
		dao.updateView(seq_board);
	}
	
	public String bigCategory(int seq_category) throws Exception{
		return dao.bigCategory(seq_category);
	}
	
	public void deletePost(int seq_board) throws Exception{
		dao.deletePost(seq_board);
	}
	
	public void deleteComment(int seq_comment) throws Exception{
		dao.deleteComment(seq_comment);
	}
	
	public void updateComment(CommentDTO dto) throws Exception{
		dao.updateComment(dto);
	}
	
	public BoardDTO selectByModify(int seq_board) throws Exception{
		return dao.selectByModify(seq_board);
	}
	
	public void updateBoard(BoardDTO dto) throws Exception{
		dao.updateBoard(dto);
	}
	
	public List<CategoryDTO> mainCategory() throws Exception{
		return dao.mainCategory();
	}
	
	public CategoryDTO inquiryCategory() throws Exception{
		return dao.inquiryCategory();
	}
	
	public List<Map<String, Object>> mainContent() throws Exception{
		return dao.mainContent();
	}
}
