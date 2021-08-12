package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.Chat_MessageDTO;
import kh.spring.dto.Chat_RoomDTO;
import kh.spring.dto.MemberDTO;

@Repository
public class ChatDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<MemberDTO> search(Map<String,String> param){
		return mybatis.selectList("Chat.search", param);
	}
	
	public int searchRoom1(Map<String,String> param) {
		return mybatis.selectOne("Chat.searchRoom1", param);
	}
	
	public int searchRoom2(Map<String,String> param) {
		return mybatis.selectOne("Chat.searchRoom2", param);
	}
	
	// 채팅을 요청한 사람과의 채팅방이 존재하지 않을 때 만들어 주는 메서드
	public int createRoom(Map<String,String> param) {
		return mybatis.insert("Chat.createRoom", param);
	}
	
	// 채팅방이 없던 사람과의 채팅방을 만들고 채팅방 번호를 받아오는 메서드
	public int searchRoomNumber(Map<String,String> param) {
		return mybatis.selectOne("Chat.searchRoomNumber",param);
	}
	
	// 채팅방이 만약 존재한다면 채팅방 번호 받아오는 메서드2
	public int searchRoomNumber2(Map<String,String> param) {
		return mybatis.selectOne("Chat.searchRoomNumber2", param);
	}
	
	// 채팅 상대방 정보 담기
	public MemberDTO receiver(String email) {
		return mybatis.selectOne("Chat.receiver",email);
	}
	
	// 채팅 메세지 DB에 저장
	public int messageInsert(Chat_MessageDTO dto) {
		return mybatis.insert("Chat.messageInsert", dto);
	}
	
	public List<Chat_MessageDTO> messageList(int room_number){
		return mybatis.selectList("Chat.messageList", room_number);
	}
	
	// 나의 채팅방 리스트
	public List<Chat_RoomDTO> chatListInfo(String login_email){
		return mybatis.selectList("Chat.chatListInfo",login_email);
	}
	
	public Chat_RoomDTO findReceiver(int room_number) {
		return mybatis.selectOne("Chat.findReceiver", room_number);
	}
	
	
}
