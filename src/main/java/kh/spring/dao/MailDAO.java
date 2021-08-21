package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.St_MailDTO;

@Repository
public class MailDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<String> mailList(String school){
		return mybatis.selectList("Mail.mailList",school);
	}
	
	public int addStudent(St_MailDTO dto) {
		return mybatis.insert("Mail.addStudent",dto);
	}
	
	public List<St_MailDTO> studentList(String school){
		return mybatis.selectList("Mail.studentList",school);
	}
}
