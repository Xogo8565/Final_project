package com.comme.vol;

public class VolSubmitDTO {
    private int seq_submit;
    private int seq_board;
    private String member_id;
    private String writer_name;
    private String writer_phone;
    private String vol_status;

    public VolSubmitDTO() {
    }

    public VolSubmitDTO(int seq_submit, int seq_board, String member_id, String writer_name, String writer_phone, String vol_status) {
        this.seq_submit = seq_submit;
        this.seq_board = seq_board;
        this.member_id = member_id;
        this.writer_name = writer_name;
        this.writer_phone = writer_phone;
        this.vol_status = vol_status;
    }

    public int getSeq_submit() {
        return seq_submit;
    }

    public void setSeq_submit(int seq_submit) {
        this.seq_submit = seq_submit;
    }

    public int getSeq_board() {
        return seq_board;
    }

    public void setSeq_board(int seq_board) {
        this.seq_board = seq_board;
    }

    public String getMember_id() {
        return member_id;
    }

    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }

    public String getWriter_name() {
        return writer_name;
    }

    public void setWriter_name(String writer_name) {
        this.writer_name = writer_name;
    }

    public String getWriter_phone() {
        return writer_phone;
    }

    public void setWriter_phone(String writer_phone) {
        this.writer_phone = writer_phone;
    }

    public String getVol_status() {
        return vol_status;
    }

    public void setVol_status(String vol_status) {
        this.vol_status = vol_status;
    }
}
