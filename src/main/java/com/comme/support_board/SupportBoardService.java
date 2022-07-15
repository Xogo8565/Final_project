package com.comme.support_board;

import com.comme.vol.VolBoardDAO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class SupportBoardService implements SupportBoardDAO {

    @Autowired
    SupportBoardDAO supportBoardDAO;

    @Override
    public List<Map<String, Object>> selectList(@Param("start") int start, @Param("end") int end) throws Exception {
        return  supportBoardDAO.selectList(start, end);
    }

    @Override
    public int selectTotalCnt() throws Exception {
        return supportBoardDAO.selectTotalCnt();
    }

    @Override
    public int insert(SupportBoardDTO supportBoardDTO) throws Exception {
        supportBoardDAO.insert(supportBoardDTO);
        return supportBoardDTO.getSeq_board();
    }
    @Override
    public Map<String, Object> select(int seq_board) throws Exception {
        return supportBoardDAO.select(seq_board);
    }
}
