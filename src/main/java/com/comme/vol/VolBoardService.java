package com.comme.vol;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VolBoardService implements VolBoardDAO {
    @Autowired
    VolBoardDAO volBoardDAO;

    @Override
    public List<VolBoardDTO> selectList(int start, int end) throws Exception {
        return  volBoardDAO.selectList(start, end);
    }

    @Override
    public int selectTotalCnt() throws Exception {
        return volBoardDAO.selectTotalCnt();
    }
    @Override
    public int insert(VolBoardDTO volBoardDTO) throws Exception {
        return volBoardDAO.insert(volBoardDTO);
    }
}
