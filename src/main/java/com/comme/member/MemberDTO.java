package com.comme.member;

public class MemberDTO {

	private String member_id;
	private String member_pw;
	private String member_nickname;
	private String member_email;
	private String member_name;
	private String member_phone;
	private String member_sns;
	private String member_grade;
	private String member_brn;
	
	public MemberDTO() {}
	public MemberDTO(String member_id, String member_pw, String member_nickname, String member_email,
			String member_name, String member_phone, String member_sns, String member_grade, String member_brn) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_nickname = member_nickname;
		this.member_email = member_email;
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.member_sns = member_sns;
		this.member_grade = member_grade;
		this.member_brn = member_brn;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_sns() {
		return member_sns;
	}
	public void setMember_sns(String member_sns) {
		this.member_sns = member_sns;
	}
	public String getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
	}
	public String getMember_brn() {
		return member_brn;
	}
	public void setMember_brn(String member_brn) {
		this.member_brn = member_brn;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [member_id=" + member_id + ", member_pw=" + member_pw + ", member_nickname=" + member_nickname
				+ ", member_email=" + member_email + ", member_name=" + member_name + ", member_phone=" + member_phone
				+ ", member_sns=" + member_sns + ", member_grade=" + member_grade + ", member_brn=" + member_brn + "]";
	}
	
	
	
}
