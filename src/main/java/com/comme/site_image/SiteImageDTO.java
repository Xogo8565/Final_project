package com.comme.site_image;

public class SiteImageDTO {
	private int seq_image;
	private String ori_name;
	private String sys_name;
	
	public SiteImageDTO() {}

	public SiteImageDTO(int seq_image, String ori_name, String sys_name) {
		super();
		this.seq_image = seq_image;
		this.ori_name = ori_name;
		this.sys_name = sys_name;
	}

	public int getSeq_image() {
		return seq_image;
	}

	public void setSeq_image(int seq_image) {
		this.seq_image = seq_image;
	}

	public String getOri_name() {
		return ori_name;
	}

	public void setOri_name(String ori_name) {
		this.ori_name = ori_name;
	}

	public String getSys_name() {
		return sys_name;
	}

	public void setSys_name(String sys_name) {
		this.sys_name = sys_name;
	}

	@Override
	public String toString() {
		return "seq_image : " + seq_image + " ori_name : " + ori_name + " sys_name : " + sys_name;
	}
	
	
}
