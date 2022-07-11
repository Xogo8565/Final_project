package com.comme.vol;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface VolBoardDAO {
    List<VolBoardDTO> selectList(@Param("start") int start,@Param("end") int end) throws Exception;

    int selectTotalCnt() throws Exception;

    int insert(VolBoardDTO volBoardDTO) throws Exception;
}
