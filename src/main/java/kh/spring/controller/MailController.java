package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mail")
public class MailController {
	
//	@Autowired
//	private MailService service;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("sendmail")
	private String sendmail() {
		return "mail/sendmail";
	}

}
