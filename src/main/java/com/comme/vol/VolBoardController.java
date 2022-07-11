package com.comme.vol;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class VolBoardController {
    @Autowired
    private VolBoardService volBoardService;

    @GetMapping("/volBoard")
    public String volBoard(Model model) throws Exception {
        List<VolBoardDTO> list = volBoardService.selectList();
        model.addAttribute("list", list);
        return "vol/vol_board_list";
    }
}
