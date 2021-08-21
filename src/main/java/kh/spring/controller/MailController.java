package kh.spring.controller;

import java.io.File;
import java.util.List;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.St_MailDTO;
import kh.spring.service.MailService;

@Controller
@RequestMapping("/mail")
public class MailController {

	@Autowired
	private MailService service;
	
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private HttpSession hsession;


	@RequestMapping("sendmail") 
	private String sendmail(Model model) { 
		System.out.println("mail");
		// session에 있는 학교 값 뽑아서 넣기
		String school = "무학중";
		List<St_MailDTO> studentList = service.studentList(school);
		model.addAttribute("studentList", studentList);
		return "mail/sendmail"; 
	}


	@RequestMapping(value = "sendMailProc", method = RequestMethod.GET)
	public String sendMailTest() throws Exception{
		System.out.println("메일보내기");
		String subject = "test 메일";
		String content = "메일 테스트 내용";
		//String content = "메일 테스트 내용" + "<img src=\"이미지 경로\">";
		//String from = "zlxl_3041@naver.com";
		//String to = "project.hi.final@gmail.com";
		
		// 주희
		String from = "project.hi.final@gmail.com";
		String school = "무학중";
		List<String> to = service.mailList(school);

		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
			// true는 멀티파트 메세지를 사용하겠다는 의미

			/*
			 * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
			 * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
			 */

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
			
			// 주희 
			
			InternetAddress[] toAddr = new InternetAddress[to.size()];
			for(int i=0; i<to.size(); i++) {
				toAddr[i] = new InternetAddress(to.get(i));
			}
			
			mailHelper.setFrom(from);
			mailHelper.setTo(toAddr);
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true);
			
			
			//FileSystemResource file = new FileSystemResource(new File("경로\업로드할파일.형식")); 
			//helper.addAttachment("업로드파일.형식", file);
			FileSystemResource file = new FileSystemResource(new File("C:\\test.txt")); 
            mailHelper.addAttachment("test.txt", file);
			
			mailSender.send(mail);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "mail/sendmail"; 
	}
	
	@RequestMapping(value = "addStudentProc", method = RequestMethod.POST)
	@ResponseBody
	public String addStudent(St_MailDTO dto) {
		System.out.println("학생등록");
		service.addStudent(dto);
		return "mail/sendmail"; 
	}


}
