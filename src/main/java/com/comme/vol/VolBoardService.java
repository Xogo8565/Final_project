package com.comme.vol;

import com.comme.utils.PagingVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class VolBoardService implements VolBoardDAO {
    @Autowired
    VolBoardDAO volBoardDAO;

    public Map<String,Object> selectList(int curPage) throws Exception {
        int total = selectTotalCnt(null,null);
        Map<String, Object> map = new HashMap<>();
        PagingVO pagingVO = new PagingVO(total, curPage, 12);
        List<Map<String, Object>> list = selectList(pagingVO.getStart(), pagingVO.getEnd());
        map.put("pagingVO", pagingVO);
        map.put("list", list);

        return map;
    }

    public Map<String, Object> search(int curPage, String category, String search) throws Exception {
        int total = volBoardDAO.selectTotalCnt(category, search);
        Map<String, Object> map = new HashMap<>();
        PagingVO pagingVO = new PagingVO(total, curPage, 12);
        List<Map<String, Object>> list = search(pagingVO.getStart(), pagingVO.getEnd(), category, search);
        map.put("pagingVO", pagingVO);
        map.put("list", list);

        return map;
    }

    @Override
    public List<Map<String, Object>> selectList(int start, int end) throws Exception {
        return  volBoardDAO.selectList(start, end);
    }

    @Override
    public int selectTotalCnt(String category, String search) throws Exception {
        return volBoardDAO.selectTotalCnt(category, search);
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

    @Override
    public List<Map<String, Object>> search(int start, int end, String category, String search) throws Exception {
        return volBoardDAO.search(start, end, category, search);
    }

    @Override
    public List<Map<String, Object>> selectListByDistance(int seq_board) throws Exception {
        return volBoardDAO.selectListByDistance(seq_board);
    }
}
