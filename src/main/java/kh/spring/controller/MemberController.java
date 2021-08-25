package kh.spring.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kh.spring.dto.MemberDTO;
import kh.spring.service.MemberService;


@Controller
@RequestMapping("/mem")
public class MemberController {

	@Autowired
	private MemberService service;

	@Autowired
	private HttpSession session;

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping("joinForm")
	public String joinForm() {
		System.out.println("회원가입 화면");
		return "member/join";
	}
	@RequestMapping("joinProc")
	public String joinProc(MemberDTO dto) {
		System.out.println("회원가입");
		service.join(dto);
		return "redirect:/";
	}
	@RequestMapping("loginForm")
	public String loginForm() {
		System.out.println("로그인 화면");
		return "member/login";
	}
	@RequestMapping("loginProc")
	public String loginProc(String email, String pw) {
		System.out.println("로그인");
		MemberDTO dto  = service.login(email, pw);
		if(dto != null) {
			session.setAttribute("login",dto);
			// 세션 유지시간 1시간
		    session.setMaxInactiveInterval(60*60) ;
		}
		return "redirect:/";
	}
	@RequestMapping("mypage")
	public String mypage() {
		System.out.println("마페인");
		return "member/mypage";
	}
	//로그아웃프록
	@RequestMapping("logoutProc")
	public String logoutProc() {
		System.out.println("로그아웃");
		session.invalidate();
		return "redirect:/";
	}
	// 아이디 중복 검사
	@RequestMapping(value = "EmailChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception{
		//logger.info("memberIdChk() 진입");
		System.out.println("아이디체크");
		int result = service.idCheck(memberId);
		System.out.println("결과값 = " + result);
		if(result != 0) {
			return "fail";	// 중복 아이디가 존재
		} else {
			return "success";	// 중복 아이디 x
		}
	} // memberIdChkPOST() 종료	

	/* 이메일 인증 */
	@RequestMapping(value="mailCheck", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception{

		/* 뷰(View)로부터 넘어온 데이터 확인 */
		System.out.println("이메일 데이터 전송 확인");
		System.out.println("인증번호 : " + email);
		//logger.info();
		//logger.info();
		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		System.out.println("인증번호 " + checkNum);

		/* 이메일 보내기 */
		String setFrom = "project.hi.final@gmail.com";
		String toMail = email;
		String title = "하이!급식 인증 이메일 입니다.";
		String content = 
				"홈페이지를 방문해주셔서 감사합니다." +
						"<br><br>" + 
						"인증 번호는 " + checkNum + "입니다." + 
						"<br>" + 
						"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);

		}catch(Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);
		return num;
	}
	//회원정보수정
	@RequestMapping("modiName")
	public String modiName(MemberDTO dto) {
		service.modiName(dto);
		session.invalidate();
		session.setAttribute("login",dto);
		return "member/mypage";
	}
	@RequestMapping("modiSchool")
	public String modiSchool(MemberDTO dto) {
		service.modiSchool(dto);
		session.invalidate();
		session.setAttribute("login",dto);
		return "member/mypage";
	}
	@RequestMapping("modiPhone")
	public String modiPhone(MemberDTO dto) {
		service.modiPhone(dto);
		session.invalidate();
		session.setAttribute("login",dto);
		return "member/mypage";
	}
	@RequestMapping("modiAge")
	public String modiAge(MemberDTO dto) {
		service.modiAge(dto);
		session.invalidate();
		session.setAttribute("login",dto);
		return "member/mypage";
	}
	//비번
	@RequestMapping(value = "pwck", method = RequestMethod.POST)
	@ResponseBody
	public String pwck(String email, String pw) {
		int result = service.pwck(email, pw);
		
		if(result != 0) {
			return "success";	
		} else {
			return "fail";	
		}
	}
	@RequestMapping("modiPw")
	public String modiPw(MemberDTO dto) {
		service.modiPw(dto);
		session.invalidate();
		session.setAttribute("login",dto);
		return "member/mypage";
	}
	
