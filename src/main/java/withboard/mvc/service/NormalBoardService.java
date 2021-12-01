package withboard.mvc.service;

import java.util.List;


import withboard.mvc.domain.Normal;

public interface NormalBoardService {

	 /**
	    * 전체검색
	    * */
	public List<Normal> selectAll(Long normalCategoryNo, String searchOption, String keyword);
	
	/**
	 * 게시물 등록
	 * */
	void insert(Normal normal, Long normalCategoryNo, List<String> filenameList);
	
	/**
	 * 게시물 상세
	 * */
	Normal selectBy(Long boardNo , boolean state);
	
	/**
	 * 게시물 수정
	 * */
	
	void update(Normal normal, Long normalCategoryNo, List<String> filenameList);
	
    /**
     * 게시물 삭제
     * */
    void delete(Long boardNo);


	
}
