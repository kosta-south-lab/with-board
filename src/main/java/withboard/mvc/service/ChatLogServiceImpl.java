package withboard.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.ChatLog;
import withboard.mvc.domain.JoinMatch;
import withboard.mvc.domain.Member;
import withboard.mvc.repository.ChatLogRepository;
import withboard.mvc.repository.JoinMatchRepository;

@Service
@Transactional
@RequiredArgsConstructor
public class ChatLogServiceImpl implements ChatLogService{
	private final ChatLogRepository chatLogRepository;

	@Override
	public void insert(ChatLog chatLog) {
		chatLogRepository.save(chatLog);
		
	}

	@Override
	public void delete(Long chatLogNo) {
		chatLogRepository.deleteById(chatLogNo);
		
	}

	@Override
	public List<ChatLog> chatLogList(Long joinMatchNo) {
		return chatLogRepository.chatLogList(joinMatchNo);
	}



}
