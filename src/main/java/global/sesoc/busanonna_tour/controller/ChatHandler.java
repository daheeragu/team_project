package global.sesoc.busanonna_tour.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.AbstractWebSocketHandler;

//클라이언트와 WebSocket을 이용한 메시지 송수신
public class ChatHandler extends AbstractWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(ChatHandler.class);

	//채팅에 참여한 클라이언트들과의 연결
	ArrayList<WebSocketSession> list = new ArrayList<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("세션 오픈 : {}, ID: {}", session.getLocalAddress(), session.getId());
		list.add(session);		//연결된 세션들을 보관
		logger.info(list.toString());
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("세션 클로즈 : {}, ID: {}", session.getLocalAddress(), session.getId());
		list.remove(session);
		logger.info(list.toString());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("서버측 수신 : {}, ID: {}", message.getPayload(), session.getId());
		
		Map<String, Object> map = session.getAttributes();
		String loginName = (String)map.get("loginName");
		String loginId = (String)map.get("loginId");
		if (loginName == null && loginId == null) {
			loginName = "익명";
			loginId = session.getId();
		}
		if (loginId == null) {
			loginId = "관리자";
		}
		TextMessage msg = new TextMessage(loginName + "(" + loginId + ")" + " : " + message.getPayload());
		
		for(WebSocketSession ss: list) {
			if (message.getPayloadLength() > 1) {
				ss.sendMessage(msg);
			}
		}
	}
}
