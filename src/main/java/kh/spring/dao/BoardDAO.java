package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kh.spring.dto.BoardDTO;

@Repository
public class BoardDAO {

	@Autowired
	private JdbcTemplate jdbc;

	@Autowired
	private SqlSessionTemplate mybatis;

	//	public int boardWrite(BoardDTO dto) {
	//		String sql = "insert into board values (?, ?, ?, ?, sysdate, 0)";
	//		return jdbc.update(sql, dto.getSeq(),dto.getTitle(), dto.getContent(), dto.getWriter());
	//	}

	public int boardWrite(BoardDTO dto) {
		return mybatis.insert("Board.boardWrite", dto);
	}

	public int seqNextval() {
		return mybatis.selectOne("Board.seqNextval");
	}

	public List<BoardDTO> boardList(){
		return mybatis.selectList("Board.boardList");
	}
	public int delete(int seq) {
		return mybatis.delete("Board.boardDelete", seq);
	}

	public int modify(BoardDTO dto) {
		return mybatis.update("Board.boardModify", dto);
	}




}
