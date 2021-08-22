package kh.spring.endpoint;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.JsonObject;

import kh.spring.configurator.ApplicationContextProvider;
import kh.spring.configurator.HttpSessionConfigurator;
import kh.spring.dto.Chat_MessageDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.ChatService;

// value="/toChat/user2/{user2}"
@ServerEndpoint(value="/toChat/room_number/{room_number}", configurator = HttpSessionConfigurator.class)
public class ChatEndPoint {
	
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<>());
	
	private HttpSession hsession;
	
	private ChatService service = ApplicationContextProvider.getApplicationContext().getBean(ChatService.class);
	
	@OnOpen
	public void onConnect(Session session, EndpointConfig config) {
		
		this.hsession = (HttpSession)config.getUserProperties().get("hsession");
		System.out.println("웹 소켓 연결 됨");
		clients.add(session);
	}
	
	// onMessage 에서 파라미터를 하나 더 받고 싶지만 되지 않아 @PathParam을 사용하여 @ServerEndpoint에 있는 {room_number} 값을 가져옴 
	// 참고 예제 사이트 : https://3167.tistory.com/2
	
	@OnMessage
	public void onMessage(Session self, String message, @PathParam("room_number") int room_number) {
		
		MemberDTO senderInfo = (MemberDTO)hsession.getAttribute("login");
		String sender_name = senderInfo.getName();
		String sender = senderInfo.getEmail();
		String sender_sysname =senderInfo.getSysName();
		
		MemberDTO receiverInfo = (MemberDTO)hsession.getAttribute("receiver");
		String receiver = receiverInfo.getEmail();
		
		service.messageInsert(new Chat_MessageDTO(0,sender,receiver,message,null,room_number));
		synchronized(clients) {
			for(Session client : clients) {
				if(client != self) {
					
					JsonObject json = new JsonObject();
					json.addProperty("name", sender_name);
					json.addProperty("message", message);
					json.addProperty("sysName",sender_sysname);
					try {
						client.getBasicRemote().sendText(json.toString());
					} catch (IOException e) {
						e.printStackTrace();
					};
				}
			}
		}
	}

	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
		//hsession.removeAttribute("receiver");
		System.out.println("client disconnected");
	}
}
