package withboard.mvc.service;

import java.util.List;

import withboard.mvc.domain.MatchBoard;
import withboard.mvc.domain.Member;

public interface MatchBoardService {
	
	/*
	 * 게시글 가져오기
	*/
	public List<MatchBoard> selectAll();
	
	/*
	 * 매칭 게시글 등록
	 * */
	public void insert(MatchBoard matchBoard, Member member);
	
	/**
	 * 매칭 게시글 수정
	 */
	public MatchBoard update(MatchBoard matchBoard);
	
	/**
	 * 매칭 게시글 삭제
	 */
	public void delete(Long boardNo);
	
	public MatchBoard selectBy(Long boardNo , boolean state);

}
