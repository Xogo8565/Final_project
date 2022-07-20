package com.comme.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/manager")
public class ManagerController {
	@Autowired
	private ManagerService service;
	
	@RequestMapping(value="/memberList")
	public String memberList(int curPage) throws Exception {
		
		return "/manager/memberList";
	}
}
