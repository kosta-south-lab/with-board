package withboard.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Image;
import withboard.mvc.domain.Meet;
import withboard.mvc.domain.MeetCategory;
import withboard.mvc.domain.Member;
import withboard.mvc.repository.BoardRepository;
import withboard.mvc.repository.ImageRepository;
import withboard.mvc.repository.MeetCategoryRepository;
import withboard.mvc.repository.MeetRepository;
import withboard.mvc.repository.MemberRepository;

@Service
@RequiredArgsConstructor
@Transactional
public class MeetBoardServiceImpl implements MeetBoardService {

	private final BoardRepository boardRepository;
	private final MeetRepository meetRepository;
	private final MeetCategoryRepository meetCategoryRepository;
	private final MemberRepository memberRepository;
	private final ImageRepository imageRepository;
	
	@Override
	public List<Meet> selectAll(Long meetCategoryNo, String searchOption, String keyWord) {
		
		MeetCategory meetCategory = meetCategoryRepository.findById(meetCategoryNo).orElse(null);
		List<Meet> meetList = null;
		//카테고리가 없을경우 예외 발생 추가해야함.
		switch(searchOption) {
		case "title":
			meetList = meetRepository.findByMeetCategoryAndTitleContaining(meetCategory, keyWord);
			break;
		case "writer":
			Member writer = memberRepository.findByNicknameContaining(keyWord);
			meetList = meetRepository.findByMeetCategoryAndMember(meetCategory, writer);
		case "location":
			meetList = meetRepository.findByMeetCategory(meetCategory);
		}
		return meetList;
	}
	
	@Override
	public void insert(Meet meet, Long meetCategoryNo, List<String> filenameList) {
		MeetCategory meetCategory = meetCategoryRepository.findById(meetCategoryNo).orElse(null);
		if(meetCategory == null) {
			throw new RuntimeException("해당 모임 카테고리가 존재하지 않습니다");
		}
		
		//작성자Member 임시로 만들기 (추후에는 시큐리티 세션에서 얻어올 예정)
		Member writer = Member.builder().memberNo(1L).build();
		
		meet.setMeetCategory(meetCategory);
		meet.setMember(writer);
		meetRepository.save(meet);
		
		//db에 이미지 이름 저장
		for(String fname : filenameList) {
			imageRepository.save(new Image(null, fname, meet, null));
		}
	}

	@Override
	public Meet selectByBoardNo(Long boardNo, boolean state) {
		//viewCount update
		if(state) {
			//조회수 증가
			if(boardRepository.viewCountUpdate(boardNo) == 0 ) {
				throw new RuntimeException("게시물이 존재하지 않습니다.");
			}
		}
		
		Meet meet = meetRepository.findById(boardNo).orElse(null);
		if(meet == null) {
			throw new RuntimeException("게시물이 존재하지 않습니다.");
		}
		
		return meet;
	}

	@Override
	public void update(Meet meet, Long meetCategoryNo) {
		Meet dbMeet = meetRepository.findById(meet.getBoardNo()).orElse(null);
		if(dbMeet==null) throw new RuntimeException("글번호 오류로 수정될 수 없습니다.");		
		
		MeetCategory meetCategory = meetCategoryRepository.findById(meetCategoryNo).orElse(null);
		if(meetCategory == null) {
			throw new RuntimeException("해당 모임 카테고리가 존재하지 않습니다");
		}
		
		dbMeet.setTitle(meet.getTitle().replace("<", "&lt;"));
		dbMeet.setContent(meet.getContent().replace("<", "&lt;"));
		dbMeet.setLocation(meet.getLocation());
		dbMeet.setLocation2(meet.getLocation2());
		dbMeet.setMeetCategory(meetCategory);
		
	}
}
