package withboard.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;


import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Board;
import withboard.mvc.repository.BoardRepository;

@Service
@Transactional
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

	private final BoardRepository boardRepository;

	@Override
	public List<Board> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Board> selectAll(Pageable pageable) {
		
		return boardRepository.findAll(pageable);
	}

	@Override
	public void insert(Board board) {
		Board bd=boardRepository.save(board);
		
	}

	@Override
	public Board selectBy(Long boardNo, boolean state) {
		if(state) {
			//조회수 증가
			if( boardRepository.viewCountUpdate(boardNo) == 0 ) {
				throw new RuntimeException(boardNo+"번호 오류로 조회수 증가 실패하여 검색할 수 없습니다.");
			}
		}
		
		//검색
		Board Board = boardRepository.findById(boardNo).orElse(null);
		
		return Board;
	}

	@Override
	public Board update(Board board) {
		Board dbBoard = boardRepository.findById(board.getBoardNo()).orElse(null);
		if(dbBoard==null) throw new RuntimeException("글번호 오류로 수정될수 없습니다.");
		
		//비밀번호 확인
		if(!dbBoard.getMember().getPw().equals(board.getMember().getPw())) {
			throw new RuntimeException("비밀번호오류로 수정 할수 없습니다.");
		}
		
		//정보수정
		dbBoard.setContent( board.getContent().replace("<", "&lt;") );
		dbBoard.setTitle( board.getTitle() );
		
		return dbBoard;
	}

	@Override
	public void delete(Long boardNo, String password) {
		//비번을 검증
	    Board Board  = boardRepository.findById(boardNo).orElse(null);
	    if(Board == null)
	    	throw new RuntimeException("글번호 오류로 삭제 할수 없습니다.");
	    
	    if(!Board.getMember().getPw().equals(password)) {
	    	throw new RuntimeException("비밀번호를 다시 확인해주세요(삭제실패)");
	    }
		
		
	    boardRepository.delete(Board);

	}
	

	}


