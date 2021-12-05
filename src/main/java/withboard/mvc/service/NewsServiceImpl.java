package withboard.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Image;
import withboard.mvc.domain.Member;
import withboard.mvc.domain.News;
import withboard.mvc.repository.BoardRepository;
import withboard.mvc.repository.ImageRepository;
import withboard.mvc.repository.MemberRepository;
import withboard.mvc.repository.NewsRepository;

@Service
@RequiredArgsConstructor
@Transactional
public class NewsServiceImpl implements NewsService {
	
	private final NewsRepository newsRepository;
	private final BoardRepository boardRepository;
	private final MemberRepository memberRepository;
	private final ImageRepository imageRepository;
	
	@Override
	public Page<News> selectAll(String searchOption, String keyWord, Pageable pageable) {
		Page<News> NewsList = null;
		
		switch(searchOption) {
		case "title":
			NewsList = newsRepository.findByTitleContaining(keyWord,pageable);
			break;
		case "writer":
			Member writer = memberRepository.findByNicknameContaining(keyWord);
			NewsList = newsRepository.findByMember(writer,pageable);
			break;
		}
		return NewsList;
	}

	@Override
	public void insert(News news, List<String> filenameList) {
		
		//관리자 만들기???? (추후에는 시큐리티 세션에서 얻어올 예정)

		newsRepository.save(news);
		
		//이미지테이블에 이미지 이름 저장
		for(String fname : filenameList) {
			imageRepository.save(new Image(null, fname, news, null));
		}
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
	public void update(News news, List<String> filenameList) {
		News n = newsRepository.findById(news.getBoardNo()).orElse(null);
		if(n==null) throw new RuntimeException("글번호 오류로 수정될수 없습니다.");
			
		//정보수정 - 내용/제목
		n.setContent( news.getContent().replace("<", "&lt;") );
		n.setTitle( news.getTitle() );
		n.setContent(news.getContent());
		
		//이미지테이블에서 이미지이름 삭제
		for(Image image : n.getImageList()) {
			imageRepository.delete(image);
		}
		//이미지테이블에 새로운 이미지 이름 저장
		for(String fname : filenameList) {
			imageRepository.save(new Image(null, fname, n, null));
		}
	}

	@Override
	public void delete(Long boardNo) {
		News news  = newsRepository.findById(boardNo).orElse(null);
		
	    if(news == null)
	    	throw new RuntimeException("글번호 오류로 삭제 할수 없습니다.");
	    
	    newsRepository.delete(news);

	}

}
