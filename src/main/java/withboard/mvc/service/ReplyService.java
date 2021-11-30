package withboard.mvc.service;

import withboard.mvc.domain.Reply;

public interface ReplyService {
	public void insert(Reply reply, Long boardNo);
	public void delete(Long replyNo);
	
}
