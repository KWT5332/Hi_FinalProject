package kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ChartDAO;
import kh.spring.dao.PayDAO;
import kh.spring.dto.ChartDTO;
import kh.spring.dto.PayDTO;

@Service
public class StudentService {

	@Autowired
	private ChartDAO cdao;
	
	@Autowired
	private PayDAO pdao;
	
	public int researchInsert(ChartDTO dto) {
		return cdao.insert(dto);
	}
	
	public int payInsert(PayDTO dto) {
		return pdao.insert(dto);
	}
	
}
