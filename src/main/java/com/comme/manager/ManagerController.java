package com.comme.manager;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comme.member.BlackListDTO;

@Controller
@RequestMapping(value = "/manager")
public class ManagerController {
	@Autowired
	private ManagerService service;
	
	@RequestMapping(value="/memberList") // 회원 전체목록 출력
	public String memberList(Model model, int curPage) throws Exception {
		Map<String, Object> getPage = service.getAllPage(curPage);
		model.addAttribute("curPageMap", getPage);
		
		List<Map<String, Object>> list = service.selectAll(curPage*10-9, curPage*10);
		model.addAttribute("list", list);
		
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
		return "/manager/memberList";
	}
	
	@RequestMapping(value="/toSearchGrade")
	public String searchGrade(String member_grade, int curPage, Model model) throws Exception {
		Map<String, Object> getPage = service.getSearchGradePage(curPage, member_grade);
		model.addAttribute("curPageMapGrade", getPage);
		List<Map<String, Object>> list = service.searchGrade(member_grade, curPage*10-9, curPage*10);
		model.addAttribute("list", list);
		
		model.addAttribute("member_grade", member_grade);
		return "/manager/memberList";
	}
	
	@RequestMapping(value="/toBlackList")
	public String blackList(int curPage, Model model) throws Exception {
		Map<String, Object> getPage = service.getBlackListPage(curPage);
		model.addAttribute("curPageMapBlack", getPage);
		
		List<Map<String, Object>> list = service.selectAllBlackList(curPage*10-9, curPage*10);
		model.addAttribute("list", list);
		return "/manager/memberList";
	}
}
