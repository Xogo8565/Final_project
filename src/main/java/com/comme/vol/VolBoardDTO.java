package com.comme.vol;

public class VolBoardDTO {
    private int seq_board;
    private String board_title;
    private String board_content;
    private String member_id;
    private String writer_nickname;
    private String written_date;
    private int view_count;
    private String vol_deadLine;
    private int vol_count;

    public VolBoardDTO() {
    }

    public VolBoardDTO(int seq_board, String board_title, String board_content, String member_id, String writer_nickname, String written_date, int view_count, String vol_deadLine, int vol_count) {
        this.seq_board = seq_board;
        this.board_title = board_title;
        this.board_content = board_content;
        this.member_id = member_id;
        this.writer_nickname = writer_nickname;
        this.written_date = written_date;
        this.view_count = view_count;
        this.vol_deadLine = vol_deadLine;
        this.vol_count = vol_count;
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

    public int getView_count() {
        return view_count;
    }

    public void setView_count(int view_count) {
        this.view_count = view_count;
    }

    public String getVol_deadLine() {
        return vol_deadLine;
    }

    public void setVol_deadLine(String vol_deadLine) {
        this.vol_deadLine = vol_deadLine;
    }

    public int getVol_count() {
        return vol_count;
    }

    public void setVol_count(int vol_count) {
        this.vol_count = vol_count;
    }

    @Override
    public String toString() {
        return "VolBoardDTO{" +
                "seq_board=" + seq_board +
                ", board_title='" + board_title + '\'' +
                ", board_content='" + board_content + '\'' +
                ", member_id='" + member_id + '\'' +
                ", writer_nickname='" + writer_nickname + '\'' +
                ", written_date='" + written_date + '\'' +
                ", view_count=" + view_count +
                ", vol_deadLine='" + vol_deadLine + '\'' +
                ", vol_count=" + vol_count +
                '}';
    }
}
