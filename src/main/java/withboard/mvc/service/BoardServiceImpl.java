package withboard.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Board;
import withboard.mvc.repository.BoardRepository;

@Service
@RequiredArgsConstructor
@Transactional
public class BoardServiceImpl implements BoardService {

	private final BoardRepository boardRepository;
	
	@Override
	public List<Board> selectAll() {
		return boardRepository.findAll();
	}

}
