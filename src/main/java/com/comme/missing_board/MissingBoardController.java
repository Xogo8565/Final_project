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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.comme.utils.PagingVO;
import com.google.gson.JsonObject;

@RequestMapping("/miss")
@Controller
public class MissingBoardController {
	@Autowired
	private MissingBoardService service;
	@Autowired
	private HttpSession session;

	@RequestMapping(value = "/toMissing") // 실종게시판 요청
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
			  jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
			  jsonObject.addProperty("responseCode", "success");
		  
		  } catch (IOException e) { 
			  FileUtils.deleteQuietly(targetFile); //저장된 파일 삭제
			  jsonObject.addProperty("responseCode", "error"); e.printStackTrace(); }
		 

		return jsonObject.toString();

	}
	@RequestMapping(value="/toInsert") // 글작성
	public String toInsert(MissingBoardDTO dto) throws Exception{
		System.out.println(dto.toString());
		service.insert(dto);
		return "redirect:/miss/toMissing";
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
	public String modify(MissingBoardDTO dto) throws Exception{
		System.out.println("글수정 : " + dto.toString());
		return "";
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
