package com.comme.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comme.board.BoardService;
import com.comme.utils.PagingVO;

@RequestMapping(value = "/member")
@Controller
public class MemberController {
    @Autowired
    private MemberService service;
    @Autowired
    private BoardService boardService;
    @Autowired
    private HttpSession session;

    @RequestMapping(value = "/toLoginPage") // 로그인페이지 요청
    public String toLogin(Model model) throws Exception {
		model.addAttribute("mainCategory", boardService.mainCategory());
		model.addAttribute("inquiry", boardService.inquiryCategory());

		return "member/login";
    }

    @ResponseBody
    @RequestMapping(value = "/loginProc") // 로그인 버튼을 눌렀을 때
    public String loginProc(String member_id, String member_pw) throws Exception {
        // System.out.println("id : " + member_id + " / pw : " + member_pw);
        MemberDTO dto = service.loginProc(member_id, member_pw);


        if (dto != null) {
            if (dto.getMember_grade().equals("3")) {
                return "await";
            }
            session.setAttribute("loginSession", dto);
            return "success";
        }
        return "fail";
    }
    
    @RequestMapping(value="/logout") // 로그아웃
    public String logout() throws Exception{
    	session.invalidate();
    	System.out.println("로그아웃");
    	return "redirect:/";
    }
    
    @RequestMapping(value = "/deleteMember") // 회원탈퇴
    public String deleteMember() throws Exception{
    	String memberId = (((MemberDTO)session.getAttribute("loginSession")).getMember_id());
    	service.deleteMember(memberId);
    	session.invalidate();
    	System.out.println("회원탈퇴");
    	return "redirect:/";
    }

    @RequestMapping(value = "/toSignupPage") // 회원가입 페이지 요청
    public String toSignup(Model model) throws Exception {
		model.addAttribute("mainCategory", boardService.mainCategory());
		model.addAttribute("inquiry", boardService.inquiryCategory());

		return "member/signup";
    }

    @RequestMapping(value = "/toSingup_general") // 일반회원가입 페이지 요청
    public String toSingup_general(Model model) throws Exception {
		model.addAttribute("mainCategory", boardService.mainCategory());
		model.addAttribute("inquiry", boardService.inquiryCategory());
        return "member/signup_general";
    }

    @RequestMapping(value = "/toSignup_business") // 기관회원가입 페이지 요청
    public String toSignup_business(Model model) throws Exception {
		model.addAttribute("mainCategory", boardService.mainCategory());
		model.addAttribute("inquiry", boardService.inquiryCategory());
        return "member/signup_business";
    }
    
    @RequestMapping(value = "/toModifyPw") // 비밀번호 변경 페이지 이동
    public String toModifyPw(Model model) throws Exception {
    	model.addAttribute("mainCategory", boardService.mainCategory());
    	model.addAttribute("inquiry", boardService.inquiryCategory());
    	return "member/modifyPw";
    }
    
    @RequestMapping(value = "/toModifyMember") // 회원 정보 변경 페이지 이동
    public String toModifyMember(Model model) throws Exception {
    	model.addAttribute("mainCategory", boardService.mainCategory());
    	model.addAttribute("inquiry", boardService.inquiryCategory());
    	return "member/modifyMember";
    }
    
    @ResponseBody
    @RequestMapping(value = "/modifyPw") // 비밀번호 변경
    public String modifyPw(String member_pw) throws Exception {
    	String member_email = (((MemberDTO)session.getAttribute("loginSession")).getMember_email());
    	
    	service.changePw(member_email, member_pw);
    	
    	return "success";
    }
    
    @ResponseBody
    @RequestMapping(value = "/checkPw") // 기존 비밀번호 체크
    public String checkPw(String member_pw) throws Exception {
    	String memberId = (((MemberDTO)session.getAttribute("loginSession")).getMember_id());
    	
    	MemberDTO dto = service.loginProc(memberId, member_pw);
    	if (dto != null) {
    		return "success";
    	}
    	
    	return "fail";
    }

