package withboard.mvc.service;

import java.util.List;

import withboard.mvc.domain.Board;

public interface BoardService {
	
	/**
	 * 게시판 전체 검색
	 * */
	public List<Board> selectAll();
}
