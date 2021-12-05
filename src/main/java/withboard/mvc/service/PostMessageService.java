package withboard.mvc.service;

import java.util.List;

import withboard.mvc.domain.Member;
import withboard.mvc.domain.PostMessage;

public interface PostMessageService {
	/**
	 * 쪽지저장
	 * */
	void insert(PostMessage postMessage);

	/**
	 * 쪽지목록
	 * */
	List<PostMessage> selectAll(Member member);
	
	/**
	 * 쪽지상세
	 * */
	PostMessage read(Long postMessageNo) throws Exception;
	
	
}
