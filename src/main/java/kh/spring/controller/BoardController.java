package kh.spring.controller;

import java.util.List;

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
	
	@RequestMapping("boardList")
	public String boardList() {
		System.out.println(" hi");
		return "board/boardList";
	}
	
	@RequestMapping("writeProc")
	public String writeProc(String title, String content) throws Exception{
		   
		MemberDTO mmdto = (MemberDTO)session.getAttribute("login");
		String writer = mmdto.getEmail();
		
		int seq = bservice.seqNextval();
		int result = bservice.boardWrite(new BoardDTO(seq,title,content,writer));
		
		return "redirect:/bod/boardList";
	}
	
//	@RequestMapping("boardList") 
//	public String boardlist(int cpage, String key, String word, Model model) {
//		System.out.println("요청페이지 : " + cpage);
//
//		List<BoardDTO> list = bservice.boardlist(cpage); 
//		List<String> navi = bservice.navi(cpage);
//
//		model.addAttribute("list", list);
//		model.addAttribute("navis", navi);
//
//		return "board/boardList";
//	}

}
