package withboard.mvc.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.MatchBoard;
import withboard.mvc.repository.MatchBoardRepository;

@Service
@RequiredArgsConstructor
public class MatchBoardServiceImpl implements MatchBoardService {

	
private final MatchBoardRepository matchBoardRepository;
	
	public List<MatchBoard> selectAll() {
		return matchBoardRepository.findAll();
	}
	
	public void insert(MatchBoard matchBoard) {
		matchBoardRepository.save(matchBoard);
		
		
	}
	public MatchBoard update(MatchBoard matchBoard) {
		MatchBoard mb = matchBoardRepository.findById(matchBoard.getBoardNo()).orElse(null);
		if(mb==null) throw new RuntimeException("글번호 오류로 수정될수 없습니다.");
		
		mb.setTitle(matchBoard.getTitle());
		mb.setContent(matchBoard.getContent());
		//추가해야함 맵 정보나 여러가지(스케치 확인바람)
		return mb;
		
	}
	
	public void delete(Long boardNo) {
		MatchBoard mb = matchBoardRepository.findById(boardNo).orElse(null);
		if(mb==null) throw new RuntimeException("글번호 오류로 수정될수 없습니다.");
		
	
		matchBoardRepository.delete(mb);
		
	}
	

}
