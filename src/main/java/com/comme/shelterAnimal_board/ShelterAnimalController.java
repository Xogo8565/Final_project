package com.comme.shelterAnimal_board;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value = "/shelterAnimal")
public class ShelterAnimalController {
	@Autowired
	private ShelterAnimalService service;
	
	@RequestMapping(value="/toShelterAnimal") // 유기동물 게시판 리스트 호출
	public String shelterAnimalList(Model model, int curPage) throws Exception {
		Map<String, Object> curPageMap = service.getPageNavi(curPage);
		model.addAttribute("curPageMap", curPageMap);
		
		
		String rs = service.getJSON(curPage);
//		service.getData();
		// ObjectMapper 클래스를 사용하여 map형식으로 데이터를 변환
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = mapper.readValue(rs, Map.class);
		model.addAttribute("data", map);
		
		return "/shelterAnimal/shelterAnimal_board";
	}
	
	@ResponseBody
	@RequestMapping(value="/toAjax", produces="application/json; charset=UTF-8")
	public String getJSON(int curPage) throws Exception{
		System.out.println("1차"+curPage);
		
		String data = service.getJSON(curPage);
		
		return data;
	}
	
	@RequestMapping(value="/toDetail")
	public String toDetail(Model model, String desertionNo) throws Exception{
		System.out.println(desertionNo);
		service.selectDetail(desertionNo);
		System.out.println(service.selectDetail(desertionNo));
//		model.addAttribute("data", map);
//		System.out.println(map.toString());
		return "/shelterAnimal/shelterAnimal_detail";
	}
}
