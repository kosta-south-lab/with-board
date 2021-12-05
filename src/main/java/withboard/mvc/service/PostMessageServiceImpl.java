package withboard.mvc.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Member;
import withboard.mvc.domain.PostMessage;
import withboard.mvc.repository.MemberRepository;
import withboard.mvc.repository.PostMessageRepository;

@Service
@RequiredArgsConstructor
public class PostMessageServiceImpl implements PostMessageService {
	
	private final PostMessageRepository postMessageRepository;
	private final MemberRepository memberRepository;
	
	@Override
	public void insert(PostMessage postMessage) {
		//수신인 아이디 검증 후 쪽지 저장
		String receiveId = postMessage.getReceiveId();
		if(memberRepository.userInfo(receiveId) != null) {
			postMessageRepository.save(postMessage);			
		}
	}

	@Override
	public List<PostMessage> selectAll(Member member) {
		return postMessageRepository.findByReceiveId(member.getId());
	}

	@Override
	public PostMessage read(Long postMessageNo) throws Exception{

		PostMessage pm = postMessageRepository.findById(postMessageNo).orElse(null);
		if(pm == null) {
			throw new SQLException("번호에 해당하는 쪽지가 없습니다.");
		}
		return pm;
	
	
	}


}
