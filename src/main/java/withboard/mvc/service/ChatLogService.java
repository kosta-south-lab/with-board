package withboard.mvc.service;

import java.util.List;

import withboard.mvc.domain.ChatLog;
import withboard.mvc.domain.JoinMatch;
import withboard.mvc.domain.Member;

public interface ChatLogService {
	
public void insert(ChatLog chatLog);
	
	public void delete(Long chatLogNo);

	//public List<ChatLog> chatLogList(JoinMatch joinMatch);

	List<ChatLog> chatLogList(Long joinMatchNo);

}
