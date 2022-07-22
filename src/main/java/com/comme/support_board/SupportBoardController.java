package com.comme.support_board;

import com.comme.files.FileService;
import com.comme.member.MemberDTO;
import com.comme.vol.VolBoardController;
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
@RequestMapping(value = "/supportBoard")
public class SupportBoardController {
    @Autowired
    private SupportBoardService supportBoardService;
    @Autowired
    private FileService fileService;
    @Autowired
    private HttpSession httpSession;

    Logger logger = LoggerFactory.getLogger(VolBoardController.class);

    @GetMapping("/lists")
    public String volBoard(@RequestParam(value = "curPage", defaultValue = "1") int curPage, Model model) throws Exception {
        Map<String, Object> map = supportBoardService.selectList(curPage);
        model.addAttribute("map", map);
        return "support/support_board_list";
    }

    @GetMapping("/write")
    public String write() throws Exception {
        return "support/support_board_write";
    }

    @PostMapping("/write")
    public String wrtie(SupportBoardDTO supportBoardDTO, String bank_category, @RequestParam(value = "files_name") List<String> files_name, @RequestParam(value = "temp_files[]") String[] temp_files) throws Exception {
        String path = httpSession.getServletContext().getRealPath("");
        supportBoardDTO.setSupport_bank(bank_category+ " " +supportBoardDTO.getSupport_bank());
        supportBoardDTO.setMember_id(((MemberDTO)httpSession.getAttribute("loginSession")).getMember_id());
        supportBoardDTO.setWriter_nickname(((MemberDTO)httpSession.getAttribute("loginSession")).getMember_id());
        supportBoardDTO.setMember_brn(((MemberDTO)httpSession.getAttribute("loginSession")).getMember_brn());

        int seq_board = supportBoardService.insert(supportBoardDTO);

        fileService.insert_file(seq_board,files_name,temp_files,path,"support_files");

        return "redirect:/supportBoard/lists";
    }
    @GetMapping("/view")
    public String detail(@RequestParam(value = "seq_board") int seq_board, Model model) throws Exception {

        Map<String, Object> map = supportBoardService.select(seq_board);
        model.addAttribute("map", map);


        return "support/support_board_detail";
    }

    @GetMapping("/order")
    public String order(int seq_board, int order_number, int price, Model model) throws Exception {

        Map<String, Object> map = supportBoardService.select(seq_board);
        model.addAttribute("map", map);
        model.addAttribute("order_number", order_number);
        model.addAttribute("price", price);

        return "pay/payment";
    }

    @PostMapping("/delete")
    public String delete(int seq_board, @RequestParam("file_name") List<String> file_name) throws Exception {
        supportBoardService.delete(seq_board);
        String path = httpSession.getServletContext().getRealPath("");
        fileService.delete_file(file_name, path);

        return "redirect:/volBoard/lists";
    }

    @GetMapping("/modify")
    public String toModify(int seq_board, Model model) throws Exception {

        Map<String, Object> map = supportBoardService.select(seq_board);
        String support_bank = (String) map.get("support_bank");
        int idx = support_bank.indexOf(" ");
        String bank = support_bank.substring(1, idx);
        support_bank = support_bank.substring(idx+1);
        map.put("bank", bank);
        map.put("support_bank", support_bank);
        model.addAttribute("map", map);

        return "support/support_board_modify";
    }

    @PostMapping("/modify")
    public String modify(SupportBoardDTO supportBoardDTO, String bank_category, @RequestParam(value = "files_name") List<String> files_name, @RequestParam(value = "temp_files[]") String[] temp_files) throws Exception {
        String path = httpSession.getServletContext().getRealPath("files/support");
        supportBoardDTO.setSupport_bank(bank_category+ " " +supportBoardDTO.getSupport_bank());
        supportBoardDTO.setMember_id(((MemberDTO)httpSession.getAttribute("loginSession")).getMember_id());
        supportBoardDTO.setWriter_nickname(((MemberDTO)httpSession.getAttribute("loginSession")).getMember_id());

        supportBoardService.update(supportBoardDTO);
        logger.info("support:  " +supportBoardDTO);
        fileService.update_file(supportBoardDTO.getSeq_board(), files_name, temp_files, path,"support_files");


        return "redirect:/supportBoard/view?seq_board="+supportBoardDTO.getSeq_board();
    }

    @GetMapping("/search")
    public String search(@RequestParam(value = "curPage", defaultValue = "1") int curPage,
                         @RequestParam(value = "category") String category,
                         @RequestParam(value = "search") String search, Model model) throws Exception {

        Map<String, Object> map = supportBoardService.search(curPage, category, search);
        map.put("category", category);
        map.put("search", search);
        model.addAttribute("map", map);

        return "vol/vol_board_list";
    }


}
