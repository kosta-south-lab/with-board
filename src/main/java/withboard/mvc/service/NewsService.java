package withboard.mvc.service;

import java.util.List;

import withboard.mvc.domain.News;
import withboard.mvc.domain.Normal;

public interface NewsService {
	
public List<News> selectAll(String searchOption, String keyword);
	
	/**
	 * 등록
	 * */
	void insert(News news);
	
	/**
	 * 글번호 검색 
	 * */
	News selectBy(Long boardNo , boolean state);
	
	/**
	 * 수정하기
	 * */
	
	News update(News news);
	
    /**
     * 삭제하기
     * */
    void delete(Long boardNo);

	
}
