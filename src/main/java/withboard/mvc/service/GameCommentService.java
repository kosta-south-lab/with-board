package withboard.mvc.service;

import withboard.mvc.domain.GameComment;

public interface GameCommentService {
	

	  /**
	   * 등록하기
	   * */
		void insert(GameComment gameComment);
		
		/**
		 * 삭제
		 * */
		void delete(Long commentNo);
	
}
