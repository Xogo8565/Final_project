package com.comme.files;

import com.comme.utils.ConvertFileUrlToPath;
import com.google.gson.JsonObject;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Service
public class FileService implements FileDAO {
    @Autowired
    private FileDAO fileDAO;

    @Autowired
    private ConvertFileUrlToPath convertFileUrlToPath;

    Logger logger = LoggerFactory.getLogger(FileService.class);

    public JsonObject upload_volFile(String path, MultipartFile file) throws Exception {

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


    public void insert_volFile(int seq_board, List<String> files_name, String[] temp_files, String path) throws Exception {
        List<Map<String, String>> list = convertFileUrlToPath.convert(files_name);
        List<String> list2 = convertFileUrlToPath.convertToStrList(files_name);

        for(Map<String, String> map : list){
            String filename = map.get("files_sys");
            insert_volFile(new FileDTO(0,seq_board, "/files/vol",null, filename));
        }

        for(String temp : temp_files){
            if(!list2.contains(temp)){
                File file = new File(path+File.separator+temp);
                if(file.exists()) {
                    file.delete();
                }
            }
        }

    }

    @Override
    public void insert_volFile(FileDTO fileDTO) throws Exception {
        fileDAO.insert_volFile(fileDTO);
    }

    public void delete_volFile(List<String> file_name, String path) throws Exception {
        List<String> list = convertFileUrlToPath.convertToStrList(file_name);
        for(String temp : list){
            File file = new File(path+File.separator+temp);
            logger.info("삭제파일" + file);
            if(file.exists()) {
                file.delete();
            }
        }
    }
}
