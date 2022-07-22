package com.comme.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comme.board.BoardService;
import com.comme.comment.CommentDTO;
import com.comme.utils.PagingVO;

@RequestMapping(value = "/member")
@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/toLoginPage") // 로그인페이지 요청
	public String toLogin() {
		return "member/login";
	}
	
	@RequestMapping(value = "/toSignupPage") // 회원가입 페이지 요청
	public String toSignup() {
		return "member/signup";
	}
	
	@RequestMapping(value = "/toFindIdPage") // 아이디 찾기 페이지 요청
	public String toFindIdPage() {
		return "member/findId";
	}
	
	@RequestMapping(value = "/toFindPwPage") // 비밀번호 찾기 페이지 요청
	public String toFindPwPage() {
		return "member/findPw";
	}
	
	@RequestMapping(value = "/toMyPage")
	public String toMypage() throws Exception{
		return "member/myPage";
	}
	
	@RequestMapping(value = "/toShelterPage")
	public String toShelterPage(Model model) throws Exception{
		System.out.println("보호소 마이페이지 접속");
		
		model.addAttribute("info", service.ProfileInfo("id"));
		model.addAttribute("mainCategory", boardService.mainCategory());
        model.addAttribute("inquiry", boardService.inquiryCategory());
		return "member/shelterMyPage";
	}
	
	@RequestMapping(value = "/toUserPage")
	public String toUserPage(Model model) throws Exception{
		System.out.println("일반 회원 마이페이지 접속");
		
		model.addAttribute("info", service.ProfileInfo("id"));
		model.addAttribute("mainCategory", boardService.mainCategory());
		model.addAttribute("inquiry", boardService.inquiryCategory());
		return "member/userMyPage";
	}
	
	@RequestMapping(value = "/toMyComment")
	public String toMyComment(PagingVO vo, String search_keyword, String search_type , Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception{
		
		int total = service.countComment("id", search_keyword); // 뿌려 줄 댓글의 총 갯수
		
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
		
		model.addAttribute("mainCategory", boardService.mainCategory());
        model.addAttribute("inquiry", boardService.inquiryCategory());
        model.addAttribute("paging", vo); // 페이징정보
        model.addAttribute("list", service.selectComment(vo, "id", search_keyword));
		model.addAttribute("etcMap", etcMap);
		
		return "member/MyComment";
	}
	
	@RequestMapping(value = "/toMyBoard")
	public String toMyBoard(PagingVO vo, String search_keyword, String search_type , Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception{
		
		System.out.println("search_keyword : " + search_keyword);
		System.out.println("search_type : " + search_type);
		
		int total = service.countBoard("id", search_type, search_keyword); // 뿌려 줄 댓글의 총 갯수
		
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
		
		model.addAttribute("mainCategory", boardService.mainCategory());
		model.addAttribute("inquiry", boardService.inquiryCategory());
		model.addAttribute("paging", vo); // 페이징정보
		model.addAttribute("list", service.selectMyBoard(vo, "id", search_type, search_keyword));
		model.addAttribute("etcMap", etcMap);
		
		return "member/myBoard";
	}
	
	@RequestMapping(value = "/toMyPay") // 보호소측으로 후원한 사용자들의 후원 내역
	public String toMyPay(PagingVO vo, String search_keyword, String search_type , Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception{
		
		System.out.println("search_keyword : " + search_keyword);
		System.out.println("search_type : " + search_type);
		
		int total = service.countPay("id", search_type, search_keyword); // 뿌려 줄 댓글의 총 갯수
		
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
		
		model.addAttribute("mainCategory", boardService.mainCategory());
		model.addAttribute("inquiry", boardService.inquiryCategory());
		model.addAttribute("paging", vo); // 페이징정보
		model.addAttribute("list", service.userPayList(vo, "id", search_type, search_keyword));
		model.addAttribute("etcMap", etcMap);
		
		return "member/shelterPay";
	}
	
	@RequestMapping(value = "/toMyPayList") // 일반 사용자 개인의 후원내역
	public String toMyPayList(PagingVO vo, Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception{
		
		int total = service.countMyPayList("id"); // 뿌려 줄 댓글의 총 갯수
		
		if (nowPage == null && cntPerPage == null) { // 처음 게시판에 접속하면 얻게 되는 기본 페이지 값 cntPerPage 조절하면 몇개뿌릴지 선택가능함
			nowPage = "1";
			cntPerPage = "20";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "20";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage)); // 토탈, 현재페이지, 한페이지에뿌려줄 게시물수 인자로 넣으면 페이징 정보 세팅
		
		model.addAttribute("mainCategory", boardService.mainCategory());
		model.addAttribute("inquiry", boardService.inquiryCategory());
		model.addAttribute("paging", vo); // 페이징정보
		model.addAttribute("list", service.myPayList(vo, "id"));
		
		return "member/myPayList";
	}
	
	@RequestMapping(value = "/toMySupport")
	public String toMySupport(PagingVO vo, Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception{
		
		int total = service.countMySP("id"); // 뿌려 줄 댓글의 총 갯수
		
		if (nowPage == null && cntPerPage == null) { // 처음 게시판에 접속하면 얻게 되는 기본 페이지 값 cntPerPage 조절하면 몇개뿌릴지 선택가능함
			nowPage = "1";
			cntPerPage = "20";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "20";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage)); // 토탈, 현재페이지, 한페이지에뿌려줄 게시물수 인자로 넣으면 페이징 정보 세팅
		
		model.addAttribute("mainCategory", boardService.mainCategory());
		model.addAttribute("inquiry", boardService.inquiryCategory());
		model.addAttribute("paging", vo); // 페이징정보
		model.addAttribute("list", service.mySupportBoard(vo ,"id"));
		
		return "member/mySupport";
	}
	
	@RequestMapping(value = "/toShelterVolList")
	public String toShelterVolList(PagingVO vo, String search_keyword, String search_type , Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception{
		
		System.out.println("search_keyword : " + search_keyword);
		System.out.println("search_type : " + search_type);
		
		int total = service.countVolList("test", search_type, search_keyword); // 뿌려 줄 댓글의 총 갯수
		System.out.println("total : " + total);
		
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
		
		model.addAttribute("mainCategory", boardService.mainCategory());
		model.addAttribute("inquiry", boardService.inquiryCategory());
		model.addAttribute("paging", vo); // 페이징정보
		model.addAttribute("list", service.selectVolList(vo, "test", search_type, search_keyword));
		model.addAttribute("etcMap", etcMap);
		
		return "member/shelterVolList";
	}
	
	@RequestMapping(value = "/toCheckVol")
	public String toCheckVol(PagingVO vo, String search_keyword, String search_type , Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception{
		
		System.out.println("search_keyword : " + search_keyword);
		System.out.println("search_type : " + search_type);
		
		int total = service.countUserVol("id", search_type, search_keyword); // 뿌려 줄 댓글의 총 갯수
		System.out.println("total : " + total);
		
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
		
		model.addAttribute("mainCategory", boardService.mainCategory());
		model.addAttribute("inquiry", boardService.inquiryCategory());
		model.addAttribute("paging", vo); // 페이징정보
		model.addAttribute("list", service.selectUserVol(vo, "id", search_type, search_keyword));
		model.addAttribute("etcMap", etcMap);
		
		return "member/myVolList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateVolSt") // 봉사 신청 승인처리
	public String updateVolSt(String seq_submit, String seq_board) throws Exception{
		System.out.println("seq_submit : " + seq_submit);
		System.out.println("seq_board : " + seq_board);
		
		service.updateVolSt(seq_submit, service.vol_status(seq_submit));
		return String.valueOf(service.countVolSt(seq_board));
	}
	
}
