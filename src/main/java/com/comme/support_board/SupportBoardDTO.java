package com.comme.support_board;


public class SupportBoardDTO {
    private int seq_board;
    private String board_title;
    private String board_content;
    private String member_id;
    private String writer_nickname;
    private String written_date;
    private String support_bank;
    private String member_brn;

    public SupportBoardDTO() {
    }

    public SupportBoardDTO(int seq_board, String board_title, String board_content, String member_id, String writer_nickname, String written_date, String support_bank, String member_brn) {
        this.seq_board = seq_board;
        this.board_title = board_title;
        this.board_content = board_content;
        this.member_id = member_id;
        this.writer_nickname = writer_nickname;
        this.written_date = written_date;
        this.support_bank = support_bank;
        this.member_brn = member_brn;
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

    public String getSupport_bank() {
        return support_bank;
    }

    public void setSupport_bank(String support_bank) {
        this.support_bank = support_bank;
    }

    public String getMember_brn() {
        return member_brn;
    }

    public void setMember_brn(String member_brn) {
        this.member_brn = member_brn;
    }
}

