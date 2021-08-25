package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.PayDTO;

@Component
public class PayDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(PayDTO dto) {
		return mybatis.insert("Pay.insert", dto);
	}
	
	public List<PayDTO> payList(String school) {
		return mybatis.selectList("Pay.payList", school);
	}
	
}
