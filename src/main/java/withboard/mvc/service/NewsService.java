package withboard.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import withboard.mvc.domain.News;
import withboard.mvc.domain.Normal;

public interface NewsService {
	
	/**
	 * 전체검색
	 * */
	public Page<News> selectAll(String searchOption, String keyword, Pageable pageable);
	
	/**
	 * 공지 등록
	 * */
	void insert(News news, List<String> filenameList);
	
	/**
	 * 공지 상세 
	 * */
	News selectBy(Long boardNo , boolean state);
	
	/**
	 * 공지 수정
	 * */
	
	void update(News news, List<String> filenameList);
	
    /**
     * 공지 삭제
     * */
    void delete(Long boardNo);

	
}
