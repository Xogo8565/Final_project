package com.comme.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/comment")
public class CommentController {
	@Autowired
	private CommentService service;
	
	@RequestMapping(value="/missing_comment") // 실종게시판 댓글입력
	public String missing_comment(CommentDTO dto) throws Exception{
		System.out.println(dto.toString());
		service.insertMissing(dto);
		return "redirect:/miss/toDetail";
	}
	@ResponseBody
	@RequestMapping(value="/deleteMissingComment") // 실종게시판 댓글 삭제
	public String deleteMissingComment(int seq_comment) throws Exception{
		System.out.println("댓글 번호 : " + seq_comment);
		
		service.deleteMissing(seq_comment);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value="/modifyMissingComment") // 실종게시판 댓글 수정
	public String modifyMissingComment(int seq_comment, String comment_content) throws Exception{
		System.out.println("댓글 번호 : " + seq_comment);
		System.out.println("댓글 수정 내용 : " + comment_content);
		service.modifyMissing(seq_comment, comment_content);
		
		return "success";
	}
}
