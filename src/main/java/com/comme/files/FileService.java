package com.comme.files;

import com.comme.utils.ConvertFileUrlToPath;
import com.google.gson.JsonObject;
import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
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

    // 봉사활동 게시판
    // 서머노트 파일 업로드
    public JsonObject upload_summernoteFile(String realpath, MultipartFile file, String path) throws Exception {

        JsonObject jsonObject = new JsonObject();
        File dir = new File(realpath);
        if (!dir.exists()) dir.mkdir();

        String files_ori = file.getOriginalFilename();
        String files_sys = UUID.randomUUID() + "_" + files_ori;
        File target = new File(realpath + File.separator + files_sys);
        try {
            InputStream fileInputStream = file.getInputStream();
            FileUtils.copyInputStreamToFile(fileInputStream, target);
            jsonObject.addProperty("url", path +"/"+ files_sys);
            jsonObject.addProperty("responseCode", "success");
        } catch (IOException e) {
            FileUtils.deleteQuietly(target);    //저장된 파일 삭제
            jsonObject.addProperty("responseCode", "error");
            e.printStackTrace();
        }


        return jsonObject;
    }
   

    // 테이블 저장
    public void insert_file(int seq_board, List<String> files_name, String[] temp_files, String path, String table_name) throws Exception {
        List<String> list = convertFileUrlToPath.convertTofullPath(files_name);

        for(String filename : list){
            String[] strings = filename.split(File.separator);
            System.out.println(strings[1]+":"+strings[2]);
            insert_file(new FileDTO(0,seq_board,path+strings[1]+File.separator+strings[2],null, strings[3]), table_name);
        }

        for(String temp : temp_files){
            if(!list.contains(temp)){
                File file = new File(path+File.separator+temp);
                if(file.exists()) {
                    file.delete();
                }
            }
        }
    }

    // 파일 삭제
    public void delete_file(List<String> file_name, String path) throws Exception {
        List<String> list = convertFileUrlToPath.convertTofullPath(file_name);
        for(String temp : list){
            File file = new File(path+File.separator+temp);
            logger.info("삭제파일" + file);
            if(file.exists()) {
                file.delete();
            }
        }
    }

    // 수정시 변동사항 저장
    public void update_file(int seq_board, List<String> files_name, String[] temp_files, String path, String table_name) throws Exception {
        //게시물에서 불러온 리스트
        List<String> list = convertFileUrlToPath.convertToFilename(files_name);
        List<String> list2 = convertFileUrlToPath.convertTofullPath(files_name);
        // 테이블 저장 리스트
        List<FileDTO> fileList = fileDAO.get_fileList(seq_board, table_name);
        List<String> fileList2 = new ArrayList<>();
        fileList.forEach( e -> fileList2.add(e.getFiles_sys()));

        // 테이블 저장된 리스트 중 게시물에 없는 항목 삭제
        for(FileDTO fileDTO : fileList){
            if(!list.contains(fileDTO.getFiles_sys())) {
                delete_file(fileDTO.getSeq_file(), table_name);

                File file = new File(path+File.separator+fileDTO.getFiles_sys());
                System.out.println(file);
                if(file.exists()) {
                    file.delete();
                }
            }
        }

        // 게시글에 저장된 리스트 중 테이블에 없는 항목 저장
        for(String s : list){
            if(!fileList2.contains(s)){
                fileDAO.insert_file(new FileDTO(0, seq_board, path,null,s), table_name);
            }
        }



        //임시 파일 삭제
        for(String temp : temp_files){
            if(!list2.contains(temp)){
                File file = new File(path+File.separator+temp);
                if(file.exists()) {
                    file.delete();
                }
            }
        }

    }

	public void deleteFileMissing(String files_sys) {
		fileDAO.deleteFileMissing(files_sys);
	}
	public List<FileDTO> fileListMissing(int seq_board){
		return fileDAO.fileListMissing(seq_board);
	}
	
    public void insertFile(FileDTO dto){
		fileDAO.insertFile(dto);
	}
	
	public List<FileDTO> deleteFileList(int seq_board){
		return fileDAO.deleteFileList(seq_board);
	}
	
	public void deleteByFileSys(String files_sys){
		fileDAO.deleteByFileSys(files_sys);
	}

    @Override
    public List<FileDTO> selectByMissing(int seq_board) {
        return fileDAO.selectByMissing(seq_board);
    }

    @Override
    public void insert_file(@Param("fileDTO") FileDTO fileDTO, @Param("table_name") String table_name) throws Exception {
        fileDAO.insert_file(fileDTO, table_name);
    }

    @Override
    public List<FileDTO> get_fileList(@Param("seq_board") int seq_board, @Param("table_name") String table_name) throws Exception {
        return fileDAO.get_fileList(seq_board, table_name);
    }

    @Override
    public int delete_file(@Param("seq_file") int seq_file,@Param("table_name") String table_name) throws Exception {
        return fileDAO.delete_file(seq_file, table_name);
    }



}
