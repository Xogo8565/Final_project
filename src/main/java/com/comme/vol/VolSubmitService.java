package com.comme.vol;

import com.comme.board.BoardDTO;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VolSubmitService implements VolSubmitDAO {
    @Autowired
    private VolSubmitDAO volSubmitDAO;

    @Override
    public int insert(VolSubmitDTO volSubmitDTO) throws Exception {
        return volSubmitDAO.insert(volSubmitDTO);
    }

    @Override
    public int count(VolSubmitDTO volSubmitDTO) throws Exception {
        return volSubmitDAO.count(volSubmitDTO);
    }

}