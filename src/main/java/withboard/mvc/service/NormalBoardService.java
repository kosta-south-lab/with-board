package withboard.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import withboard.mvc.domain.Member;
import withboard.mvc.domain.Normal;

public interface NormalBoardService {

	 /**
	    * 전체검색
	    * */
	public Page<Normal> selectAll(Long normalCategoryNo, String searchOption, String keyword, Pageable pageable);
	
	/**
	 * 게시물 등록
	 * */
	void insert(Normal normal, Long normalCategoryNo, List<String> filenameList, Member member);
	
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
