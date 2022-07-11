package com.comme.vol;

import com.comme.files.FileDAO;
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
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

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
        int end = 9;
        logger.info("VolBoard - curPage : " + curPage);
        List<VolBoardDTO> list = volBoardService.selectList(start, end);
        model.addAttribute("list", list);
        return "vol/vol_board_list";
    }

    @GetMapping("/write")
    public String write(Model model) throws Exception {
        int total = volBoardService.selectTotalCnt();
        List<VolBoardDTO> list = volBoardService.selectList(total-1,total);
        model.addAttribute("list", list);
        return "vol/vol_board_write";
    }

    @PostMapping("/write")
    public String write(List<MultipartFile> fileList, VolBoardDTO volBoardDTO, String area) throws Exception {
        String path = httpSession.getServletContext().getRealPath("file/vol_board");
        volBoardDTO.setBoard_title(area+volBoardDTO.getBoard_title());
        volBoardDTO.setMember_id(((MemberDTO)httpSession.getAttribute("loginSession")).getMember_id());
        volBoardDTO.setWriter_nickname(((MemberDTO)httpSession.getAttribute("loginSession")).getMember_id());

        logger.info("게시글 등록 요청"+ volBoardDTO);

        int seq_board = volBoardService.insert(volBoardDTO);


        return "redirect:/volBoard/lists";
    }
}
