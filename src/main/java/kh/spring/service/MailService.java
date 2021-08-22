package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.MailDAO;
import kh.spring.dto.St_MailDTO;

@Service
public class MailService {
	
	@Autowired
	private MailDAO dao;
	
	public List<String> mailList(String school){
		return dao.mailList(school);
	}

	public int addStudent(St_MailDTO dto) {
		System.out.println(dto.getStu_name()+" : " + dto.getStu_email() + ":"+dto.getSchool());
		return dao.addStudent(dto);
	}
	
	public List<St_MailDTO> studentList(String school){
		return dao.studentList(school);
	}
}
