package com.comme.files;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FileDAO {
    void insert_volFile(FileDTO fileDTO) throws Exception;

    List<FileDTO> get_volFileList(int seq_board) throws Exception;

    int delete_volFile(int seq_file) throws Exception;
}
