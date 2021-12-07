package withboard.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import withboard.mvc.domain.Game;
import withboard.mvc.domain.Meet;
import withboard.mvc.domain.Member;

public interface MeetBoardService {
	
	/**
	 * 전체검색
	 * */
//	public List<Meet> selectAll(Long meetCategoryNo, String searchOption, String keyword);
	
	/**
	 * 전제검색(페이징)
	 * */
	public Page<Meet> selectAllPaging(Long meetCategoryNo, String searchOption, String keyword, Pageable pageable);
	
	/**
	 * 모임 등록
	 * */
	public void insert(Meet meet, Long meetCategoryNo, Long gameNo, List<String> filenameList, Member member);
	
	/**
	 * 모임 상세
	 * */
	public Meet selectByBoardNo(Long boardNo, boolean state);
	
	/**
	 * 모임 수정
	 * */
	public void update(Meet meet, Long meetCategoryNo, Long gameNo, List<String> filenameList);
	
	/**
	 * 모임 삭제
	 * */
	public void delete(Long BoardNo);
	
	/**
	 * 게임 전체검색 - GameService 쪽으로 옮겨야할듯
	 * */
	public List<Game> selectAllGame();
}
