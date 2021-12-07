package withboard.mvc.service;

import withboard.mvc.domain.Member;
import withboard.mvc.domain.Reply;

public interface ReplyService {
	public void insert(Reply reply, Long boardNo, Member member);
	public void delete(Long replyNo);
	
}
