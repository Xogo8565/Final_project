package com.comme.files;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FileDAO {
    void insert_volFile(@Param("fileDTO") FileDTO fileDTO, @Param("table_name") String table_name) throws Exception;

    List<FileDTO> get_volFileList(@Param("seq_board") int seq_board, @Param("table_name") String table_name) throws Exception;

    int delete_volFile(@Param("seq_file") int seq_file, @Param("table_name") String table_name) throws Exception;

}
