package com.comme.pay;

public class PayDTO {
	private int seq_pay;
	private String member_id;
	private int seq_board;
	private int pay_money;
	private String pay_date;
	
	public PayDTO() {}

	public PayDTO(int seq_pay, String member_id, int seq_board, int pay_money, String pay_date) {
		super();
		this.seq_pay = seq_pay;
		this.member_id = member_id;
		this.seq_board = seq_board;
		this.pay_money = pay_money;
		this.pay_date = pay_date;
	}

	public int getSeq_pay() {
		return seq_pay;
	}

	public void setSeq_pay(int seq_pay) {
		this.seq_pay = seq_pay;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getSeq_board() {
		return seq_board;
	}

	public void setSeq_board(int seq_board) {
		this.seq_board = seq_board;
	}

	public int getPay_money() {
		return pay_money;
	}

	public void setPay_money(int pay_money) {
		this.pay_money = pay_money;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	@Override
	public String toString() {
		return "seq_pay : " + seq_pay + " member_id : " + member_id + " seq_board : " + seq_board + " pay_money : "
				+ pay_money + " pay_date : " + pay_date;
	}
	
	
	
	
	
	
}
