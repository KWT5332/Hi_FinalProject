package kh.spring.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kh.spring.dto.BoardDTO;
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
	
	
	@Autowired
	private FileService fservice;
	
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
		bservice.updateViewcnt(seq);
		model.addAttribute("detail", dto);
		return "board/boardView";
	}
	
//	@RequestMapping("boardView")
//	public String boardView() {
//		return "bod/viewProc";
//	}
	
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
		return "board/boardView";
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
	
//	@RequestMapping(value="uploadSummernoteImageFile", produces = "application/json; charset=utf8")
//	@ResponseBody
//	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
//		System.out.println("dd");
//		JsonObject jsonObject = new JsonObject();
//		
//        /*
//		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
//		 */
//		
//		// 내부경로로 저장
//		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
//		String fileRoot = contextRoot+"resources/fileupload/";
//		
//		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
//		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
//		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
//		
//		File targetFile = new File(fileRoot + savedFileName);	
//		try {
//			InputStream fileStream = multipartFile.getInputStream();
//			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
//			jsonObject.addProperty("url", "/summernote/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
//			jsonObject.addProperty("responseCode", "success");
//				
//		} catch (IOException e) {
//			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
//			jsonObject.addProperty("responseCode", "error");
//			e.printStackTrace();
//		}
//		String a = jsonObject.toString();
//		return a;
//	}
	
	
	
}

