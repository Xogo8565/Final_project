package com.comme.shelterAnimal_board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value = "/shelterAnimal")
public class ShelterAnimalController {
	@Autowired
	private ShelterAnimalService service;
	
	@RequestMapping(value="/toShelterAnimal") // 유기동물 게시판 리스트 호출
	public String shelterAnimalBoard(Model model, @RequestParam(value="curPage", required=false) int curPage) throws Exception {
		Map<String, Object> curPageMap = service.getPageNavi(curPage);
		model.addAttribute("curPageMap", curPageMap);
		
		String rs = service.getJSON(curPage);
		
		if(curPage == 1) {
			service.dbInsertData();
		}
		// ObjectMapper 클래스를 사용하여 map형식으로 데이터를 변환
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = mapper.readValue(rs, Map.class);
		model.addAttribute("data", map);
		
		model.addAttribute("pageNum", curPage);
		return "/shelterAnimal/shelterAnimal_board";
	}
	
	@RequestMapping(value="/toShelterAnimalList") // 유기동물 게시판 리스트 db 호출
	public String shelterAnimalList(Model model, int curPage) throws Exception {
		Map<String, Object> curPageMap = service.getDbPageNavi(curPage);
		model.addAttribute("curPageMap", curPageMap);
		
		List<ShelterAnimalDTO> list = service.selectAll(curPage*10-9, (curPage*10)+2);	
		model.addAttribute("data", list);
		
		model.addAttribute("pageNum", curPage);
		return "/shelterAnimal/shelterAnimalSearchList";
	}
	
	@RequestMapping(value="/toSearch") // 유기동물 게시판 db검색
	public String shelterAnimalSearch(Model model, int curPage, String keyword) throws Exception {
		Map<String, Object> curPageMap = service.getDbSearchPageNavi(curPage, keyword);
		model.addAttribute("searchCurPage", curPageMap);		
		
		List<ShelterAnimalDTO> list = service.selectKeyword(curPage*10-9, (curPage*10)+2, keyword);
		model.addAttribute("list", list);

		model.addAttribute("keyword", keyword);
		model.addAttribute("pageNum", curPage);
		return "/shelterAnimal/shelterAnimalSearchList";
	}
	
	@RequestMapping(value="/toDetail") // 상세페이지 호출
	public String toDetail(Model model, String desertionNo, @RequestParam(value="keyword", required=false) String keyword,
							@RequestParam(value="upkind", required=false) String upkind, @RequestParam(value="curPage", required=false) int curPage) throws Exception{

		model.addAttribute("keyword", keyword);
		model.addAttribute("curPage", curPage);
		model.addAttribute("upkind", upkind);
		ShelterAnimalDTO map = service.selectDetail(desertionNo);
		model.addAttribute("data", map);
		return "/shelterAnimal/shelterAnimal_detail";
	}
	
	@ResponseBody
	@RequestMapping(value="/toSelectUpkind", produces="application/json; charset=UTF-8") // ajax 유기동물 축종코드별 리스트 호출
	public String selectUpkind(int curPage, String upkind) throws Exception{
		String data = service.selectUpkind(curPage, upkind);
		if(curPage == 1) {
			service.dbInsertData();
		}
		return data;
	}
	
	@RequestMapping(value="/toSelectUpkind2") // 유기동물 축종코드별 리스트 호출
	public String selectUpkind2(Model model, int curPage, String upkind) throws Exception{
		Map<String, Object> curPageMap = service.getPageNavi(curPage);
		model.addAttribute("curPageMap", curPageMap);
		
		String rs = service.selectUpkind(curPage, upkind);
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = mapper.readValue(rs, Map.class);
		model.addAttribute("data", map);
		
		model.addAttribute("upkind", upkind);
		model.addAttribute("pageNum", curPage);
		
		return "/shelterAnimal/shelterAnimal_board";
	}
}
