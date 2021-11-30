package withboard.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Member;
import withboard.mvc.domain.News;
import withboard.mvc.repository.BoardRepository;
import withboard.mvc.repository.MemberRepository;
import withboard.mvc.repository.NewsRepository;

@Service
@RequiredArgsConstructor
@Transactional
public class NewsServiceImpl implements NewsService {
	
	private final NewsRepository newsRepository;
	private final BoardRepository boardRepository;
	private final MemberRepository memberRepository;
	
	@Override
	public List<News> selectAll(String searchOption, String keyWord) {
		List<News> NewsList = null;
		
		switch(searchOption) {
		case "title":
			NewsList = newsRepository.findByTitleContaining(keyWord);
			break;
		case "writer":
			Member writer = memberRepository.findByNicknameContaining(keyWord);
			NewsList = newsRepository.findByMember(writer);
			break;
		}
		return NewsList;
	}

	@Override
	public void insert(News news) {
		
		//관리자 만들기???? (추후에는 시큐리티 세션에서 얻어올 예정)

		newsRepository.save(news);
		
		
	}

	@Override
	public News selectBy(Long boardNo, boolean state) {
		if(state) {
			//조회수 증가
			if( boardRepository.viewCountUpdate(boardNo) == 0 ) {
				throw new RuntimeException("게시물이 존재하지 않습니다.");
			}
		}
		
		//검색
		News news = newsRepository.findById(boardNo).orElse(null);
		if(news == null) {
			throw new RuntimeException("게시물이 존재하지 않습니다.");
		}
		
		return news;
	}

	@Override
	public News update(News news) {
		News n = newsRepository.findById(news.getBoardNo()).orElse(null);
		if(n==null) throw new RuntimeException("글번호 오류로 수정될수 없습니다.");
			
		//정보수정 - 내용/제목
		n.setContent( news.getContent().replace("<", "&lt;") );
		n.setTitle( news.getTitle() );
		n.setContent(news.getContent());
		
		return n;
	}

	@Override
	public void delete(Long boardNo) {
		News news  = newsRepository.findById(boardNo).orElse(null);
		
	    if(news == null)
	    	throw new RuntimeException("글번호 오류로 삭제 할수 없습니다.");
	    
	    newsRepository.delete(news);

	}

}
