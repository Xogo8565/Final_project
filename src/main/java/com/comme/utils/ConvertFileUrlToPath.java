package com.comme.utils;

import org.springframework.stereotype.Component;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class ConvertFileUrlToPath {
    public List<Map<String,String>> convert(List<String> list) throws Exception {
        List<Map<String,String>> newList = new ArrayList<>();

        list.forEach(e->{
            String[] temp = e.split("files/"); // https:// ~ 제거
            String[] name = temp[1].split("/");
            String filepath = File.separator+"files"+File.separator+name[0]; // 저장 경로
            String files_sys = name[1]; // 파일 이름

            Map<String, String> map = new HashMap<>();
            map.put("filepath", filepath);
            map.put("files_sys", files_sys);

            newList.add(map);
        });

        return newList;
    }
    public List<String> convertToStrList(List<String> list) throws Exception {
        List<String> newList = new ArrayList<>();

        list.forEach(e->{
            String[] temp = e.split("files/"); // https:// ~ 제거
            String[] name = temp[1].split("/");
            String filepath = File.separator+"files"+File.separator+name[0]; // 저장 경로
            String files_sys = name[1]; // 파일 이름


            newList.add(filepath+File.separator+files_sys);
        });

        return newList;
    }

}
