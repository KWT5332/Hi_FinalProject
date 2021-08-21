package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.FileDTO;

@Repository
public class FileDAO {

	
	@Autowired
	private JdbcTemplate jdbc;

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int fileUpload(Map<String,Object> map) {
		return mybatis.insert("File.fileUpload", map);
	}
	
	
	
	
}
