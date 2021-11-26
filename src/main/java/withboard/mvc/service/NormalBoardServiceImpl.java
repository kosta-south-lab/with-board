package withboard.mvc.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Normal;
import withboard.mvc.repository.NormalRepository;

@Service
@RequiredArgsConstructor
public class NormalBoardServiceImpl implements NormalBoardService {

	private final NormalRepository normalRepository;
	
	@Override
	public List<Normal> selectAll() {
		
		List<Normal> normalBoardLsit =normalRepository.findAll();
		return normalBoardLsit;
	}

	@Override
	public void insert(Normal normal) {
		Normal nm = normalRepository.save(normal);
		
		
	}

	@Override
	public Normal selectBy(Long boardNo, boolean state) {
		if(state) {
			//조회수 증가
			if( normalRepository.viewCountUpdate(boardNo) == 0 ) {
				throw new RuntimeException(boardNo+"번호 오류로 조회수 증가 실패하여 검색할 수 없습니다.");
			}
		}
		
		//검색
		Normal normal = normalRepository.findById(boardNo).orElse(null);
		
		return normal;
	}

	@Override
	public Normal update(Normal normal) {
		Normal nm = normalRepository.findById(normal.getBoardNo()).orElse(null);
		if(nm==null) throw new RuntimeException("글번호 오류로 수정될수 없습니다.");
		
		//비밀번호 확인
		if(!nm.getMember().getPw().equals(normal.getMember().getPw())) {
			throw new RuntimeException("비밀번호오류로 수정 할수 없습니다.");
		}
		
		//정보수정 - 내용/제목
		nm.setContent( normal.getContent().replace("<", "&lt;") );
		nm.setTitle( normal.getTitle() );
		
		return nm;
	}

	@Override
	public void delete(Long boardNo, String password) {
		//비번을 검증
		Normal normal  = normalRepository.findById(boardNo).orElse(null);
	    if(normal == null)
	    	throw new RuntimeException("글번호 오류로 삭제 할수 없습니다.");
	    
	    if(!normal.getMember().getPw().equals(password)) {
	    	throw new RuntimeException("비밀번호를 다시 확인해주세요(삭제실패)");
	    }
		
		
	    normalRepository.delete(normal);

	}

}
