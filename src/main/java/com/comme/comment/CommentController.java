package com.comme.comment;

import com.comme.member.MemberDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value="/comment")
public class CommentController {
	@Autowired
	private CommentService service;
	@Autowired
	private HttpSession httpSession;

	@ResponseBody
	@PostMapping(value="/missingComment") // 실종게시판 댓글입력
	public String missing_comment(CommentDTO dto) throws Exception{
		dto.setComment_id(((MemberDTO)httpSession.getAttribute("loginSession")).getMember_id());
		dto.setComment_nickname(((MemberDTO)httpSession.getAttribute("loginSession")).getMember_id());
		service.insertMissing(dto);
		return "success";
	}
	@ResponseBody
	@RequestMapping(value="/deleteMissingComment") // 실종게시판 댓글 삭제
	public String deleteMissingComment(int seq_comment) throws Exception{
		service.deleteMissing(seq_comment);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value="/modifyMissingComment") // 실종게시판 댓글 수정
	public String modifyMissingComment(int seq_comment, String comment_content) throws Exception{
		service.modifyMissing(seq_comment, comment_content);
		
		return "success";
	}

	@ResponseBody
	@GetMapping("/missingComment")
	public List<CommentDTO> missingComment(int seq_board) throws Exception {
		return service.missingComment(seq_board);
	}
}
