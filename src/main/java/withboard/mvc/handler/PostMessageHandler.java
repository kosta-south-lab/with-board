package withboard.mvc.handler;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import withboard.mvc.domain.Member;
import withboard.mvc.domain.PostMessage;

@Slf4j
@Component
@RequiredArgsConstructor
public class PostMessageHandler extends TextWebSocketHandler {
	
	private Map<String, WebSocketSession> sessionMap = new HashMap<String, WebSocketSession>();
	private final ObjectMapper objectMapper;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
        Map<String, Object> map = session.getAttributes(); //handshake 설정으로 websocketsession에서 httpsession을 가로채서 사용하고있다.    
        Member member = (Member) map.get("member");
		sessionMap.put(member.getId(), session);
        
		log.info("접속 : {}, {}", member.getId(), session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("메시지 전송  = {} : {}", session, message.getPayload());
		
		PostMessage postMessage = objectMapper.readValue(message.getPayload(),PostMessage.class);

		//이 부분에 DB에 쪽지 넣는 코드 작성하면 된다.
		
		//수신인 한테만 메시지 보내기
		String receiveId = postMessage.getReceiveId();
		WebSocketSession receiveSession =  sessionMap.get(receiveId);
		if(receiveSession != null) {
			TextMessage msg = new TextMessage("새로운 쪽지가 도착했습니다.");
			receiveSession.sendMessage(msg);
		}
	}
	
	@Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, Object> map = session.getAttributes(); //handshake 설정으로 websocketsession에서 httpsession을 가로채서 사용하고있다.
		Member member = (Member) map.get("member");
		sessionMap.remove(member.getId());
        log.info("퇴장 : {}",  session);
    }
}
