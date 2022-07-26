package com.comme.missing_board;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import com.comme.board.BoardService;
import com.comme.member.MemberDTO;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.comme.files.FileDTO;
import com.comme.files.FileService;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@RequestMapping("/miss")
@Controller
public class MissingBoardController {
	@Autowired
	private MissingBoardService service;
	@Autowired
	private HttpSession session;
	@Autowired
	private FileService fileService;
	@Autowired
	private HttpSession httpSession;

	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/toMissing") // 실종게시판 요청 -> 이미지 꺼내기..?
	public String toMissing(@RequestParam(value = "curPage", defaultValue = "1") int curPage, Model model) throws Exception {
		Map<String, Object> map = service.selectAllMissing(curPage);
	    model.addAttribute("map", map);

		model.addAttribute("mainCategory", boardService.mainCategory());
		model.addAttribute("inquiry", boardService.inquiryCategory());
		return "/board/missing_board";
	}

	@ResponseBody
	@RequestMapping(value = "/search", produces="application/json; charset=utf-8") // 검색
	public Map<String, Object> search(@RequestParam(value = "category") String category, @RequestParam(value = "keywordMissing") String keywordMissing, 
			@RequestParam(value = "curPage", defaultValue = "1") int curPage) throws Exception {
		System.out.println(category+ " : " + keywordMissing);
		Map<String, Object> map = service.search(curPage, category, keywordMissing);
        map.put("category", category);
        map.put("keywordMissing", keywordMissing);
		System.out.println(map);
        return map;
	}

	@RequestMapping(value = "/toWrite") // 글쓰기 페이지 요청
	public String toWrite(Model model) throws Exception {
		model.addAttribute("mainCategory", boardService.mainCategory());
		model.addAttribute("inquiry", boardService.inquiryCategory());

		return "/board/write_missing";
	}

