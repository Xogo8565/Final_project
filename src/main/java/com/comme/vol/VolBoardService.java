package com.comme.vol;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class VolBoardService implements VolBoardDAO {
    @Autowired
    VolBoardDAO volBoardDAO;

    @Override
    public List<Map<String, Object>> selectList(int start, int end) throws Exception {
        return  volBoardDAO.selectList(start, end);
    }

    @Override
    public int selectTotalCnt() throws Exception {
        return volBoardDAO.selectTotalCnt();
    }
    @Override
    public int insert(VolBoardDTO volBoardDTO) throws Exception {
        volBoardDAO.insert(volBoardDTO);
        return volBoardDTO.getSeq_board();
    }

    @Override
    public Map<String, Object> select(int seq_board) throws Exception {
        return volBoardDAO.select(seq_board);
    }

    @Override
    public int delete(int seq_board) throws Exception {
       return volBoardDAO.delete(seq_board);
    }

    @Override
    public int plusViewCount(int seq_board) throws Exception {
        return volBoardDAO.plusViewCount(seq_board);
    }

    @Override
    public int update(VolBoardDTO volBoardDTO) throws Exception {
        return volBoardDAO.update(volBoardDTO);
    }
}
