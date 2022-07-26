package com.comme.vol;

import com.comme.board.BoardService;
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
import java.util.HashMap;
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

    @Autowired
    private BoardService boardService;

    Logger logger = LoggerFactory.getLogger(VolBoardController.class);

    @GetMapping("/lists")
    public String volBoard(@RequestParam(value = "curPage", defaultValue = "1") int curPage, Model model) throws Exception {

        Map<String, Object> map = volBoardService.selectList(curPage);
        model.addAttribute("mainCategory", boardService.mainCategory());
        model.addAttribute("inquiry", boardService.inquiryCategory());
        model.addAttribute("map", map);
        return "vol/vol_board_list";
    }

    @GetMapping("/write")
    public String write(Model model) throws Exception {
        model.addAttribute("mainCategory", boardService.mainCategory());
        model.addAttribute("inquiry", boardService.inquiryCategory());
        return "vol/vol_board_write";
    }

    @PostMapping("/write")
    public String write(VolBoardDTO volBoardDTO, String area, @RequestParam(value = "files_name") List<String> files_name, @RequestParam(value = "temp_files[]") String[] temp_files) throws Exception {
        String path = httpSession.getServletContext().getRealPath("");
        volBoardDTO.setBoard_title("["+area+"] "+volBoardDTO.getBoard_title());
        volBoardDTO.setMember_id(((MemberDTO)httpSession.getAttribute("loginSession")).getMember_id());
        volBoardDTO.setWriter_nickname(((MemberDTO)httpSession.getAttribute("loginSession")).getMember_id());

        int seq_board = volBoardService.insert(volBoardDTO);

        fileService.insert_file(seq_board, files_name, temp_files, path, "vol_files");

        return "redirect:/volBoard/lists";
    }

    @GetMapping("/view")
    public String detail(@RequestParam(value = "seq_board") int seq_board, Model model) throws Exception {
        volBoardService.plusViewCount(seq_board);

        Map<String, Object> map = volBoardService.select(seq_board);
        model.addAttribute("map", map);

        List<Map<String, Object>> list = volBoardService.selectListByDistance(seq_board);
        model.addAttribute("list", list);

        model.addAttribute("mainCategory", boardService.mainCategory());
        model.addAttribute("inquiry", boardService.inquiryCategory());

        return "vol/vol_board_detail";
    }

    @PostMapping("/delete")
    public String delete(int seq_board, @RequestParam("file_name") List<String> file_name) throws Exception {
        volBoardService.delete(seq_board);
        String path = httpSession.getServletContext().getRealPath("");
        fileService.delete_file(file_name, path);

        return "redirect:/volBoard/lists";
    }

    @GetMapping("/modify")
    public String toModify(@RequestParam("seq_board") int seq_board, Model model) throws Exception {

        Map<String, Object> map = volBoardService.select(seq_board);
        String title = (String) map.get("board_title");
        int idx = title.indexOf("] ");
        String area = title.substring(1, idx);
        String board_title = title.substring(idx+1);
        map.put("area", area);
        map.put("board_title", board_title);
        model.addAttribute("map", map);

        List<Map<String, Object>> list = volBoardService.selectListByDistance(seq_board);
        model.addAttribute("list", list);

        model.addAttribute("mainCategory", boardService.mainCategory());
        model.addAttribute("inquiry", boardService.inquiryCategory());

        return "vol/vol_board_modify";
    }

    @PostMapping("/modify")
    public String modify(VolBoardDTO volBoardDTO, String area, @RequestParam(value = "files_name") List<String> files_name, @RequestParam(value = "temp_files[]") String[] temp_files) throws Exception {
        String path = httpSession.getServletContext().getRealPath("files/vol");
        volBoardDTO.setBoard_title("["+area+"]"+volBoardDTO.getBoard_title());
        volBoardDTO.setMember_id(((MemberDTO)httpSession.getAttribute("loginSession")).getMember_id());
        volBoardDTO.setWriter_nickname(((MemberDTO)httpSession.getAttribute("loginSession")).getMember_id());

        volBoardService.update(volBoardDTO);
        fileService.update_file(volBoardDTO.getSeq_board(), files_name, temp_files, path,"vol_files");

        return "redirect:/volBoard/view?seq_board="+volBoardDTO.getSeq_board();
    }

    @GetMapping("/search")
    public String search(@RequestParam(value = "curPage", defaultValue = "1") int curPage,
                           @RequestParam(value = "category") String category,
                           @RequestParam(value = "search") String search, Model model) throws Exception {

        logger.info("검색요청  category" + category + "/    val" + search);
        Map<String, Object> map = volBoardService.search(curPage, category, search);
        map.put("category", category);
        map.put("search", search);
        model.addAttribute("map", map);

        model.addAttribute("mainCategory", boardService.mainCategory());
        model.addAttribute("inquiry", boardService.inquiryCategory());

        return "vol/vol_board_list";
    }
}
