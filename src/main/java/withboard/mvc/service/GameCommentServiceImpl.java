package withboard.mvc.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.GameComment;
import withboard.mvc.repository.GameCommentRepository;

@Service
@RequiredArgsConstructor
@Transactional
public class GameCommentServiceImpl implements GameCommentService {

	private final GameCommentRepository gameCommentRepository;

	@Override
	public void insert(GameComment gameComment) {
		gameCommentRepository.save(gameComment);
		
	}

	@Override
	public void delete(Long commentNo) {
		gameCommentRepository.deleteById(commentNo);
		
	}


}
