package withboard.mvc.service;

import java.util.List;

import withboard.mvc.domain.Meet;

public interface MeetBoardService {
	
	/**
	 * 전체검색
	 * */
	public List<Meet> selectAll(Long meetCategoryNo, String searchOption, String keyword);
	
	/**
	 * 모임 등록
	 * */
	public void insert(Meet meet, Long meetCategoryNo, List<String> filenameList);
	
	/**
	 * 모임 상세
	 * */
	public Meet selectByBoardNo(Long boardNo, boolean state);
	
	/**
	 * 모임 수정
	 * */
	public void update(Meet meet, Long meetCategoryNo);
}
