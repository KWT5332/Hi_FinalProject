package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.BoardDAO;
import kh.spring.dto.BoardDTO;
import kh.spring.dto.Board_CommentsDTO;

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
	
	public int boardDelete(int seq) {
		return bdao.boardDelete(seq);
	}
	
	public int modify(BoardDTO dto) {
		return bdao.modify(dto);
	}
	
	public int updateViewcnt(int seq) {
		return bdao.updateViewcnt(seq);
	}
	
	public int addCommnetnsProc(Board_CommentsDTO dto) {
		return bdao.addCommnetnsProc(dto);
	}

	public List<Board_CommentsDTO> commentsList(int board_seq){
		return bdao.commentsList(board_seq);
	}
	
}
