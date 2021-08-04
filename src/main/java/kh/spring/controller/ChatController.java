package kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat")
public class ChatController {
	@RequestMapping("findFriend")
	public String findFriend() {
		return "chat/findFriend";
	}
	
	@RequestMapping("myChat")
	public String myChat() {
		System.out.println("나의 채팅방");
		return "chat/myChat";
	}
}
