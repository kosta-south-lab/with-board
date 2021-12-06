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
	public GameComment selectBy(Long gameNo, Long memberNo) {

		GameComment dbGameComment = gameCommentRepository.selectComment(gameNo, memberNo);

		return dbGameComment;
	}

	@Override
	public void insertComment(GameComment gameComment) {

		GameComment dbGameComment = selectBy(gameComment.getGame().getGameNo(), gameComment.getMember().getMemberNo());

		if (dbGameComment == null) {
			gameCommentRepository.save(gameComment);
		} else {
			throw new RuntimeException("이미 한줄평을 등록 한 게임입니다!");
		}
	}

	@Override
	public void deleteComment(GameComment gameComment) {

		GameComment dbGameComment = selectBy(gameComment.getGame().getGameNo(), gameComment.getMember().getMemberNo());

		if (dbGameComment != null) {
			gameCommentRepository.delete(gameComment);
		} else {
			throw new RuntimeException("해당 게임에 작성한 한줄평이 없습니다!");
		}
	}

}
