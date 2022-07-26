package com.comme.board;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.comme.comment.CommentDTO;
import com.comme.files.FileDTO;
import com.comme.files.FileService;
import com.comme.member.MemberDTO;
import com.comme.utils.PagingVO;
import com.google.gson.JsonObject;

@RequestMapping("/board")
@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	@Autowired
	private FileService fileService;
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = "/toBoard") // 게시판 목록 띄워주기
	public String toBoard(PagingVO vo, String seq_category, String small_category , Model model, String search_keyword, String search_type, String category_name
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception {
		
		// 하다보니까 변수명을 좀 그지같이 짯는데 요령껏 이해해주세요
		System.out.println("seq_category : " + seq_category); // 대분류 카테고리
		System.out.println("small_category : " + small_category); // 소분류 카테고리
		System.out.println("search_keyword : " + search_keyword); // 검색 키워드
		System.out.println("search_type : " + search_type); // 검색 타입
		System.out.println("category_name : " + category_name); // 카테고리네임
		
		if(small_category == null) { // 처음 그냥 대분류카테고리 누르고 들어오면 당연히 값이 없음
			small_category = "0";
		}
		
		if(category_name != null) {
			if(category_name.length() == 0) {
				category_name = null;
			}
		}
		
		String memberId = null;
		if((session.getAttribute("loginSession")) != null) {
			memberId = (((MemberDTO)session.getAttribute("loginSession")).getMember_id());
		}
		
		
		int total = 0; // 뿌려줄 게시물의 총 개수 계산하는거 검색 유무에 따라서 뿌려줄 게시물에 개수가 달라짐 소분류 카테고리 처리 유무는 위에서 0으로 처리해서 매퍼에 예외처리해줫음
		if(search_keyword == null) {
			total = service.countBoard(Integer.parseInt(seq_category), Integer.parseInt(small_category), category_name, memberId);
		}else {
			total = service.countBySearch(Integer.parseInt(seq_category), Integer.parseInt(small_category), category_name , memberId ,search_type, search_keyword);
		}
		
		
		System.out.println(total);
		if (nowPage == null && cntPerPage == null) { // 처음 게시판에 접속하면 얻게 되는 기본 페이지 값 cntPerPage 조절하면 몇개뿌릴지 선택가능함
			nowPage = "1";
			cntPerPage = "20";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "20";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage)); // 토탈, 현재페이지, 한페이지에뿌려줄 게시물수 인자로 넣으면 페이징 정보 세팅됨 feat(google)
		
		Map<String, Object> etcMap = new HashMap<>(); // 따로따로 넘기려니까 너무 더러워져서 그냥 맵에다 담아서 넘겨줌
		etcMap.put("search_type", search_type); // 검색타입
		etcMap.put("search_keyword", search_keyword); // 검색 키워드
		etcMap.put("category", Integer.parseInt(seq_category)); // 대분류 카테고리
		etcMap.put("small_category", Integer.parseInt(small_category)); // 소분류 카테고리
		etcMap.put("bigCategory", service.bigCategory(Integer.parseInt(seq_category))); // 대분류 카테고리 이름
		etcMap.put("category_name", category_name); // 문의 게시판만 걸려주려고 추가
		
		if(search_keyword == null) { // 검색유무에 따라 뿌려주는 페이지 갯수가 달라져서 두가지 경우의수로 나눈거
			model.addAttribute("list", service.selectAllBoard(vo, Integer.parseInt(seq_category), Integer.parseInt(small_category), category_name, memberId));
		}else {
			model.addAttribute("list", service.searchBoard(vo, Integer.parseInt(seq_category), Integer.parseInt(small_category), search_type, search_keyword, category_name, memberId));
		}
		model.addAttribute("paging", vo); // 페이징정보
		model.addAttribute("categoryMenu", service.selectCategory(Integer.parseInt(seq_category))); // 대분류 카테고리에 속한 소분류 카테고리의 목록
		model.addAttribute("etcMap", etcMap); // 잡다한거 넘기는거
		model.addAttribute("mainCategory", service.mainCategory()); // 상단바 카테고리
        model.addAttribute("inquiry", service.inquiryCategory()); // 상단바 문의 들어가기
		return "board/board";
	}
	
	@RequestMapping(value = "/toWrite") // 글 작성으로 이동
	public String toWrite(PagingVO vo , Model model, String seq_category, String seq_board, String small_category, String search_keyword, String search_type, String category_name) throws Exception {
		Map<String, Object> etcMap = new HashMap<>();
		
		etcMap.put("category", Integer.parseInt(seq_category)); // 대분류 카테고리 번호
		etcMap.put("bigCategory", service.bigCategory(Integer.parseInt(seq_category))); // 대분류 카테고리 이름 물고오기
		etcMap.put("small_category", Integer.parseInt(small_category)); // 소분류 카테고리 번호
		etcMap.put("search_type", search_type); // 검색 타입
		etcMap.put("search_keyword", search_keyword); // 검색 키워드
		etcMap.put("category_name", category_name); // 문의 체크
		
		model.addAttribute("paging", vo);
		  model.addAttribute("etcMap", etcMap);
		  model.addAttribute("categoryMenu", service.selectCategory(Integer.parseInt(seq_category))); // 대분류에 속해 있는 소분류 카테고리들
		  model.addAttribute("mainCategory", service.mainCategory()); // 상단바 카테고리
	      model.addAttribute("inquiry", service.inquiryCategory()); // 상단바 문의 들어가기
		  return "board/board_write";
	}
	
	@RequestMapping(value = "/toModifyBoard") // 글 수정으로 이동
	public String toModifyBoard(PagingVO vo , Model model, String seq_category, String seq_board, String small_category, String search_keyword, String search_type, String category_name) throws Exception {
		
		Map<String, Object> etcMap = new HashMap<>();
		
		etcMap.put("category", Integer.parseInt(seq_category)); // 대분류 카테고리 번호
		etcMap.put("bigCategory", service.bigCategory(Integer.parseInt(seq_category))); // 대분류 카테고리 이름 물고오기
		etcMap.put("small_category", Integer.parseInt(small_category)); // 소분류 카테고리 번호
		etcMap.put("search_type", search_type); // 검색 타입
		etcMap.put("search_keyword", search_keyword); // 검색 키워드
		etcMap.put("category_name", category_name); // 문의 체크
	
	  model.addAttribute("paging", vo);
	  model.addAttribute("etcMap", etcMap);
	  model.addAttribute("categoryMenu", service.selectCategory(Integer.parseInt(seq_category))); // 대분류에 속해 있는 소분류 카테고리들
	  model.addAttribute("dto", service.selectByModify(Integer.parseInt(seq_board))); // 수정할 게시물의 기존 정보
	  model.addAttribute("mainCategory", service.mainCategory()); // 상단바 카테고리
      model.addAttribute("inquiry", service.inquiryCategory()); // 상단바 문의 들어가기
	  
	  return "board/modifyPost";
	}
	
	@ResponseBody
	@RequestMapping(value = "/registerBoard") // 글 작성 후 다시 게시판 목록으로
	public int registerBoard(@RequestBody List<Map<String, Object>> jsonData) throws Exception {
		System.out.println("jsonData : " + jsonData); // 한번이라도 업로드된 파일정보 + 폼데이타 폼 데이터는 마지막에 오브젝트로 변환하고 푸시해줫기 때문에 항상 마지막 인자값임
		String[] imgSrc = ((String)jsonData.get(jsonData.size()-1).get("imgSrc[]")).split(","); // 게시물에 등록할때 남아잇는 파일의 정보를 구분자를 기준으로 잘라서 배열에 담아줌
		for(int i = 0; i < imgSrc.length; i++) {
			System.out.println("imgSrc : " + imgSrc[i]);
		}
		
		String memberId = null;
		String nickName = null;
		if((session.getAttribute("loginSession")) != null) {
			memberId = (((MemberDTO)session.getAttribute("loginSession")).getMember_id());
			nickName = (((MemberDTO)session.getAttribute("loginSession")).getMember_nickname());
		}
		
		String board_title = (String)jsonData.get(jsonData.size()-1).get("board_title"); // 게시물 제목
		String board_content = (String)jsonData.get(jsonData.size()-1).get("board_content"); // 게시물 내용
		int seq_category = Integer.parseInt((String) jsonData.get(jsonData.size()-1).get("seq_category")); // 게시물이 속한 소분류 카테고리 
		String notice = (String)jsonData.get(jsonData.size()-1).get("notice"); // 공지 상단에 고정여부
		if(notice == null) {
			notice = "N";
		}
		
		BoardDTO dto = new BoardDTO(0, board_title, board_content, memberId, nickName, null, 0, seq_category, notice); // 아이디랑 닉네임은 나중에 세션에서 따오기
		service.insertBoard(dto); // db에 저장
		
		service.boardFileCheck(jsonData, imgSrc, dto); // 파일 최종체크해서 인서트하거나 도중에 지운애들 디렉토리에서 삭제하는 메서드
		
		return dto.getSeq_board(); // 해당 글의 글번호 리턴해줌
	}
	
	@ResponseBody
	@RequestMapping(value = "/modifyBoard") // 글 수정 작성 후 다시 게시판 목록으로
	public int modifyBoard(@RequestBody List<Map<String, Object>> jsonData) throws Exception {
		// 위에 글작성하는거랑 거의 비슷함 마지막만 다름
		System.out.println("jsonData : " + jsonData);
		String[] imgSrc = ((String)jsonData.get(jsonData.size()-1).get("imgSrc[]")).split(",");
		if(imgSrc.length > 0) {
			for(int i = 0; i < imgSrc.length; i++) {
				System.out.println("imgSrc : " + imgSrc[i]);
			}
		}
		
		String memberId = null;
		String nickName = null;
		if((session.getAttribute("loginSession")) != null) {
			memberId = (((MemberDTO)session.getAttribute("loginSession")).getMember_id());
			nickName = (((MemberDTO)session.getAttribute("loginSession")).getMember_nickname());
		}
		
		String seq_board = (String)jsonData.get(jsonData.size()-1).get("seq_board");
		String board_title = (String)jsonData.get(jsonData.size()-1).get("board_title");
		String board_content = (String)jsonData.get(jsonData.size()-1).get("board_content");
		int seq_category = Integer.parseInt((String) jsonData.get(jsonData.size()-1).get("seq_category"));
		String notice = (String)jsonData.get(jsonData.size()-1).get("notice"); // 공지 상단에 고정여부
		
		BoardDTO dto = new BoardDTO(Integer.parseInt(seq_board), board_title, board_content, memberId, nickName, null, 0, seq_category, notice);
		service.updateBoard(dto);
		
		service.boardFileCheck(jsonData, imgSrc, dto);
		
		// db에 인서트되서 해당 글번호에 존재하고 잇는 파일들에 대한 정보를 가져옴
		List<FileDTO> deleteFiles = fileService.deleteFileList(Integer.parseInt(seq_board));
		service.boardModifyFileCk(deleteFiles, imgSrc);
		
		return dto.getSeq_category();
	}
	
	// 파일 업로드
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = session.getServletContext().getRealPath("files");	//저장될 외부 파일 경로
		System.out.println(fileRoot);
		File file = new File(fileRoot);
		if(!file.exists()) { // 디렉토리 존재여부 확인 후 폴더 생성
			file.mkdir();
		}
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + File.separator + savedFileName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/files/"+savedFileName); // 파일 url 값
			jsonObject.addProperty("responseCode", "success"); 
			jsonObject.addProperty("files_ori", originalFileName); // 파일 오리지널 네임 값
			jsonObject.addProperty("files_sys", savedFileName); // 실제 서버에 저장되는 파일명 
			jsonObject.addProperty("files_upload", fileRoot); // 파일이 저장되는 경우
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject.toString();
	}
	
	@RequestMapping(value = "/detailPost") // 상세보기페이지
	public String detailPost(PagingVO vo, String seq_category, String seq_board ,String small_category , Model model, String search_keyword, String search_type, String category_name
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception {
		
		// 그냥 게시판 들어오는거랑 90% 이상 흡사하니까 위에 꺼 참조하면됌
		System.out.println("seq_category : " + seq_category);
		System.out.println("seq_board : " + seq_board);
		System.out.println("small_category : " + small_category);
		System.out.println("search_keyword : " + search_keyword);
		System.out.println("search_type : " + search_type);
		System.out.println("category_name : " + category_name);
		System.out.println("상세보기게시판접속");
		
		
		if(small_category == null) {
			small_category = "0";
		}
		
		if(category_name != null) {
			if(category_name.length() == 0) {
				category_name = null;
			}
		}
		
		String memberId = null;
		if((session.getAttribute("loginSession")) != null) {
			memberId = (((MemberDTO)session.getAttribute("loginSession")).getMember_id());
		}
		
		int total = 0;
		if(search_keyword == null) {
			total = service.countBoard(Integer.parseInt(seq_category), Integer.parseInt(small_category), category_name, memberId);
		}else {
			total = service.countBySearch(Integer.parseInt(seq_category), Integer.parseInt(small_category), category_name , memberId ,search_type, search_keyword);
		}
		
		System.out.println(total);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "20";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "20";
		}
		
		service.updateView(Integer.parseInt(seq_board)); // 조회 수 증가
		
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		Map<String, Object> etcMap = new HashMap<>();
		etcMap.put("search_type", search_type);
		etcMap.put("search_keyword", search_keyword);
		etcMap.put("category", Integer.parseInt(seq_category));
		etcMap.put("small_category", Integer.parseInt(small_category));
		etcMap.put("bigCategory", service.bigCategory(Integer.parseInt(seq_category)));
		etcMap.put("category_name", category_name);
		
		if(search_keyword == null) {
			model.addAttribute("list", service.selectAllBoard(vo, Integer.parseInt(seq_category), Integer.parseInt(small_category), category_name, memberId));
		}else {
			model.addAttribute("list", service.searchBoard(vo, Integer.parseInt(seq_category), Integer.parseInt(small_category), search_type, search_keyword, category_name, memberId));
		}
		model.addAttribute("paging", vo); // 페이지정보
		model.addAttribute("categoryMenu", service.selectCategory(Integer.parseInt(seq_category))); // 게시판 카테고리 메뉴
		model.addAttribute("post", service.detailPost(Integer.parseInt(seq_board))); // 게시판 글 뿌려주기 사실상 이거만 다른거임
		model.addAttribute("comment", service.selectComment(Integer.parseInt(seq_board))); // 댓글목록 뿌려주기
		model.addAttribute("etcMap", etcMap); // 검색타입,검색어,대분류카테고리,소분류카테고리 저장소
		model.addAttribute("mainCategory", service.mainCategory()); // 상단바 카테고리
        model.addAttribute("inquiry", service.inquiryCategory()); // 상단바 문의 들어가기
		return "board/detailPost";
	}
	
	@ResponseBody
	@RequestMapping(value = "/registerComment") // 댓글 등록
	public String registerComment(CommentDTO dto) throws Exception{
		System.out.println("seq_board : " + dto.getSeq_board());
		System.out.println("comment_content : " + dto.getComment_content());
		
		
		String memberId = null;
		String nickName = null;
		if((session.getAttribute("loginSession")) != null) {
			memberId = (((MemberDTO)session.getAttribute("loginSession")).getMember_id());
			nickName = (((MemberDTO)session.getAttribute("loginSession")).getMember_nickname());
		}
		
		dto.setComment_id(memberId); // 나중에 세션값으로 세팅
		dto.setComment_nickname(nickName); // 나중에 세션값으로 세팅
		service.commentInsert(dto); // 댓글 디비에 저장
		System.out.println(dto.getSeq_comment());
		return String.valueOf(dto.getSeq_comment());
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteComment") // 댓글 삭제
	public String deleteComment(String seq_comment) throws Exception{
		System.out.println("삭제 요청 한 댓글 번호 : " + seq_comment);
		service.deleteComment(Integer.parseInt(seq_comment));
		return "yes";
	}
	
	@ResponseBody
	@RequestMapping(value = "/modifyComment") // 댓글 수정 요청
	public String modifyComment(CommentDTO dto) throws Exception{
		System.out.println("수정 요청 한 댓글 번호 : " + dto.getSeq_comment());
		System.out.println("수정 한 댓글 내용 : " + dto.getComment_content());
		service.updateComment(dto); // 수정요청온 내용으로 댓글 업데이트
		return "yes";
	}
	
	@RequestMapping(value = "/deletePost") // 게시물 삭제
	public String deletePost(String seq_board, String seq_category, String category_name) throws Exception{
		System.out.println("삭제 요청 한 글번호 : " + seq_board);
		System.out.println("삭제 요청 한 글의 대분류 카테고리 : " + seq_category);
		
		// 삭제하려는 글번호로 저장된 파일 db 데이터들 불러와서 싹 삭제함
		List<FileDTO> deleteFiles = fileService.deleteFileList(Integer.parseInt(seq_board));
		service.deleteFiles(deleteFiles); // 해당 글번호에 해당하는 모든 파일을 삭제할때 사용하는 메서드
		
		service.deletePost(Integer.parseInt(seq_board));
		return "redirect:/board/toBoard?seq_category=" + seq_category + "&category_name=" + category_name;
	}
}
