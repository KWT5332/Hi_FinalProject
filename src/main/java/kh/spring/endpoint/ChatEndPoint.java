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
import javax.websocket.server.ServerEndpoint;

import com.google.gson.JsonObject;

import kh.spring.configurator.ApplicationContextProvider;
import kh.spring.configurator.HttpSessionConfigurator;
import kh.spring.dto.MemberDTO;
import kh.spring.service.ChatService;

@ServerEndpoint(value="/toChat/user2/{user2}", configurator = HttpSessionConfigurator.class)
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
	
	@OnMessage
	public void onMessage(Session self,String message) {
		System.out.println(message);
		String id = (String)hsession.getAttribute("loginID");

		//dao.insert(new ChatDTO(0,id,message,null));
		synchronized(clients) {
			for(Session client : clients) {
				if(client != self) {
					
					JsonObject json = new JsonObject();
					MemberDTO receiver = (MemberDTO)hsession.getAttribute("login");
					String name = receiver.getName();
					json.addProperty("name", name);
					json.addProperty("message", message);
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
		System.out.println("client disconnected");
	}
}
