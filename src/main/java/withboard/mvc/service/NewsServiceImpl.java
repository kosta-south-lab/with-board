package withboard.mvc.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.News;
import withboard.mvc.repository.NewsRepository;

@Service
@RequiredArgsConstructor
public class NewsServiceImpl implements NewsService {
	
	private final NewsRepository newsRepository;
	
	@Override
	public List<News> selectAll() {
		return newsRepository.findAll();
	}

}
