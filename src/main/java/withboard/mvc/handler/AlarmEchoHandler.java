package withboard.mvc.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import antlr.StringUtils;
import withboard.mvc.domain.Member;

public class AlarmEchoHandler extends TextWebSocketHandler {
	
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
	
	//커넥션이 연결 됐을 때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("afterConnectionEstablished : " + session);
		
		//접속 되는 유저들은 다 여기로
		sessions.add(session);
		
		String senderId = getId(session);
		userSessions.put(senderId, session);
	}
	
	//어떠한 메세지를 보냈을 때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		System.out.println("handleTextMessage : " + session + " : " + message);
		
		//브로드캐스팅 (접속 되어 있는 모든 유저에게 발송)
		
//		for(WebSocketSession sess : sessions) {
//			
//			//id : session에 있는 ID (sender)
//			String senderId = getId(session);
//						
//			sess.sendMessage(new TextMessage("김찬원님" + " : " + message.getPayload()));
//		}
		
		
		//protocol : cmd,댓글 작성자, 게시글 작성자, bno (ex : reply, user2, user1, 234) (나 같은 경우에는 게시글 작성자, 게시글에 위치되어 있는 지역과 동일한 지역을 가지고 있는 유저들)
		//JSON으로 하면 좋다
		
		String msg = message.getPayload();

		if(msg != null) {
			
			String [] strs = msg.split(",");
			
			if(strs != null && strs.length == 4) {
				
				String cmd = strs[0];
				String replyWriter = strs[1];
				String boardWriter = strs[2];
				String bno = strs[3];
				
				System.out.println(cmd + "," + replyWriter + ", " + boardWriter + ", " + bno);
				
				for(String id : userSessions.keySet()) {
					System.out.println(id + " | " + userSessions.get(id));
				}
				
				WebSocketSession boardWriterSession = userSessions.get(boardWriter);
					//우리 경우에는 같은 지역 사람
					if("insertGame".equals(cmd) && boardWriterSession != null) {
						System.out.println(123);
						TextMessage tmpMsg = new TextMessage(replyWriter + "님이" + bno + "번 게시글에 댓글을 달았습니다.");
						boardWriterSession.sendMessage(tmpMsg);
					}
			}
			
			
		}	
	}

	private String getId(WebSocketSession session) {
		
		Map<String, Object> httpSession = session.getAttributes();
		
		//현재 로그인 한 유저
		Member loginUser = (Member)httpSession.get("member");
		System.out.println(loginUser);
		if(loginUser == null) {
			return session.getId();
		}else {
			return loginUser.getId();
		}
	}

	//커넥션이 닫혔을 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("afterConnectionClosed : " + session + " : " + status);
	}
}
