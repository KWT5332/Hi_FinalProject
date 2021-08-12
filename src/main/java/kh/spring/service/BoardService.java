package kh.spring.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.config.BoardConfig;
import kh.spring.dao.BoardDAO;
import kh.spring.dto.BoardDTO;

@Service
public class BoardService {

	
	@Autowired
	private BoardDAO bdao;
	
	public int boardWrite(BoardDTO dto) {
		return bdao.boardWrite(dto);
	}
	
	public int seqNextval() {
		return bdao.seqNextval();
	}
	
	public List<BoardDTO> boardList() {
		return bdao.boardList();
	}
	
	public BoardDTO boardView(int seq) {
		return bdao.boardView(seq);
	}
	
	public int delete(int seq) {
		return bdao.delete(seq);
	}
	
	public int modify(BoardDTO dto) {
		return bdao.modify(dto);
	}
	
	public int updateViewcnt(int seq) {
		return bdao.updateViewcnt(seq);
	}
	
}
