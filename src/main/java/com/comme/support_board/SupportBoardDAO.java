package com.comme.support_board;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface SupportBoardDAO {
    List<Map<String, Object>> selectList(@Param("start") int start, @Param("end") int end) throws Exception;

    int selectTotalCnt(@Param("category") String category, @Param("search") String search) throws Exception;

    int insert(SupportBoardDTO supportBoardDTO) throws Exception;

    Map<String, Object> select(int seq_board) throws Exception;

    int delete(int seq_board) throws Exception;

    int update(SupportBoardDTO supportBoardDTO) throws Exception;

    List<Map<String, Object>> search(@Param("start") int start, @Param("end") int end, @Param("category") String category, @Param("search") String search) throws Exception;
}
