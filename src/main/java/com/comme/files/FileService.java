package com.comme.files;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileService {
	@Autowired
	private FileDAO dao;
	
	public void insertFile(FileDTO dto) throws Exception{
		dao.insertFile(dto);
	}
	
	public List<FileDTO> deleteFileList(int seq_board) throws Exception{
		return dao.deleteFileList(seq_board);
	}
	
	public void deleteByFileSys(String files_sys) throws Exception{
		dao.deleteByFileSys(files_sys);
	}
}