	@ResponseBody
	@RequestMapping(value = "/uploadSummernoteImageFile", produces = "application/json") // 파일
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile file) {
		JsonObject jsonObject = new JsonObject();

		String path = session.getServletContext().getRealPath("mbFile");
		File filePath = new File(path);
//		System.out.println(filePath);
		if (!filePath.exists())
			filePath.mkdir();

		// String fileRoot = "C:\\summernote_image\\"; //저장될 외부 파일 경로
		String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자

		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

		File targetFile = new File(path+File.separator + savedFileName);
	

		
		  try { 
			  InputStream fileStream = file.getInputStream();
			  FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장 
			  	jsonObject.addProperty("url", "/mbFile/"+savedFileName); // 파일 url 값
				jsonObject.addProperty("responseCode", "success"); 
				jsonObject.addProperty("files_ori", originalFileName); // 파일 오리지널 네임 값
				jsonObject.addProperty("files_sys", savedFileName); // 실제 서버에 저장되는 파일명 
				jsonObject.addProperty("files_upload", path); // 파일이 저장되는 경우
		  
		  } catch (IOException e) { 
			  FileUtils.deleteQuietly(targetFile); //저장된 파일 삭제
			  jsonObject.addProperty("responseCode", "error"); e.printStackTrace(); }
		 

		return jsonObject.toString();

	}
	@ResponseBody
	@RequestMapping(value="/toInsert") // 글작성
	public String toInsert(@RequestBody List<Map<String, Object>> jsonData) throws Exception{
		String[] imgSrc = ((String)jsonData.get(jsonData.size()-1).get("imgSrc[]")).split(","); // 게시물에 등록할때 남아잇는 파일의 정보를 구분자를 기준으로 잘라서 배열에 담아줌

		String board_title = (String)jsonData.get(jsonData.size()-1).get("board_title"); // 게시물 제목
		String board_content = (String)jsonData.get(jsonData.size()-1).get("board_content"); // 게시물 내용
		String miss_area = (String)jsonData.get(jsonData.size()-1).get("miss_area"); // 실종지역
		String miss_date = (String)jsonData.get(jsonData.size()-1).get("miss_date"); // 실종 날짜
		String animal_kind = (String)jsonData.get(jsonData.size()-1).get("animal_kind"); // 동물 종류
		String member_nickname = ((MemberDTO)httpSession.getAttribute("loginSession")).getMember_nickname();
		String member_id = ((MemberDTO)httpSession.getAttribute("loginSession")).getMember_id();

		MissingBoardDTO dto = new MissingBoardDTO(0, board_title, board_content, member_id, member_nickname, null, miss_area, miss_date, animal_kind, 0); // 아이디랑 닉네임은 나중에 세션에서 따오기

		service.insert(dto); // db에 저장
		
		service.boardFileCheck(jsonData, imgSrc, dto); // 파일 최종체크해서 인서트하거나 도중에 지운애들 디렉토리에서 삭제하는 메서드
		return "success";
	}
	
	@RequestMapping(value="/delete") // 글 삭제
	public String delete(int seq_board) throws Exception{
		service.delete(seq_board);
		// 삭제하려는 글번호로 저장된 파일 db 데이터들 불러와서 싹 삭제함
		fileService.delete_file(seq_board, "missing_file"); // 해당 글번호에 해당하는 모든 파일을 삭제할때 사용하는 메서드
		return "redirect:/miss/toMissing";
	}
	@RequestMapping(value="/toModify") // 글 수정페이지 요청
	public String toModify(int seq_board, Model model) throws Exception{
		Map<String, Object> map = service.selectOne(seq_board);
		model.addAttribute("map", map);
		
		return "/board/modify_missing";
	}
	@ResponseBody
	@RequestMapping(value="/modify") // 글 수정요청
	public String modify(@RequestBody List<Map<String, Object>> jsonData) throws Exception{
		String[] imgSrc = ((String)jsonData.get(jsonData.size()-1).get("imgSrc[]")).split(",");
		
		String seq_board = (String)jsonData.get(jsonData.size()-1).get("seq_board");
		String board_title = (String)jsonData.get(jsonData.size()-1).get("board_title"); // 게시물 제목
		String board_content = (String)jsonData.get(jsonData.size()-1).get("board_content"); // 게시물 내용
		String miss_area = (String)jsonData.get(jsonData.size()-1).get("miss_area"); // 실종지역
		String miss_date = (String)jsonData.get(jsonData.size()-1).get("miss_date"); // 실종 날짜
		String animal_kind = (String)jsonData.get(jsonData.size()-1).get("animal_kind"); // 동물 종류
		String member_nickname = ((MemberDTO)httpSession.getAttribute("loginSession")).getMember_nickname();
		String member_id = ((MemberDTO)httpSession.getAttribute("loginSession")).getMember_id();
		MissingBoardDTO dto = new MissingBoardDTO(Integer.parseInt(seq_board), board_title, board_content, member_id, member_nickname, null, miss_area, miss_date, animal_kind, 0); // 아이디랑 닉네임은 나중에 세션에서 따오기
		service.modify(dto);

		service.boardFileCheck(jsonData, imgSrc, dto);
		
		// db에 인서트되서 해당 글번호에 존재하고 잇는 파일들에 대한 정보를 가져옴
		List<FileDTO> deleteFiles = fileService.fileListMissing(Integer.parseInt(seq_board));
		service.boardModifyFileCk(deleteFiles, imgSrc);
		
		return "success";
	}

	@RequestMapping(value = "/toDetail") // 상세보기 페이지 요청
	public String toDeatil(int seq_board, Model model) throws Exception {
		service.updateView_count(seq_board);
		Map<String, Object> map= service.selectOne(seq_board);
		System.out.println(map.toString());

		model.addAttribute("map", map);

		model.addAttribute("mainCategory", boardService.mainCategory());
		model.addAttribute("inquiry", boardService.inquiryCategory());
		return "/board/missing_detail";
	}

}
