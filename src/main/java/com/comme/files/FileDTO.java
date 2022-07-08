package com.comme.files;

public class FileDTO {
	private int seq_file, seq_board;
	private String files_upload, files_ori, files_sys;
	
	public FileDTO() {}

	public FileDTO(int seq_file, int seq_board, String files_upload, String files_ori, String files_sys) {
		super();
		this.seq_file = seq_file;
		this.seq_board = seq_board;
		this.files_upload = files_upload;
		this.files_ori = files_ori;
		this.files_sys = files_sys;
	}

	public int getSeq_file() {
		return seq_file;
	}

	public void setSeq_file(int seq_file) {
		this.seq_file = seq_file;
	}

	public int getSeq_board() {
		return seq_board;
	}

	public void setSeq_board(int seq_board) {
		this.seq_board = seq_board;
	}

	public String getFiles_upload() {
		return files_upload;
	}

	public void setFiles_upload(String files_upload) {
		this.files_upload = files_upload;
	}

	public String getFiles_ori() {
		return files_ori;
	}

	public void setFiles_ori(String files_ori) {
		this.files_ori = files_ori;
	}

	public String getFiles_sys() {
		return files_sys;
	}

	public void setFiles_sys(String files_sys) {
		this.files_sys = files_sys;
	}

	@Override
	public String toString() {
		return seq_file + " : " + seq_board + " : " + files_upload + " : " + files_ori + " : " + files_sys;
	}
}
