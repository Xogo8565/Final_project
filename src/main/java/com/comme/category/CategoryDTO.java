package com.comme.category;

public class CategoryDTO {
	private int seq_category;
	private String category_name;
	private int category_pk;
	
	public CategoryDTO() {}

	public CategoryDTO(int seq_category, String category_name, int category_pk) {
		super();
		this.seq_category = seq_category;
		this.category_name = category_name;
		this.category_pk = category_pk;
	}

	public int getSeq_category() {
		return seq_category;
	}

	public void setSeq_category(int seq_category) {
		this.seq_category = seq_category;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public int getCategory_pk() {
		return category_pk;
	}

	public void setCategory_pk(int category_pk) {
		this.category_pk = category_pk;
	}

	@Override
	public String toString() {
		return seq_category + " : " + category_name +  " : " 
				+ category_pk;
	}
	
	
}
