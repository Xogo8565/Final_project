package com.comme.pay;

import com.comme.board.BoardService;
import com.comme.member.MemberDTO;
import com.google.gson.JsonObject;
import oracle.jdbc.proxy.annotation.Post;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;

@RequestMapping("/pay")
@Controller
public class PayController {

    @Autowired
    private PayService payService;
    @Autowired
    private HttpSession httpSession;

    @Autowired
    private BoardService boardService;

    Logger logger = LoggerFactory.getLogger(PayController.class);

    @PostMapping("/insert")
    @ResponseBody
    public String insert(PayDTO payDTO) throws Exception {
        logger.info(payDTO.toString());
        payDTO.setMember_id(((MemberDTO)httpSession.getAttribute("loginSession")).getMember_id());
        int seq_pay = payService.insert(payDTO);

        return String.valueOf(seq_pay);
    }

    @GetMapping("/result")
    public String result(int seq_pay, Model model) throws Exception {
        Map<String, Object> map = payService.select(seq_pay);
        model.addAttribute("map", map);

        model.addAttribute("mainCategory", boardService.mainCategory());
        model.addAttribute("inquiry", boardService.inquiryCategory());
        return "pay/result";
    }

}
