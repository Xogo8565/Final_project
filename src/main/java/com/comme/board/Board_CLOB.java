package com.comme.board;

import java.sql.Date;

public class Board_CLOB {
	private int seq_board;
	private String board_title;
	private String board_content;
	private String member_id;
	private String writer_nickname;
	private Date written_date;
	private int view_count;
	private int seq_category;
	private String notice;
	private String category_name;
	private int cm_count;
	
	public Board_CLOB() {}

	public Board_CLOB(int seq_board, String board_title, String board_content, String member_id, String writer_nickname,
			Date written_date, int view_count, int seq_category, String notice, String category_name, int cm_count) {
		super();
		this.seq_board = seq_board;
		this.board_title = board_title;
		this.board_content = board_content;
		this.member_id = member_id;
		this.writer_nickname = writer_nickname;
		this.written_date = written_date;
		this.view_count = view_count;
		this.seq_category = seq_category;
		this.notice = notice;
		this.category_name = category_name;
		this.cm_count = cm_count;
	}

	public int getSeq_board() {
		return seq_board;
	}

	public void setSeq_board(int seq_board) {
		this.seq_board = seq_board;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getWriter_nickname() {
		return writer_nickname;
	}

	public void setWriter_nickname(String writer_nickname) {
		this.writer_nickname = writer_nickname;
	}

	public Date getWritten_date() {
		return written_date;
	}

	public void setWritten_date(Date written_date) {
		this.written_date = written_date;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public int getSeq_category() {
		return seq_category;
	}

	public void setSeq_category(int seq_category) {
		this.seq_category = seq_category;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public int getCm_count() {
		return cm_count;
	}

	public void setCm_count(int cm_count) {
		this.cm_count = cm_count;
	}

	
	
	
}
