package kh.spring.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.config.XSSFillterConfig;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.St_MailDTO;
import kh.spring.service.ExcelService;
import kh.spring.service.MailService;

@Controller
@RequestMapping("/mail")
public class MailController {

	@Autowired
	private MailService service;
	
	@Autowired
	private ExcelService exservice;
	
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private HttpSession hsession;

	@RequestMapping("sendmail") 
	private String sendmail(Model model) { 
		System.out.println("mail main이동");
		// session에 있는 학교 값 뽑아서 넣기
		MemberDTO dto = (MemberDTO)hsession.getAttribute("login");
		
		List<St_MailDTO> studentList = service.studentList(dto.getEmail());
		model.addAttribute("studentList", studentList);
		return "mail/sendmail"; 
	}

	@ResponseBody
	@RequestMapping(value = "sendMailProc", method = RequestMethod.GET, produces="text/html;charset=utf8")
	public String sendMailTest(String title, String content, String payment, HttpServletResponse response) throws Exception{
		System.out.println("메일보내기");
		System.out.println(title + " : " + payment + " : " + content);
		MemberDTO dto = (MemberDTO)hsession.getAttribute("login");
		String email = dto.getEmail();
		String school = dto.getSchool();
		System.out.println(email+school);                         
		
		//로컬호스트테스트용
//		String st_link=" http://localhost//sdt/researchHome?pm="+payment+"&email="+email+"&school="+school;
//		String enter = "<br>";
//		String finContent = enter+"\n\n<a href="+ st_link+">하이!급식 설문 및 급식비 결제페이지로 이동</a>"+enter+enter+XSSFillterConfig.XSSFilter(content);
		
		//서버용 세줄이 한묶음
		String st_link="http://59.6.83.84//sdt/researchHome?pm="+payment+"&email="+email+"&school="+school;
		String enter = "<br>";
		String finContent = enter+"\n\n<a href="+ st_link+">하이!급식 설문 및 급식비 결제페이지로 이동</a>"+enter+enter+XSSFillterConfig.XSSFilter(content);
		
//	원	String finContent = XSSFillterConfig.XSSFilter(content)
//				+ "\n http://59.6.83.84//sdt/researchHome?month="+month+"&payment="+payment;
		
		//String content = "메일 테스트 내용" + "<img src=\"이미지 경로\">";
		//String from = "zlxl_3041@naver.com";
		//String to = "project.hi.final@gmail.com";
		
		String from = dto.getEmail();
		List<String> to = service.mailList(dto.getEmail());
		
		System.out.println(finContent);
		System.out.println("로그인한 사람 이메일 " + from);
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
			// true는 멀티파트 메세지를 사용하겠다는 의미

			//mailHelper.setFrom(from);
			/* mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>"); */
			// 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
			// 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
			//mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
			//mailHelper.setTo(to);
			//mailHelper.setSubject(subject);
			//mailHelper.setText(content, true);
			// true는 html을 사용하겠다는 의미입니다.

			/*
			 * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
			 */
			
			InternetAddress[] toAddr = new InternetAddress[to.size()];
			for(int i=0; i<to.size(); i++) {
				toAddr[i] = new InternetAddress(to.get(i));
			}
			
			mailHelper.setFrom(new InternetAddress(from));
			
			mailHelper.setTo(toAddr);
			mailHelper.setSubject(XSSFillterConfig.XSSFilter(title));
			mailHelper.setText(finContent, true);
			
			//FileSystemResource file = new FileSystemResource(new File("경로\업로드할파일.형식")); 
			//helper.addAttachment("업로드파일.형식", file);
			//System.out.println("C:\\Users\\SeoSeunghee\\Downloads\\"+month+"월+"+dto.getSchool()+"+식단표.xlsx");
			//FileSystemResource file = new FileSystemResource(new File("Downloads\\"+month+"월+"+dto.getSchool()+"+식단표.xlsx")); 
			
			// 찐 FileSystemResource file = new FileSystemResource(new File("C:\\Users\\SeoSeunghee\\Downloads\\"+month+"월+"+dto.getSchool()+"+식단표.xlsx"));
			String realPath = hsession.getServletContext().getRealPath("excelDownMail");
			
			Calendar mon = Calendar.getInstance();
			mon.add(Calendar.MONTH , -1);
			String month = new java.text.SimpleDateFormat("MM").format(mon.getTime());
			exservice.excelDownloadMail(month, dto, realPath, response);
			
			String fileName = month+"월+"+dto.getSchool()+"+식단표.xlsx";
			FileSystemResource file = new FileSystemResource(new File(realPath+"\\"+fileName));
            mailHelper.addAttachment(new String(fileName.getBytes("UTF-8"), "8859_1"),file); // 메일 첨부파일 한국어로 바꾸기
            
			mailSender.send(mail);
			
			exservice.deleteExcel(realPath, XSSFillterConfig.XSSFilter(month)+"월+"+dto.getSchool()+"+식단표.xlsx"); // 보내고 저장된 파일 삭제
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "!"; 
	}

	@RequestMapping(value = "addStudentProc", method = RequestMethod.POST)
	public String addStudent(St_MailDTO dto) {
		System.out.println("학생등록");
		
		MemberDTO m = (MemberDTO)hsession.getAttribute("login");
		
		dto.setSchool(XSSFillterConfig.XSSFilter(m.getSchool()));
		dto.setNu_email(XSSFillterConfig.XSSFilter(m.getEmail()));
		
		service.addStudent(dto);
		
		return "mail/sendmail"; 
	}
	
	@RequestMapping(value="deleteStudentProc",method = RequestMethod.POST)
	public String deleteStudentProc(int seq) {
		System.out.println("학생 삭제");
		service.deleteStudentProc(seq);
		return "mail/sendmail"; 
	}
	
	@RequestMapping(value="updateStudentProc",method = RequestMethod.POST)
	public String updateStudentProc(int seq, String name, String email) {
		System.out.println("학생 수정");
		
		St_MailDTO dto = new St_MailDTO();
		dto.setSeq(seq);
		dto.setStu_name(XSSFillterConfig.XSSFilter(name));
		dto.setStu_email(XSSFillterConfig.XSSFilter(email));
		
		service.updateStudentProc(dto);
		
		return "mail/sendmail"; 
	}
	@ExceptionHandler
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
