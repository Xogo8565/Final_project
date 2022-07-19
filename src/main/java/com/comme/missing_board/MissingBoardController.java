package com.comme.missing_board;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.comme.board.BoardDTO;
import com.comme.files.FileDTO;
import com.comme.utils.PagingVO;
import com.google.gson.JsonObject;

@RequestMapping("/miss")
@Controller
public class MissingBoardController {
	@Autowired
	private MissingBoardService service;
	@Autowired
	private HttpSession session;

	@RequestMapping(value = "/toMissing") // 실종게시판 요청 -> 이미지 꺼내기..?
	public String toMissing(PagingVO vo, Model model, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception {
		int total = 0;
		if (nowPage == null && cntPerPage == null) { // 처음 게시판에 접속하면 얻게 되는 기본 페이지 값 cntPerPage 조절하면 몇개뿌릴지 선택가능함
			nowPage = "1";
			cntPerPage = "20";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "20";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<MissingBoardDTO> list = service.selectAllMissing();
		
		model.addAttribute("paging", vo); // 페이징정보
		model.addAttribute("list", list);
		return "/board/missing_board";
	}

	@ResponseBody
	@RequestMapping(value = "/search") // 검색
	public List<MissingBoardDTO> search(String category, String keywordMissing) throws Exception {
		System.out.println("카테고리 : " + category);
		System.out.println("키워드 : " + keywordMissing);

		List<MissingBoardDTO> list = service.search(category, keywordMissing);
		System.out.println(list.toString());
		return list;
	}

	@RequestMapping(value = "/toWrite") // 글쓰기 페이지 요청
	public String toWrite() throws Exception {
		return "/board/write_missing";
	}

	@ResponseBody
	@RequestMapping(value = "/uploadSummernoteImageFile", produces = "application/json") // 파일
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile file) {
		JsonObject jsonObject = new JsonObject();

		String path = session.getServletContext().getRealPath("mbFile");
		File filePath = new File(path);
		System.out.println(filePath);
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
		System.out.println("jsonData : " + jsonData); // 한번이라도 업로드된 파일정보 + 폼데이타 폼 데이터는 마지막에 오브젝트로 변환하고 푸시해줫기 때문에 항상 마지막 인자값임
		String[] imgSrc = ((String)jsonData.get(jsonData.size()-1).get("imgSrc[]")).split(","); // 게시물에 등록할때 남아잇는 파일의 정보를 구분자를 기준으로 잘라서 배열에 담아줌
		for(int i = 0; i < imgSrc.length; i++) {
			System.out.println("imgSrc : " + imgSrc[i]);
		}
		String board_title = (String)jsonData.get(jsonData.size()-1).get("board_title"); // 게시물 제목
		String board_content = (String)jsonData.get(jsonData.size()-1).get("board_content"); // 게시물 내용
		String miss_area = (String)jsonData.get(jsonData.size()-1).get("miss_area"); // 실종지역
		String miss_date = (String)jsonData.get(jsonData.size()-1).get("miss_date"); // 실종 날짜
		String animal_kind = (String)jsonData.get(jsonData.size()-1).get("animal_kind"); // 동물 종류
		
		MissingBoardDTO dto = new MissingBoardDTO(0, board_title, board_content, "test", "test", null, miss_area, miss_date, animal_kind, 0); // 아이디랑 닉네임은 나중에 세션에서 따오기
		service.insert(dto); // db에 저장
		
		service.boardFileCheck(jsonData, imgSrc, dto); // 파일 최종체크해서 인서트하거나 도중에 지운애들 디렉토리에서 삭제하는 메서드
		return "success";
	}
	
	@RequestMapping(value="/delete") // 글 삭제
	public String delete(int seq_board) throws Exception{
		System.out.println("글 삭제 번호 : " +seq_board);
		service.delete(seq_board);
		return "redirect:/miss/toMissing";
	}
	@RequestMapping(value="/toModify") // 글 수정페이지 요청
	public String toModify(int seq_board, Model model) throws Exception{
		System.out.println("글 수정 번호 : " + seq_board);
		Map<String, Object> map = service.selectOne(seq_board);
		model.addAttribute("map", map);
		
		return "/board/write_missing";
	}
	@RequestMapping(value="/modify") // 글 수정요청 -> 더해야함..^^
	public String modify(@RequestBody List<Map<String, Object>> jsonData) throws Exception{
		System.out.println("jsonData : " + jsonData);
		String[] imgSrc = ((String)jsonData.get(jsonData.size()-1).get("imgSrc[]")).split(",");
		if(imgSrc.length > 0) {
			for(int i = 0; i < imgSrc.length; i++) {
				System.out.println("imgSrc : " + imgSrc[i]);
			}
		}
		
		String seq_board = (String)jsonData.get(jsonData.size()-1).get("seq_board");
		String board_title = (String)jsonData.get(jsonData.size()-1).get("board_title"); // 게시물 제목
		String board_content = (String)jsonData.get(jsonData.size()-1).get("board_content"); // 게시물 내용
		String miss_area = (String)jsonData.get(jsonData.size()-1).get("miss_area"); // 실종지역
		String miss_date = (String)jsonData.get(jsonData.size()-1).get("miss_date"); // 실종 날짜
		String animal_kind = (String)jsonData.get(jsonData.size()-1).get("animal_kind"); // 동물 종류
		
		MissingBoardDTO dto = new MissingBoardDTO(Integer.parseInt(seq_board), board_title, board_content, "test", "test", null, miss_area, miss_date, animal_kind, 0); // 아이디랑 닉네임은 나중에 세션에서 따오기
		service.modify(dto);
		
		service.boardFileCheck(jsonData, imgSrc, dto);
		
		// db에 인서트되서 해당 글번호에 존재하고 잇는 파일들에 대한 정보를 가져옴
		List<FileDTO> deleteFiles = fileService.deleteFileList(Integer.parseInt(seq_board));
		service.boardModifyFileCk(deleteFiles, imgSrc);
		
		return dto.getSeq_category();
	}

	@RequestMapping(value = "/toDetail") // 상세보기 페이지 요청
	public String toDeatil(int seq_board, Model model) throws Exception {
		System.out.println("게시글 번호 : " + seq_board);
		service.updateView_count(seq_board);
		Map<String, Object> map= service.selectOne(seq_board);
		System.out.println(map.get("MissingBoardDTO"));
		System.out.println(map.get("FileDTO"));
		System.out.println(map.get("commentDTO"));
		model.addAttribute("map", map);
		return "/board/missing_detail";
	}

}
