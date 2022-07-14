package com.comme.vol;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VolSubmitDAO {

    int insert(VolSubmitDTO volSubmitDTO) throws Exception;

    int count(VolSubmitDTO volSubmitDTO) throws Exception;
}
