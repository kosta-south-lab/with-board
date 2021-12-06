package withboard.mvc.service;

import withboard.mvc.domain.GameComment;

public interface GameCommentService {
	
	public GameComment selectBy(Long gameNo, Long memberNo);

	public void insertComment(GameComment gameComment);
		
	public void deleteComment(GameComment gameComment);
}
