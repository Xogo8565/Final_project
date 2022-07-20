package com.comme.missing_board;

import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.comme.files.FileService;
import com.comme.utils.PagingVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comme.board.BoardDTO;
import com.comme.comment.CommentDAO;
import com.comme.files.FileDAO;
import com.comme.files.FileDTO;

@Service
public class MissingBoardService{
	@Autowired
	MissingBoardDAO dao;
	@Autowired
	FileService fileService;
	@Autowired
	CommentDAO commentdao;
	
	// 실종 게시판 요청
	public Map<String,Object> selectAllMissing(int curPage) throws Exception {
        int total = dao.selectTotalCnt(null,null);
        Map<String, Object> map = new HashMap<>();
        PagingVO pagingVO = new PagingVO(total, curPage, 12);
        List<Map<String, Object>> list = dao.selectAllMissing(pagingVO.getStart(), pagingVO.getEnd());
        map.put("pagingVO", pagingVO);
        map.put("list", list);

        return map;
    }
	
	// 검색 요청
	public Map<String, Object> search(int curPage, String category, String keywordMissing) throws Exception{
		 int total = dao.selectTotalCnt(category, keywordMissing);
	        Map<String, Object> map = new HashMap<>();
	        PagingVO pagingVO = new PagingVO(total, curPage, 12);
	        List<Map<String, Object>> list = dao.searchMissing(pagingVO.getStart(), pagingVO.getEnd(), category, keywordMissing);
	        map.put("pagingVO", pagingVO);
	        map.put("list", list);
	        
		return map;
	}
	// 조회수
	public void updateView_count(int seq_board) throws Exception{
		dao.updateView_count(seq_board);
	}
	// 상세보기 글 요청
	public Map<String, Object> selectOne(int seq_board) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("MissingBoardDTO", dao.selectOne(seq_board));
		map.put("FileDTO", fileService.selectByMissing(seq_board));
		map.put("commentDTO", commentdao.selectByMc(seq_board));
		map.put("commentCount", commentdao.selectCount(seq_board));
		return map;
	}
	// 글 작성
	public void insert(MissingBoardDTO dto) throws Exception{
		dao.insert(dto);
	}
		
	public void boardFileCheck(List<Map<String, Object>> jsonData, String[] imgSrc, MissingBoardDTO dto) throws Exception{
		for(int i = 0; i < jsonData.size()-1; i++) { // 파일정보만 비교할거라 마지막인자는 폼의 값이므로 -1해서 돌려줌
			if(Arrays.asList(imgSrc).contains("/mbFile/" + (String)jsonData.get(i).get("files_sys"))) { // 게시물 등록할때 남아잇는 파일정보랑 모든 파일정보랑 비교해서 일치하면 트루 아니면 펄스
				FileDTO fileDTO = new FileDTO(0, dto.getSeq_board(), (String)jsonData.get(i).get("files_upload"), (String)jsonData.get(i).get("files_ori"), (String)jsonData.get(i).get("files_sys"));
				fileService.insert_file(fileDTO, "missing_file"); // 남아잇는 파일정보랑 넘겨받은 파일정보랑 동일해서 db에 저장해줌
			}else { // 이 말은 즉 사용자가 이미지를 쓸려고 썸머노트에 올렷다가 지운경우임 그래서 최종에는 없지만 파일이 업로드된거
				File garbageFile = new File(
						(String)jsonData.get(i).get("files_upload") + File.separatorChar  + (String)jsonData.get(i).get("files_sys")); // 그 i번째 파일을 파일객체 선언함
				if(garbageFile.exists()) { // 디렉토리에 남아잇는지 체크 사실 무조건 잇는게 정배긴함
					garbageFile.delete(); // 삭제
				}
			}
		}
	}
	
	public void boardModifyFileCk(List<FileDTO> deleteFiles, String[] imgSrc) throws Exception{
		for(int i = 0; i < deleteFiles.size(); i++) {
			if(!Arrays.asList(imgSrc).contains("/mbFile/" + deleteFiles.get(i).getFiles_sys())) { // 수정할때 남아잇는 파일의 정보와 db에 해당 글번호로 인서트 되어 있던 파일 정보를 비교함 잇으면 트루 없으면 펄스
				File garbageFile = new File(
						deleteFiles.get(i).getFiles_upload() + File.separatorChar  + deleteFiles.get(i).getFiles_sys());
				if(garbageFile.exists()) {
					garbageFile.delete(); // 실제 파일을 삭제
					fileService.deleteByFileSys(deleteFiles.get(i).getFiles_sys()); // db에서도 삭제해줌 sysname 으로 명확히 지정해서 삭제
				}
			}
		}
	}
	
	// 글 수정
	public void modify(MissingBoardDTO dto) throws Exception{
		dao.modify(dto);
	}
	
	// 글 삭제
	public void delete(int seq_board) throws Exception{
		dao.delete(seq_board);
	}
}
