package kh.spring.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.config.XSSFillterConfig;
import kh.spring.dto.BoardDTO;
import kh.spring.dto.Board_CommentsDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.BoardService;
import kh.spring.service.FileService;

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
	
	@RequestMapping(value="writeProc")
	public String writeProc(String title, String content) {
		  System.out.println(title + ":" + content);
		MemberDTO mmdto = (MemberDTO)session.getAttribute("login");
		String writer = mmdto.getEmail();
		System.out.println(writer);
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
		List<Board_CommentsDTO> commentsList = bservice.commentsList(seq);
		bservice.updateViewcnt(seq);
		model.addAttribute("detail", dto);
		model.addAttribute("commentsList",commentsList);
		return "board/boardView";
	}
	
	@RequestMapping("updateView")
	public String boardModify(int seq, Model model) {
		BoardDTO dto = bservice.boardView(seq);
		model.addAttribute("detail",dto);

		return "board/boardModify";
	}
	
	@RequestMapping("modifyProc")
	public String modifyProc (BoardDTO dto, Model model) {
		bservice.modify(dto);
		BoardDTO ndto = bservice.boardView(dto.getSeq());
		model.addAttribute("detail", ndto);
		return "redirect:/bod/viewProc?seq="+ndto.getSeq();
	}
	
	@RequestMapping("boardDelete")
	public String boardDelete(int seq) {
		bservice.boardDelete(seq);
		return "redirect:/bod/boardList";
	}

	@RequestMapping(value="uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile file, HttpServletRequest request )  throws 	Exception {
		String realPath = session.getServletContext().getRealPath("summers"); 
		
		File filesPath = new File(realPath);
		
		if(!filesPath.exists()) { filesPath.mkdir(); }

		String oriName = file.getOriginalFilename(); 
		String sysName = UUID.randomUUID().toString().replace("-", "") + "_" + oriName;
		file.transferTo(new File(filesPath.getAbsolutePath()+"/"+sysName));

		return "/summers/"+sysName;
	}

	   @RequestMapping(value = "addCommnetnsProc", method = RequestMethod.POST) // ajax 로 보낼때는  method = RequestMethod.POST 꼭 써야한다
	   @ResponseBody // ajax를 받은 결과값을 보내줄때 쓰는 어노테이션 꼭 붙여줘야한다
	   public String addComments(String contents, int board_seq){
	      System.out.println("댓글 등록");
	      System.out.println(contents);
	      System.out.println("보드 시퀀스" + board_seq);
	      
		  MemberDTO mmdto = (MemberDTO)session.getAttribute("login");
		  String writer = mmdto.getEmail();
	      bservice.addCommnetnsProc(new Board_CommentsDTO(0,writer,XSSFillterConfig.XSSFilter(contents),null,board_seq));
	      return ""; 
	   }
	   
	   @RequestMapping("deleteCommnetns")
	   public String deleteCommnetns (int seq, int board_seq) {
		   System.out.println("댓글 시퀀스"+seq);
		   System.out.println(board_seq);
		   bservice.deleteCommnetns(seq);
		   return "redirect:/bod/viewProc?seq="+board_seq;

	   }
	   
	   @RequestMapping("updateCommnetns")
		public String updateCommnetns (String contents, int seq, int board_seq) {
			bservice.updateCommnetns(XSSFillterConfig.XSSFilter(contents), seq);
			return "redirect:/bod/viewProc?seq="+board_seq;
		}
	   
		@ExceptionHandler
		public String exceptionHandler(Exception e) {
			e.printStackTrace();
			return "error";
		}
}

