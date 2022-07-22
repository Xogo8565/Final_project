package com.comme.files;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface FileDAO {
	
	// 실종게시판 파일 상세보기
	List<FileDTO> selectByMissing(int seq_board);

    void insert_file(@Param("fileDTO") FileDTO fileDTO, @Param("table_name") String table_name) throws Exception;

    List<FileDTO> get_fileList(@Param("seq_board") int seq_board, @Param("table_name") String table_name) throws Exception;

    int delete_file(@Param("seq_file") int seq_file, @Param("table_name") String table_name) throws Exception;

	void insertFile(FileDTO dto);
	
	List<FileDTO> deleteFileList(int seq_board);
	
	void deleteByFileSys(String files_sys);
}
