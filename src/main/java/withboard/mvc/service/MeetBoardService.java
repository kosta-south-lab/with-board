package withboard.mvc.service;

import java.util.List;

import withboard.mvc.domain.Meet;

public interface MeetBoardService {
	
	/**
	 * 전체검색
	 * */
	public List<Meet> selectAll();
	
	/**
	 * 모임 등록
	 * */
	public void insert(Meet meet);
}
