package kr.co.commons.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.co.vo.MemberVO;

/**
 * 
 * @Title : 웹소켓 핸들러
 * @author : yangjaewoo
 * @date : 2019. 11. 19.
 */


public class EchoHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	//로그인 한 인원 전체
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1:1로 할 경우
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {//클라이언트와 서버가 연결
		// TODO Auto-generated method stub
		logger.info("Socket 연결");
		sessions.add(session);
		logger.info(currentUserName(session));//현재 접속한 사람
		String senderId = currentUserName(session);
		userSessionsMap.put(senderId,session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {// 메시지
		// TODO Auto-generated method stub
		logger.info("ssesion"+currentUserName(session));
		String msg = message.getPayload();//자바스크립트에서 넘어온 Msg
		logger.info("msg="+msg);
		
		if (StringUtils.isNotEmpty(msg)) {
			logger.info("if문 들어옴?");
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 3) {
				
				String cmd = strs[0];
				String customer = strs[1];
				String messages = strs[2];
				String master = "1234";
				
				logger.info("length 성공?"+cmd);
				
				WebSocketSession customerId = userSessionsMap.get(customer);
				WebSocketSession masterId = userSessionsMap.get(master);
				logger.info("boardWriterSession="+customerId);
				logger.info("boardWirterSession"+masterId);
				
				//구매자채팅
				if ("customer".equals(cmd)) {
					logger.info("onmessage되나?");
					TextMessage tmpMsg = new TextMessage("<div class='col-sm-12'>"+customer+"님 : "
							+ messages+"</div>");
					masterId.sendMessage(tmpMsg);
					customerId.sendMessage(tmpMsg);
				}else if("master".equals(cmd)) {
					logger.info("onmessage되나?");
					TextMessage tmpMsg = new TextMessage( "<div class='col-sm-12'>관리자 : "
							+ messages+"</div>");
			        for(WebSocketSession sess : sessions){
			            sess.sendMessage(tmpMsg);
			        }
				}
				
				
				
					
				
			}
			
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {//연결 해제
		// TODO Auto-generated method stub
		logger.info("Socket 끊음");
		sessions.remove(session);
		userSessionsMap.remove(currentUserName(session),session);
	}

	
	private String currentUserName(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberVO loginUser = (MemberVO)httpSession.get("member");
		
		if(loginUser == null) {
			String mid = session.getId();
			return mid;
		}
		String mid = loginUser.getMEM_ID();
		return mid;
		
	}
}