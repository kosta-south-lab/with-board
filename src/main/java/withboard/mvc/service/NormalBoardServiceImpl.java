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

}
