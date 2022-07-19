package com.comme.pay;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface PayDAO {

    int insert(PayDTO payDTO) throws Exception;

    Map<String, Object> select(int seq_pay) throws Exception;
}
