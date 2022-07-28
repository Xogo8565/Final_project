package com.comme.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comme.board.BoardService;
import com.comme.category.CategoryDTO;
import com.comme.member.BlackListDTO;
import com.comme.member.MemberDTO;
import com.comme.utils.PagingVO;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "/manager")
public class ManagerController {
	@Autowired
	private ManagerService service;
	@Autowired
	private BoardService boardService;
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="/memberList") // 회원 전체목록 출력
	public String memberList(Model model, int curPage) throws Exception {
		Map<String, Object> getPage = service.getAllPage(curPage);
		model.addAttribute("curPageMap", getPage);
		
		List<Map<String, Object>> list = service.selectAll(curPage*10-9, curPage*10);
		model.addAttribute("list", list);
		model.addAttribute("mainCategory", boardService.mainCategory());
        model.addAttribute("inquiry", boardService.inquiryCategory());
		
		return "/manager/memberList";
	}
	
	@ResponseBody
	@RequestMapping(value="/toModify") // 회원 수정
	public BlackListDTO memberModify(String member_id, String member_grade, String blackListChk, String blackListCtt, Model model) throws Exception {
		int rs = service.modifyGrade(member_id, member_grade);
		BlackListDTO dto = service.selectId(member_id);
		
		if(blackListChk.equals("false")) { // 체크박스 해제상태일 때
			System.out.println("해제");
			service.deleteBlackList(member_id);
		}else { // 블랙리스트 체크박스 체크됐을 때
			System.out.println("체크");
			if(dto == null) {
				System.out.println("블랙 인서트");
				service.insertBlackList(new BlackListDTO(member_id, blackListCtt, null));	
			}else if(dto != null && !dto.getBlacklist_content().equals(blackListCtt)) {
				System.out.println("블랙 업데이트");
				service.insertBlackList(new BlackListDTO(member_id, blackListCtt, null));	
			}else {
				System.out.println("블랙 저장 안함");				
			}
		}
		
		
		return service.selectId(member_id);
	}
	
	@RequestMapping(value="/toSearch") // 회원 검색
	public String searchKeyword(String category, String keyword, int curPage1, Model model) throws Exception {
		Map<String, Object> getPage = service.getSearchPage(curPage1, category, keyword);
		model.addAttribute("curPageMapSearch", getPage);
		
		List<Map<String, Object>> list = service.search(category, keyword, curPage1*10-9, curPage1*10);
		model.addAttribute("list", list);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
		model.addAttribute("mainCategory", boardService.mainCategory());
        model.addAttribute("inquiry", boardService.inquiryCategory());
		return "/manager/memberList";
	}
	
	@RequestMapping(value="/toSearchGrade")
	public String searchGrade(String member_grade, int curPage, Model model) throws Exception {
		Map<String, Object> getPage = service.getSearchGradePage(curPage, member_grade);
		model.addAttribute("curPageMapGrade", getPage);
		List<Map<String, Object>> list = service.searchGrade(member_grade, curPage*10-9, curPage*10);
		model.addAttribute("list", list);
		
		model.addAttribute("member_grade", member_grade);
		model.addAttribute("mainCategory", boardService.mainCategory());
        model.addAttribute("inquiry", boardService.inquiryCategory());
		return "/manager/memberList";
	}
	
	@RequestMapping(value="/toBlackList")
	public String blackList(int curPage, Model model) throws Exception {
		Map<String, Object> getPage = service.getBlackListPage(curPage);
		model.addAttribute("curPageMapBlack", getPage);
		
		List<Map<String, Object>> list = service.selectAllBlackList(curPage*10-9, curPage*10);
		model.addAttribute("list", list);
		model.addAttribute("mainCategory", boardService.mainCategory());
        model.addAttribute("inquiry", boardService.inquiryCategory());
		return "/manager/memberList";
	}
	
	@RequestMapping(value = "/toInquiryList") // 문의 신고 게시판 목록 띄워주기
	public String toInquiryList(PagingVO vo, String seq_category, String small_category , Model model, String search_keyword, String search_type, String category_name
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
			total = boardService.countBoard(Integer.parseInt(seq_category), Integer.parseInt(small_category), category_name, memberId);
		}else {
			total = boardService.countBySearch(Integer.parseInt(seq_category), Integer.parseInt(small_category), category_name , memberId ,search_type, search_keyword);
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
		etcMap.put("bigCategory", boardService.bigCategory(Integer.parseInt(seq_category))); // 대분류 카테고리 이름
		etcMap.put("category_name", category_name); // 문의 게시판만 걸려주려고 추가
		
		if(search_keyword == null) { // 검색유무에 따라 뿌려주는 페이지 갯수가 달라져서 두가지 경우의수로 나눈거
			model.addAttribute("list", boardService.selectAllBoard(vo, Integer.parseInt(seq_category), Integer.parseInt(small_category), category_name, memberId));
		}else {
			model.addAttribute("list", boardService.searchBoard(vo, Integer.parseInt(seq_category), Integer.parseInt(small_category), search_type, search_keyword, category_name, memberId));
		}
		model.addAttribute("paging", vo); // 페이징정보
		model.addAttribute("categoryMenu", boardService.selectCategory(Integer.parseInt(seq_category))); // 대분류 카테고리에 속한 소분류 카테고리의 목록
		model.addAttribute("etcMap", etcMap); // 잡다한거 넘기는거
		model.addAttribute("mainCategory", boardService.mainCategory()); // 상단바 카테고리
        model.addAttribute("inquiry", boardService.inquiryCategory()); // 상단바 문의 들어가기
		return "/manager/InquiryList";
	}
	
	@RequestMapping(value="/toCategoryCM")
	public String toCategoryCM(Model model) throws Exception {
		model.addAttribute("mainCategory", boardService.mainCategory());
        model.addAttribute("inquiry", boardService.inquiryCategory());
		return "/manager/categoryCustom";
	}
	
	
	@RequestMapping(value = "/addMainCategory") // 상위 카테고리 추가
	public String addMainCategory(CategoryDTO dto) throws Exception{
		System.out.println("category_name : " + dto.getCategory_name());
		service.addMainCategory(dto);
		return "redirect:/manager/toCategoryCM";
	}
	
	@ResponseBody
	@RequestMapping(value = "/addSubCategory") // 하위 카테고리 추가
	public String addSubCategory(CategoryDTO dto) throws Exception{
		System.out.println("category_name : " + dto.getCategory_name());
		System.out.println("category_pk : " + dto.getCategory_pk());
		service.addSubCategory(dto);
		return String.valueOf(dto.getSeq_category());
	}
	
	
	@RequestMapping(value = "/deleteMainCategory") // 카테고리 삭제
	public String deleteMainCategory(int seq_category) throws Exception{
		System.out.println("seq_category : " + seq_category);
		service.deleteCategory(seq_category);
		return "redirect:/manager/toCategoryCM";
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteSubCategory") // 카테고리 삭제
	public String deleteSubCategory(int seq_category) throws Exception{
		System.out.println("seq_category : " + seq_category);
		service.deleteCategory(seq_category);
		return "yes";
	}
	
	@RequestMapping(value = "/mofidyMainCategory") // 상위 카테고리 이름 수정
	public String mofidyMainCategory(CategoryDTO dto) throws Exception{
		System.out.println("수정 할 category_name : " + dto.getCategory_name());
		service.modifyCategory(dto);
		return "redirect:/manager/toCategoryCM";
	}
	
	@ResponseBody
	@RequestMapping(value = "/mofidySubCategory") // 하위 카테고리 이름 수정
	public String mofidySubCategory(CategoryDTO dto) throws Exception{
		System.out.println("수정 할 category_name : " + dto.getCategory_name());
		service.modifyCategory(dto);
		return "yes";
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectCategory" , produces = "application/json; charset=UTF-8")
	public String selectCategory(int seq_category, Model model) throws Exception{
		System.out.println("seq_category : " + seq_category);
		
		 Gson gson = new Gson();
         String listJson = gson.toJson(service.selectCategory(seq_category)).toString();
         
		return listJson;
	}
	
	@RequestMapping(value = "/toAllPay") // 모든 사용자의 후원 내역
	public String toAllPay(PagingVO vo, String search_keyword, String search_type , Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception{
		
		System.out.println("search_keyword : " + search_keyword);
		System.out.println("search_type : " + search_type);
		
		int total = service.countPay(search_type, search_keyword); // 뿌려 줄 댓글의 총 갯수
		
		if (nowPage == null && cntPerPage == null) { // 처음 게시판에 접속하면 얻게 되는 기본 페이지 값 cntPerPage 조절하면 몇개뿌릴지 선택가능함
			nowPage = "1";
			cntPerPage = "20";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "20";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage)); // 토탈, 현재페이지, 한페이지에뿌려줄 게시물수 인자로 넣으면 페이징 정보 세팅
		
		Map<String, Object> etcMap = new HashMap<>();
		etcMap.put("search_keyword", search_keyword); // 검색 키워드
		etcMap.put("search_type", search_type); // 검색 타입
		etcMap.put("searchMoney", service.searchMoney(search_type, search_keyword)); // 검색 타입
		
		model.addAttribute("mainCategory", boardService.mainCategory());
		model.addAttribute("inquiry", boardService.inquiryCategory());
		model.addAttribute("paging", vo); // 페이징정보
		model.addAttribute("list", service.userPayList(vo, search_type, search_keyword));
		model.addAttribute("etcMap", etcMap);
		
		return "manager/allPay";
	}
	
}
