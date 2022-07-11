package com.comme.files;

import com.google.gson.JsonObject;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

@Service
public class FileService {
    @Autowired
    FileDAO fileDAO;

    public JsonObject upload_volFile(String path, MultipartFile file) {
        JsonObject jsonObject = new JsonObject();
        File dir = new File(path);
        if (!dir.exists()) dir.mkdir();

        String files_ori = file.getOriginalFilename();
        String files_sys = UUID.randomUUID() + "_" + files_ori;
        File target = new File(path + File.separator + files_sys);
        try {
            InputStream fileInputStream = file.getInputStream();
            FileUtils.copyInputStreamToFile(fileInputStream, target);
            jsonObject.addProperty("url", "/files/vol/" + files_sys);
            jsonObject.addProperty("responseCode", "success");
        } catch (IOException e) {
            FileUtils.deleteQuietly(target);    //저장된 파일 삭제
            jsonObject.addProperty("responseCode", "error");
            e.printStackTrace();
        }

        return jsonObject;
    }


}
