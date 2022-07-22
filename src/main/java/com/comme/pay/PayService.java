package com.comme.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class PayService implements PayDAO {
	@Autowired
	private PayDAO payDAO;

    @Override
    public int insert(PayDTO payDTO) throws Exception {
        payDAO.insert(payDTO);
        return payDTO.getSeq_pay();
    }

    public Map<String, Object> select(int seq_pay) throws Exception {
        return payDAO.select(seq_pay);
    }
}
