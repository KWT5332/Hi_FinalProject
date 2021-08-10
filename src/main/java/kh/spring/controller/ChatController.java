package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.MemberDTO;
import kh.spring.service.ChatService;

@Controller
@RequestMapping("/chat")
public class ChatController {
	@Autowired
	private ChatService service;

	@Autowired
	private HttpSession session;

	@RequestMapping("findFriend")
	public String findFriend() {
		return "chat/findFriend";
	}

	@RequestMapping("myChatList")
	public String myChat() {
		System.out.println("나의 채팅방");
		return "chat/myChatList";
	}

	@RequestMapping("search")
	public String search(String category, String keyword,Model model){
		System.out.println(category + " : " +keyword);
		List<MemberDTO> list = service.search(category,keyword);
		model.addAttribute("list",list);
		model.addAttribute("keyword",keyword);
		return "chat/findFriend";
	}

	@RequestMapping("toChat")
	public String toChat(String user2, Model model) {
		// Session에 담긴 로그인한 사람 정보 가져와서 이메일 정보만 user1에 담기
		System.out.println(user2);
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		String user1 = mdto.getEmail();
		
		//model.addAttribute("user2",user2);

		// 채팅하려는 사람 정보 담기
		MemberDTO receiver = service.receiver(user2);
		session.setAttribute("receiver", receiver);
		System.out.println(receiver);
		
		int room_number = 0;

		System.out.println(" 로그인한 사람 이메일 : " + user1);
		System.out.println(" 채팅하고자 하는 사람 : " + user2);

		int result1 = service.searchRoom1(user1, user2);
		int result2 = service.searchRoom2(user1, user2);

		int result = (result1 + result2);
		System.out.println("0보다 크면 방이 있는 것 :" + result);

		if(result == 0) {
			int createRoom_result = service.createRoom(user1,user2);
			if(createRoom_result>0) {
				room_number = service.searchRoomNumber(user1, user2);
				System.out.println("만들어진 방 번호 " + room_number);
			}
		}else {
			System.out.println("이미 방이 존재해서 else문으로 빠진다.");
			if(result1 > 0 && result2 == 0) {
				System.out.println("user1");
				room_number = service.searchRoomNumber(user1, user2);
				System.out.println("user1 방번호" + room_number );
			}else if(result2 > 0 && result1 ==0) {
				System.out.println("user2");
				room_number = service.searchRoomNumber2(user1, user2);
				System.out.println("user2 방번호" + room_number );
			}
		}
		
		return "redirect:/chat/toChatRoom?room_number="+room_number;
	}
	
	// 채팅방 url에 채팅방 번호 붙여서 보내려고 만든 컨트롤러 
	@RequestMapping("toChatRoom")
	public String toChatRomm(String room_number,Model model) {
		System.out.println(room_number);
		model.addAttribute("room_number",room_number);
		return "chat/toChat";
	}
}
