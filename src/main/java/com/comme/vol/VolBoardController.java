package com.comme.vol;

import com.comme.files.FileService;
import com.comme.member.MemberDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/volBoard")
public class VolBoardController {
    @Autowired
    private VolBoardService volBoardService;
    @Autowired
    private FileService fileService;
    @Autowired
    private HttpSession httpSession;

    Logger logger = LoggerFactory.getLogger(VolBoardController.class);

    @GetMapping("/lists")
    public String volBoard(@RequestParam(value = "curPage", defaultValue = "1") int curPage, Model model) throws Exception {
        // test 용
        httpSession.setAttribute("loginSession", new MemberDTO("test","test","test","test","test","0100000000","n","1",null));
        int start = 1;
        int end = 12;
        List<Map<String, Object>> list = volBoardService.selectList(start, end);
        model.addAttribute("list", list);
        return "vol/vol_board_list";
    }

    @GetMapping("/write")
    public String write(Model model) throws Exception {
        int total = volBoardService.selectTotalCnt();
        List<Map<String, Object>> list = volBoardService.selectList(total-1,total);
        model.addAttribute("list", list);
        return "vol/vol_board_write";
    }

    @PostMapping("/write")
    public String write(VolBoardDTO volBoardDTO, String area, @RequestParam(value = "files_name") List<String> files_name, @RequestParam(value = "temp_files[]") String[] temp_files) throws Exception {
        String path = httpSession.getServletContext().getRealPath("");
        volBoardDTO.setBoard_title("["+area+"]"+volBoardDTO.getBoard_title());
        volBoardDTO.setMember_id(((MemberDTO)httpSession.getAttribute("loginSession")).getMember_id());
        volBoardDTO.setWriter_nickname(((MemberDTO)httpSession.getAttribute("loginSession")).getMember_id());

        int seq_board = volBoardService.insert(volBoardDTO);

        fileService.insert_volFile(seq_board, files_name, temp_files, path);

        return "redirect:/volBoard/lists";
    }

    @GetMapping("/view")
    public String detail(@RequestParam(value = "seq_board") int seq_board, Model model) throws Exception {
        volBoardService.plusViewCount(seq_board);

        Map<String, Object> map = volBoardService.select(seq_board);
        model.addAttribute("map", map);


        int total = volBoardService.selectTotalCnt();
        List<Map<String, Object>> list = volBoardService.selectList(total-1,total);
        model.addAttribute("list", list);

        return "vol/vol_board_detail";
    }

    @PostMapping("/delete")
    public String delete(int seq_board, @RequestParam("file_name") List<String> file_name) throws Exception {
        volBoardService.delete(seq_board);
        String path = httpSession.getServletContext().getRealPath("");
        fileService.delete_volFile(file_name, path);

        return "redirect:/volBoard/lists";
    }

    @GetMapping("/modify")
    public String toModify(int seq_board, Model model) throws Exception {

        Map<String, Object> map = volBoardService.select(seq_board);
        String title = (String) map.get("board_title");
        int idx = title.indexOf("]");
        String area = title.substring(1, idx);
        String board_title = title.substring(idx+1);
        map.put("area", area);
        map.put("board_title", board_title);
        model.addAttribute("map", map);



        int total = volBoardService.selectTotalCnt();
        List<Map<String, Object>> list = volBoardService.selectList(total-1,total);
        model.addAttribute("list", list);

        return "vol/vol_board_modify";
    }

    @PostMapping("/modify")
    public String modify(VolBoardDTO volBoardDTO, String area, @RequestParam(value = "files_name") List<String> files_name, @RequestParam(value = "temp_files[]") String[] temp_files) throws Exception {
        String path = httpSession.getServletContext().getRealPath("");
        volBoardDTO.setBoard_title("["+area+"]"+volBoardDTO.getBoard_title());
        volBoardDTO.setMember_id(((MemberDTO)httpSession.getAttribute("loginSession")).getMember_id());
        volBoardDTO.setWriter_nickname(((MemberDTO)httpSession.getAttribute("loginSession")).getMember_id());

        volBoardService.update(volBoardDTO);
        fileService.update_volFile(volBoardDTO.getSeq_board(), files_name, temp_files, path);


        return "redirect:/volBoard/lists";
    }
}
