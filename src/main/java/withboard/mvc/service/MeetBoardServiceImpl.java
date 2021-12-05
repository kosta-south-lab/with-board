package withboard.mvc.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Game;
import withboard.mvc.domain.Image;
import withboard.mvc.domain.Meet;
import withboard.mvc.domain.MeetCategory;
import withboard.mvc.domain.Member;
import withboard.mvc.repository.BoardRepository;
import withboard.mvc.repository.GameRepository;
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
	private final GameRepository gameRepository;
	
	@Override
	public List<Meet> selectAll(Long meetCategoryNo, String searchOption, String keyWord) {
		
		MeetCategory meetCategory = meetCategoryRepository.findById(meetCategoryNo).orElse(null);
		List<Meet> meetList = null;
		//카테고리가 없을경우 예외 발생 추가해야함.
		switch(searchOption) {
		case "title":
			meetList = meetRepository.findByMeetCategoryAndTitleContaining(meetCategory, keyWord);
			break;
		case "nickname":
			System.out.println("hello");
			Member writer = memberRepository.findByNicknameContaining(keyWord);
			System.out.println(writer);
			meetList = meetRepository.findByMeetCategoryAndMember(meetCategory, writer);
		case "location":
			meetList = meetRepository.findByMeetCategory(meetCategory);
		}
		System.out.println("hello end");
		return meetList;
	}
	
	@Override
	public void insert(Meet meet, Long meetCategoryNo, Long gameNo, List<String> filenameList, Member member) {
		MeetCategory meetCategory = meetCategoryRepository.findById(meetCategoryNo).orElse(null);
		if(meetCategory == null) {
			throw new RuntimeException("해당 모임 카테고리가 존재하지 않습니다");
		}
		Game game = gameRepository.findById(gameNo).orElse(null);
		if(game == null) {
			throw new RuntimeException("번호에 해당하는 게임이 존재하지 않습니다");
		}
		
		meet.setMeetCategory(meetCategory);
		meet.setGame(game);
		System.out.println(member.getId());
		System.out.println(member.getName());
		System.out.println(member.getNickname());
		System.out.println(member.getEmail());
		System.out.println(member.getLocation2());
		meet.setMember(member);
		meetRepository.save(meet);
		
		//이미지테이블에 이미지 이름 저장
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
	public void update(Meet meet, Long meetCategoryNo, Long gameNo, List<String> filenameList) {
		Meet dbMeet = meetRepository.findById(meet.getBoardNo()).orElse(null);
		if(dbMeet==null) throw new RuntimeException("글번호 오류로 수정될 수 없습니다.");		
		
		MeetCategory meetCategory = meetCategoryRepository.findById(meetCategoryNo).orElse(null);
		if(meetCategory == null) {
			throw new RuntimeException("해당 모임 카테고리가 존재하지 않습니다");
		}
		
		Game game = gameRepository.findById(gameNo).orElse(null);
		if(game == null) {
			throw new RuntimeException("번호에 해당하는 게임이 존재하지 않습니다");
		}
		
		dbMeet.setTitle(meet.getTitle().replace("<", "&lt;"));
		dbMeet.setContent(meet.getContent().replace("<", "&lt;"));
		dbMeet.setLocation(meet.getLocation());
		dbMeet.setLocation2(meet.getLocation2());
		dbMeet.setMeetCategory(meetCategory);
		dbMeet.setGame(game);
		

		//이미지테이블에서 이미지이름 삭제
		List<Long> imageNoList = new ArrayList<Long>();
		for(Image image : dbMeet.getImageList()) {
			imageNoList.add(image.getImageNo());
		}
		dbMeet.setImageList(null);
		for(Long imageNo : imageNoList) {
			imageRepository.deleteById(imageNo);
		}
		
		//이미지테이블에 새로운 이미지 이름 저장
		for(String fname : filenameList) {
			imageRepository.save(new Image(null, fname, dbMeet, null));
		}
	}

	@Override
	public void delete(Long BoardNo) {
		meetRepository.deleteById(BoardNo);
	}

	@Override
	public List<Game> selectAllGame() {
		return gameRepository.findAll();
	}
	
	
	
	
}
