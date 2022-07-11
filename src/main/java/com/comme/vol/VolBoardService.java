package com.comme.vol;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VolBoardService implements VolBoardDAO {
    @Autowired
    VolBoardDAO volBoardDAO;
    public List<VolBoardDTO> selectList() {
        return  volBoardDAO.selectList();
    }
}