    @ResponseBody
    @RequestMapping(value = "/idCheck") // 아이디 중복확인
    public String idCheck(String id) throws Exception {

        int rs = service.idCheck(id);
        if (rs == 0) {
            return "ok";
        } else {
            return "nope";
        }
    }


    @ResponseBody
    @RequestMapping(value = "/emailCheck") // 이메일 중복확인
    public String emailCheck(String email) throws Exception {

        int rs = service.emailCheck(email);
        if (rs == 0) {
            return "ok";
        } else {
            return "nope";
        }
    }
    
    @ResponseBody
    @RequestMapping(value = "/nicknameCheck") // 닉네임 중복확인
    public String nicknameCheck(String nickname) throws Exception {
    	int rs = service.nicknameCheck(nickname);
    	if (rs == 0) {
    		return "ok";
    	} else {
    		return "nope";
    	}
    }


    @RequestMapping(value = "/signupGeneral") // 일반회원 회원가입
    public String signupGeneral(MemberDTO dto) throws Exception {
        service.signupGeneral(dto);
        return "redirect:/member/toLoginPage";
    }


    @RequestMapping(value = "/signupBusiness") // 기관회원 회원가입
    public String signupBusiness(MemberDTO dto) throws Exception {
        service.signupBusiness(dto);
        return "redirect:/member/toLoginPage";
    }
    
    @RequestMapping(value = "/updateMember") // 회원 정보 변경
    public String updateMember(MemberDTO dto) throws Exception {
    	service.updateMember(dto);
    	String grade = (((MemberDTO)session.getAttribute("loginSession")).getMember_grade());
    	dto.setMember_grade(grade);
    	session.setAttribute("loginSession", dto);
    	return "redirect:/member/toMyPage";
    }


    @RequestMapping(value = "/toFindIdPage") // 아이디 찾기 페이지 요청
    public String toFindIdPage(Model model) throws Exception {
		model.addAttribute("mainCategory", boardService.mainCategory());
		model.addAttribute("inquiry", boardService.inquiryCategory());
        return "member/findId";
    }

    @ResponseBody
    @RequestMapping(value = "/findToEmail") // 아이디찾기 (이메일)
    public String findToEmail(String member_email) throws Exception {
        String member_id = service.findToEmail(member_email);
        return member_id;
    }

    @ResponseBody
    @RequestMapping(value = "/findToPhone") // 아이디찾기 (전화번호)
    public String findToPhone(String member_phone, HttpServletResponse response) throws Exception {
        System.out.println(member_phone);
        String member_id = service.findToPhone(member_phone);
        
        if (member_id == null) {
        	response.setStatus( HttpServletResponse.SC_BAD_REQUEST  );
        }
        return member_id;
    }

    @RequestMapping(value = "/toFindPwPage") // 비밀번호 찾기 페이지 요청
    public String toFindPwPage(Model model) throws Exception {
		model.addAttribute("mainCategory", boardService.mainCategory());
		model.addAttribute("inquiry", boardService.inquiryCategory());
        return "member/findPw";
    }

    @RequestMapping(value = "/toMyPage")
	public String toMyPage(Model model) throws Exception{

		model.addAttribute("mainCategory", boardService.mainCategory());
		model.addAttribute("inquiry", boardService.inquiryCategory());
		return "member/myPage";
	}
	
