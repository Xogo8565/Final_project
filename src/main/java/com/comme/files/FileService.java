package com.comme.files;

import com.comme.utils.ConvertFileUrlToPath;
import com.google.gson.JsonObject;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
        List<String> list = convertFileUrlToPath.convertToFilename(files_name);
        List<String> list2 = convertFileUrlToPath.convertTofullPath(files_name);

        for(String filename : list){
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

    public void delete_volFile(List<String> file_name, String path) throws Exception {
        List<String> list = convertFileUrlToPath.convertTofullPath(file_name);
        for(String temp : list){
            File file = new File(path+File.separator+temp);
            logger.info("삭제파일" + file);
            if(file.exists()) {
                file.delete();
            }
        }
    }

    public void update_volFile(int seq_board, List<String> files_name, String[] temp_files, String path) throws Exception {
        List<String> list = convertFileUrlToPath.convertToFilename(files_name);
        List<String> list2 = convertFileUrlToPath.convertTofullPath(files_name);
        List<FileDTO> fileList = fileDAO.get_volFileList(seq_board);



        for(FileDTO fileDTO : fileList){
            if(!list.contains(fileDTO.getFiles_sys())) {
                delete_volFile(fileDTO.getSeq_file());

                File file = new File(path+File.separator+fileDTO.getFiles_sys());
                if(file.exists()) {
                    file.delete();
                }
            }
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

    @Override
    public List<FileDTO> get_volFileList(int seq_board) throws Exception {
        return fileDAO.get_volFileList(seq_board);
    }

    @Override
    public int delete_volFile(int seq_file) throws Exception {
        return fileDAO.delete_volFile(seq_file);
    }
}
