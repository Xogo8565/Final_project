package com.comme.comment;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class CommentDTO {
	private int seq_comment, seq_board;
	private String comment_content, comment_id, comment_nickname, comment_date;
	
	public CommentDTO() {}

	public CommentDTO(int seq_comment, int seq_board, String comment_content, String comment_id,
			String comment_nickname, String comment_date) {
		super();
		this.seq_comment = seq_comment;
		this.seq_board = seq_board;
		this.comment_content = comment_content;
		this.comment_id = comment_id;
		this.comment_nickname = comment_nickname;
		this.comment_date = comment_date;
	}
	
	public CommentDTO(int seq_comment, int seq_board, String comment_content, String comment_id,
			String comment_nickname, Date comment_date) {
		super();
		this.seq_comment = seq_comment;
		this.seq_board = seq_board;
		this.comment_content = comment_content;
		this.comment_id = comment_id;
		this.comment_nickname = comment_nickname;
		this.comment_date = getStrDate(comment_date);
	}

	public int getSeq_comment() {
		return seq_comment;
	}

	public void setSeq_comment(int seq_comment) {
		this.seq_comment = seq_comment;
	}

	public int getSeq_board() {
		return seq_board;
	}

	public void setSeq_board(int seq_board) {
		this.seq_board = seq_board;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public String getComment_id() {
		return comment_id;
	}

	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}

	public String getComment_nickname() {
		return comment_nickname;
	}

	public void setComment_nickname(String comment_nickname) {
		this.comment_nickname = comment_nickname;
	}

	public String getComment_date() {
		return comment_date;
	}

	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
	
	public String getStrDate(Date date) {  // 오라클 date타입으로 받기
		String rs = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("YY년MM월dd일 hh:mm:ss");
			rs = sdf.format(date);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	@Override
	public String toString() {
		return seq_comment + " : " + seq_board + " : " + comment_content + " : " + comment_id + " : " 
				+ comment_nickname + " : " + comment_date;
	}
	
	
}
