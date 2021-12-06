package withboard.mvc.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Board;
import withboard.mvc.domain.Member;
import withboard.mvc.domain.Reply;
import withboard.mvc.repository.BoardRepository;
import withboard.mvc.repository.ReplyRepository;

@Service
@Transactional
@RequiredArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	private final ReplyRepository replyRepository;
	private final BoardRepository boardRepository;
	
	@Override
	public void insert(Reply reply, Long boardNo, Member member) {
		Board board =  boardRepository.findById(boardNo).orElse(null);
		if(board == null) {
			throw new RuntimeException("번호에 해당하는 게시물이 존재하지 않습니다.");
		}
		
		//member는 추후 로그인한 유저로 교체해야함.
		reply.setBoard(board);
		reply.setMember(member);
		replyRepository.save(reply);
	}

	@Override
	public void delete(Long replyNo) {
		replyRepository.deleteById(replyNo);
	}
	
	

}
