package withboard.mvc.service;

import java.util.List;


import withboard.mvc.domain.Normal;

public interface NormalBoardService {

	 /**
	    * 전체검색
	    * */
	public List<Normal> selectAll();
	
	/**
	 * 등록
	 * */
	void insert(Normal normal);
	
	/**
	 * 글번호 검색 
	 *   : 조회수 증가....
	 *      - state가 true이면 조회수 증가한다.
	 * */
	Normal selectBy(Long boardNo , boolean state);
	
	/**
	 * 수정하기
	 * */
	
	Normal update(Normal normal);
	
    /**
     * 삭제하기
     * */
    void delete(Long boardNo,String password);
	
}
