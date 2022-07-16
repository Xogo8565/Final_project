package com.comme.files;

import com.google.gson.JsonObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/file")
public class FileController {

    Logger logger = LoggerFactory.getLogger(FileController.class);
    @Autowired
    private HttpSession httpSession;
    @Autowired
    private FileService fileService;

    @PostMapping(value="/vol_img", produces = "application/json")
    @ResponseBody
    public String uploadVol_summernoteImg(MultipartFile file) throws Exception {
        String path = "/files/vol";
        String realpath = httpSession.getServletContext().getRealPath(path.substring(1));
        JsonObject jsonObject = fileService.upload_summernoteFile(realpath, file, path);
        return jsonObject.toString();
    }

    @PostMapping(value="/support_img", produces = "application/json")
    @ResponseBody
    public String uploadSupport_SummernoteImg(MultipartFile file) throws Exception {
        String path = "/files/support";
        String realpath = httpSession.getServletContext().getRealPath(path.substring(1));
        JsonObject jsonObject = fileService.upload_summernoteFile(realpath, file, path);
        return jsonObject.toString();
    }
}
