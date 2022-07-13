package com.comme.files;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FileDAO {
    void insert_volFile(FileDTO fileDTO) throws Exception;
}
