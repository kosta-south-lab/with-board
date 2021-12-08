package withboard.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.MatchBoard;
import withboard.mvc.repository.BoardRepository;
import withboard.mvc.repository.MatchBoardRepository;
import withboard.mvc.domain.Member;

@Service
@Transactional
@RequiredArgsConstructor
public class MatchBoardServiceImpl implements MatchBoardService {

private final BoardRepository boardRepository;
private final MatchBoardRepository matchBoardRepository;
	
	public List<MatchBoard> selectAll() {
		return matchBoardRepository.findAll();
	}
	
	public void insert(MatchBoard matchBoard,Member member) {
		matchBoard.setMember(member);
		
		matchBoardRepository.save(matchBoard);
		
		
	}
	public MatchBoard update(MatchBoard matchBoard) {
		MatchBoard mb = matchBoardRepository.findById(matchBoard.getBoardNo()).orElse(null);
		if(mb==null) throw new RuntimeException("글번호 오류로 수정될수 없습니다.");
		
		mb.setTitle(matchBoard.getTitle());
		mb.setContent(matchBoard.getContent());
		mb.setHeadCount(matchBoard.getHeadCount());
		mb.setLocation(matchBoard.getLocation());
		mb.setLocation2(matchBoard.getLocation2());
		mb.setEtc(matchBoard.getEtc());
		mb.setGameCategory(matchBoard.getGameCategory());
		mb.setGame(matchBoard.getGame());
		mb.setRoomNum(matchBoard.getRoomNum());
		
		return mb;
		
	}
	
	public void delete(Long boardNo) {
		MatchBoard mb = matchBoardRepository.findById(boardNo).orElse(null);
		if(mb==null) throw new RuntimeException("글번호 오류로 수정될수 없습니다.");
		
	
		matchBoardRepository.delete(mb);
		
	}

	public MatchBoard selectBy(Long boardNo, boolean state) {
		if(state) {
			if( boardRepository.viewCountUpdate(boardNo) == 0 ) {
				throw new RuntimeException(boardNo+"번호 오류로 조회수 증가 실패하여 검색할 수 없습니다.");
			}
		}
		MatchBoard matchBoard = matchBoardRepository.findById(boardNo).orElse(null);
		
		return matchBoard;
		
		
		}
		
	
	

}

