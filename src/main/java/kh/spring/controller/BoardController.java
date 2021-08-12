package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.BoardDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.BoardService;

@Controller
@RequestMapping("/bod")
public class BoardController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private BoardService bservice;
	
	@RequestMapping("boardWrite")
	public String boardWrite() {
		return "board/boardWrite";
	}
	
//	@RequestMapping("boardList") 리스트 페이지 확인용
//	public String boardList() {
//		System.out.println(" hi");
//		return "board/boardList";
//	}
//	
	@RequestMapping("writeProc")
	public String writeProc(String title, String content) throws Exception{
		   
		MemberDTO mmdto = (MemberDTO)session.getAttribute("login");
		String writer = mmdto.getEmail();
		
		int seq = bservice.seqNextval();
		int result = bservice.boardWrite(new BoardDTO(seq,title,content,writer));
		
		return "redirect:/bod/boardList";
	}
	
	@RequestMapping("boardList") 
	public String boardlist( Model model) {
		model.addAttribute("list", bservice.boardList());
		return "board/boardList";
	}
	
	@RequestMapping("viewProc")
	public String viewProc(int seq, Model model) {
		BoardDTO dto = bservice.boardView(seq);
		model.addAttribute("detail", dto);
		bservice.updateViewcnt(seq);
		return "board/boardView";
	}
}
