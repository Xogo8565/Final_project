package com.comme.vol;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface VolBoardDAO {
    List<VolBoardDTO> selectList();
}
