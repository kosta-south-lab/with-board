package withboard.mvc.service;

import java.util.List;


import withboard.mvc.domain.Normal;

public interface NormalBoardService {

	 /**
	    * 전체검색
	    * */
	public List<Normal> selectAll(Long normalCategoryNo, String searchOption, String keyword);
	
	/**
	 * 등록
	 * */
	void insert(Normal normal, Long normalCategoryNo);
	
	/**
	 * 글번호 검색 
	 *   : 조회수 증가....
	 *      - state가 true이면 조회수 증가한다.
	 * */
	Normal selectBy(Long boardNo , boolean state);
	
	/**
	 * 수정하기
	 * */
	
	Normal update(Normal normal, Long normalCategoryNo);
	
    /**
     * 삭제하기
     * */
    void delete(Long boardNo);


	
}
