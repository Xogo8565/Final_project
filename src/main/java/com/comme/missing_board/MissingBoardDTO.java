package com.comme.missing_board;

public class MissingBoardDTO {

	private int seq_board;
	private String board_title;
	private String board_content;
	private String member_id;
	private String writer_nickname;
	private String written_date;
	private String miss_area;
	private String miss_date;
	private String animal_kind;
	private int view_count;
	
	public MissingBoardDTO() {}
	public MissingBoardDTO(int seq_board, String board_title, String board_content, String member_id,
			String writer_nickname, String written_date, String miss_area, String miss_date, String animal_kind,
			int view_count) {
		super();
		this.seq_board = seq_board;
		this.board_title = board_title;
		this.board_content = board_content;
		this.member_id = member_id;
		this.writer_nickname = writer_nickname;
		this.written_date = written_date;
		this.miss_area = miss_area;
		this.miss_date = miss_date;
		this.animal_kind = animal_kind;
		this.view_count = view_count;
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
	public String getWritten_date() {
		return written_date;
	}
	public void setWritten_date(String written_date) {
		this.written_date = written_date;
	}
	public String getMiss_area() {
		return miss_area;
	}
	public void setMiss_area(String miss_area) {
		this.miss_area = miss_area;
	}
	public String getMiss_date() {
		return miss_date;
	}
	public void setMiss_date(String miss_date) {
		this.miss_date = miss_date;
	}
	public String getAnimal_kind() {
		return animal_kind;
	}
	public void setAnimal_kind(String animal_kind) {
		this.animal_kind = animal_kind;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	
	
	@Override
	public String toString() {
		return "MissingBoardDTO [seq_board=" + seq_board + ", board_title=" + board_title + ", board_content="
				+ board_content + ", member_id=" + member_id + ", writer_nickname=" + writer_nickname
				+ ", written_date=" + written_date + ", miss_area=" + miss_area + ", miss_date=" + miss_date
				+ ", animal_kind=" + animal_kind + ", view_count=" + view_count + "]";
	}
	
	
}