	//
//	@RequestMapping(value = "imguploas", method = RequestMethod.POST)
//	@ResponseBody
//	public String imgupload(MultipartFile file, HttpServletResponse resp) throws Exception {
//		String realPath = session.getServletContext().getRealPath("files");
//		MemberDTO dto = (MemberDTO)session.getAttribute("login");
//		
//		File filesPath = new File(realPath);
//	      if(!filesPath.exists()) {
//	         filesPath.mkdir();
//	      }
//	      
//	      String oriName = file.getOriginalFilename();
//	      String sysName = UUID.randomUUID().toString().replace("-", "") + "_" + oriName;
//	      file.transferTo(new File(filesPath.getAbsolutePath()+"/"+sysName));
//	      
//	      dto.setOriName(oriName);
//	      dto.setSysName(sysName);
//
//	      service.imgupdate(dto);
//		
//	      resp.setContentType("application/octet-stream; charset=utf8");
//	      resp.setHeader("content-Disposition", "attachment;filename=\"" + oriName + "\"");
//
//	      try (OutputStream sos = resp.getOutputStream();) {
//	         //sos.wr;
//	         sos.flush();
//	      }
//		
//
//	}
	// 프로필 이미지 추가, 변경
	@ResponseBody
	@RequestMapping(value="imgupload", produces="text/html;charset=utf8")
	public String addmealProc(MultipartFile file, HttpServletResponse resp) throws Exception {
		System.out.println("이미지 추가");

		String realPath = session.getServletContext().getRealPath("profile_img");
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		String email = mdto.getEmail();

		String sysName = service.updateProfile(mdto, file, realPath); 

		return sysName;
	}
		
	@RequestMapping("display")
	@ResponseBody
	public ResponseEntity<byte[]> getImage(String fileName){
		String realPath = session.getServletContext().getRealPath("profile_img");
		System.out.println(realPath);
		File file = new File(realPath+"/"+fileName);
		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			System.out.println(result);
		}catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 멤버 찾기 폼
	@RequestMapping("findMember")
	public String findMember() {
		return "member/findMember";
	}
	//아이디찾기
	@RequestMapping(value="findIdProc", produces="text/html;charset=utf8")
	@ResponseBody
	public String findIdProc(String name, String phone) {
		int result = service.findIdProc(name,phone);
		Gson g = new Gson();
		String findDTO = null;
		if(result>0) {
			List<MemberDTO> dto = service.findIdMemebr(name, phone);
			findDTO= g.toJson(dto);
		}else {
			findDTO = String.valueOf(result);
		}
		return String.valueOf(findDTO);
	}
	//비번찾기
	@RequestMapping(value="findPwProc", produces="text/html;charset=utf8")
	@ResponseBody
	public String findPwProc(String name, String email) {
		int result = service.findPwProc(name,email);
		Gson g = new Gson();
		g.toJson(result);
		return String.valueOf(result);
	}
	//비번 재설정
	@RequestMapping(value="newPwProc", produces="text/html;charset=utf8")
	@ResponseBody
	public String newPwProc(String email, String pw) {
		int result = service.newPwProc(email, pw);
		Gson g = new Gson();
		g.toJson(result);
		return String.valueOf(result);
	}
	//프사 기본으로 설정
	@RequestMapping(value="profileBasic", produces="text/html;charset=utf8")
	@ResponseBody
	public String profileBasic(MemberDTO dto,String email, String sysnull) {
		int result = service.profileBasic(email,sysnull);
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		MemberDTO updto = service.memberInfo(email);
		String oriName = updto.getOriName();
		String sysName = updto.getSysName();
		mdto.setOriName(oriName);
		mdto.setSysName(sysName);
		session.setAttribute("login",mdto);
		Gson g = new Gson();
		g.toJson(result);
		return String.valueOf(result);
	}
	
	
}
