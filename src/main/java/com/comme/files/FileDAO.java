package com.comme.files;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FileDAO {

	void insertFile(FileDTO dto);
	
	List<FileDTO> deleteFileList(int seq_board);
	
	void deleteByFileSys(String files_sys);
}
