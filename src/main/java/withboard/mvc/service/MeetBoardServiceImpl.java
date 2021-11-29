package withboard.mvc.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Meet;
import withboard.mvc.repository.MeetRepository;

@Service
@RequiredArgsConstructor
public class MeetBoardServiceImpl implements MeetBoardService {

	private final MeetRepository meetRepository;
	
	@Override
	public List<Meet> selectAll() {
		return meetRepository.findAll();
	}
	
	@Override
	public void insert(Meet meet) {
		
	}

}
