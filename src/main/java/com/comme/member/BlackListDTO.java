package com.comme.member;

public class BlackListDTO {

	private String member_id;
	private String blacklist_content;
	private String blacklist_date;
	
	public BlackListDTO() {}
	public BlackListDTO(String member_id, String blacklist_content, String blacklist_date) {
		super();
		this.member_id = member_id;
		this.blacklist_content = blacklist_content;
		this.blacklist_date = blacklist_date;
	}
	public String getMember_id() {
		return member_id;
	}
	

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBlacklist_content() {
		return blacklist_content;
	}
	public void setBlacklist_content(String blacklist_content) {
		this.blacklist_content = blacklist_content;
	}
	public String getBlacklist_date() {
		return blacklist_date;
	}
	public void setBlacklist_date(String blacklist_date) {
		this.blacklist_date = blacklist_date;
	}
	
	@Override
	public String toString() {
		return "BlackListDTO [member_id=" + member_id + ", blacklist_content=" + blacklist_content + ", blacklist_date=" + blacklist_date
				+ "]";
	}
	
}
