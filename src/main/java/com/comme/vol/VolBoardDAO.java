package com.comme.vol;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface VolBoardDAO {
    List<Map<String, Object>> selectList(@Param("start") int start,@Param("end") int end) throws Exception;

    int selectTotalCnt() throws Exception;

    int insert(VolBoardDTO volBoardDTO) throws Exception;

    Map<String, Object> select(int seq_board) throws Exception;

    int delete(int seq_board) throws Exception;

    int plusViewCount(int seq_board) throws Exception;

    int update(VolBoardDTO volBoardDTO) throws Exception;
}
