package com.comme.vol;

import com.comme.member.MemberDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/vol")
public class VolSubmitController {
    @Autowired
    private VolSubmitService volSubmitService;
    @Autowired
    private HttpSession httpSession;

    private Logger logger = LoggerFactory.getLogger(VolSubmitController.class);

    @PostMapping(value = "/submit")
    public String insert(VolSubmitDTO volSubmitDTO) throws Exception {
        volSubmitDTO.setMember_id(((MemberDTO)httpSession.getAttribute("loginSession")).getMember_id());
        volSubmitDTO.setWriter_name(((MemberDTO)httpSession.getAttribute("loginSession")).getMember_name());

        //중복 검사
        if(volSubmitService.count(volSubmitDTO)>0) return "duplicated";

        int rs = volSubmitService.insert(volSubmitDTO);

        if(rs==1) return "success";
        else return "fail";
    }
    @GetMapping(value = "/submit")
    public String count(VolSubmitDTO volSubmitDTO) throws Exception {
       return String.valueOf(volSubmitService.count(volSubmitDTO));
    }
}
