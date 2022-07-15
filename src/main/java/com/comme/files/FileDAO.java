package com.comme.files;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface FileDAO {
	
	// 실종게시판 파일 상세보기
	List<FileDTO> selectByMissing(int seq_board);
}