	@RequestMapping(value = "/toMyComment")
	public String toMyComment(PagingVO vo, String search_keyword, String search_type , Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception{
		
		String memberId = (((MemberDTO)session.getAttribute("loginSession")).getMember_id());
		
		int total = service.countComment(memberId, search_keyword); // 뿌려 줄 댓글의 총 갯수
		
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
        model.addAttribute("list", service.selectComment(vo, memberId, search_keyword));
		model.addAttribute("etcMap", etcMap);
		
		return "member/MyComment";
	}
	
	@RequestMapping(value = "/toMyBoard")
	public String toMyBoard(PagingVO vo, String search_keyword, String search_type , Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception{

		
		String memberId = (((MemberDTO)session.getAttribute("loginSession")).getMember_id());
		
		int total = service.countBoard(memberId, search_type, search_keyword); // 뿌려 줄 댓글의 총 갯수
		
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
		model.addAttribute("list", service.selectMyBoard(vo, memberId, search_type, search_keyword));
		model.addAttribute("etcMap", etcMap);
		
		return "member/myBoard";
	}
	
	@RequestMapping(value = "/toMyPay") // 보호소측으로 후원한 사용자들의 후원 내역
	public String toMyPay(PagingVO vo, String search_keyword, String search_type , Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception{

		
		String memberId = (((MemberDTO)session.getAttribute("loginSession")).getMember_id());
		
		int total = service.countPay(memberId, search_type, search_keyword); // 뿌려 줄 댓글의 총 갯수
		
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
		model.addAttribute("list", service.userPayList(vo, memberId, search_type, search_keyword));
		model.addAttribute("etcMap", etcMap);
		
		return "member/shelterPay";
	}
	
	@RequestMapping(value = "/toMyPayList") // 일반 사용자 개인의 후원내역
	public String toMyPayList(PagingVO vo, Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception{
		
		String memberId = (((MemberDTO)session.getAttribute("loginSession")).getMember_id());
		
		int total = service.countMyPayList(memberId); // 뿌려 줄 댓글의 총 갯수
		
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
		model.addAttribute("list", service.myPayList(vo, memberId));
		
		return "member/myPayList";
	}
	
	@RequestMapping(value = "/toMySupport")
	public String toMySupport(PagingVO vo, Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception{
		
		String memberId = (((MemberDTO)session.getAttribute("loginSession")).getMember_id());
		
		int total = service.countMySP(memberId); // 뿌려 줄 댓글의 총 갯수
		
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
		model.addAttribute("list", service.mySupportBoard(vo ,memberId));
		
		return "member/mySupport";
	}
	
	@RequestMapping(value = "/toShelterVolList")
	public String toShelterVolList(PagingVO vo, String search_keyword, String search_type , Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception{
		

		
		String memberId = (((MemberDTO)session.getAttribute("loginSession")).getMember_id());
		
		int total = service.countVolList(memberId, search_type, search_keyword); // 뿌려 줄 댓글의 총 갯수
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
		model.addAttribute("list", service.selectVolList(vo, memberId, search_type, search_keyword));
		model.addAttribute("etcMap", etcMap);
		
		return "member/shelterVolList";
	}
	
	@RequestMapping(value = "/toCheckVol")
	public String toCheckVol(PagingVO vo, String search_keyword, String search_type , Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) throws Exception{
		

		
		String memberId = (((MemberDTO)session.getAttribute("loginSession")).getMember_id());
		
		int total = service.countUserVol(memberId, search_type, search_keyword); // 뿌려 줄 댓글의 총 갯수
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
		model.addAttribute("list", service.selectUserVol(vo, memberId, search_type, search_keyword));
		model.addAttribute("etcMap", etcMap);
		
		return "member/myVolList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateVolSt") // 봉사 신청 승인처리
	public String updateVolSt(String seq_submit, String seq_board) throws Exception{
		
		service.updateVolSt(seq_submit, service.vol_status(seq_submit));
		return String.valueOf(service.countVolSt(seq_board));
	}

    @ResponseBody
    @RequestMapping(value = "/mailCheck") // 비밀번호찾기 인증메일
    public String mailCheck(String email) {

        String authNumber = service.joinEmail(email);
        if (authNumber != null) {
            return authNumber;
        } else {
            return null;
        }
    }

    @ResponseBody
    @RequestMapping(value = "/existEmail") // 비밀번호찾기 -> 해당 이메일의 계정이 존재하는지
    public String exsistEmail(String email) throws Exception {
        int rs = service.emailCheck(email);
        if (rs == 0) {
            return "nope";
        }
        return "ok";
    }

    @ResponseBody
    @RequestMapping(value = "/changePw") // 비밀번호찾기 -> 비밀번호 변경
    public String changePw(String member_email, String member_pw) throws Exception {
        service.changePw(member_email, member_pw);
        return "success";
    }


}
