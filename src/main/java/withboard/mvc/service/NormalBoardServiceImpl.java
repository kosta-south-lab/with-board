package withboard.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Image;
import withboard.mvc.domain.Member;
import withboard.mvc.domain.Normal;
import withboard.mvc.domain.NormalCategory;
import withboard.mvc.repository.BoardRepository;
import withboard.mvc.repository.ImageRepository;
import withboard.mvc.repository.MemberRepository;
import withboard.mvc.repository.NormalCategoryRepository;
import withboard.mvc.repository.NormalRepository;

@Service
@RequiredArgsConstructor
@Transactional
public class NormalBoardServiceImpl implements NormalBoardService {

	private final BoardRepository boardRepository;
	private final NormalRepository normalRepository;
	private final NormalCategoryRepository normalCategoryRepository;
	private final MemberRepository memberRepository;
	private final ImageRepository imageRepository;
	
	@Override
	public List<Normal> selectAll(Long normalCategoryNo, String searchOption, String keyWord) {
		
		NormalCategory normalCategory = normalCategoryRepository.findById(normalCategoryNo).orElse(null);
		List<Normal> normalList = null;
		//카테고리가 없을경우 예외 발생 추가해야함.
		switch(searchOption) {
		case "title":
			normalList = normalRepository.findByNormalCategoryAndTitleContaining(normalCategory, keyWord);
			break;
		case "writer":
			Member writer = memberRepository.findByNicknameContaining(keyWord);
			normalList = normalRepository.findByNormalCategoryAndMember(normalCategory, writer);
			break;
		}
		return normalList;
	}

	@Override
	public void insert(Normal normal, Long normalCategoryNo, List<String> filenameList) {
		NormalCategory normalCategory = normalCategoryRepository.findById(normalCategoryNo).orElse(null);
		if(normalCategory == null) {
			throw new RuntimeException("해당 모임 카테고리가 존재하지 않습니다");
		}
		
		//작성자Member 임시로 만들기 (추후에는 시큐리티 세션에서 얻어올 예정)
		Member writer = Member.builder().memberNo(1l).build();
		normal.setNormalCategory(normalCategory);
		normal.setMember(writer);
		normalRepository.save(normal);
		
		//이미지테이블에 이미지 이름 저장
		for(String fname : filenameList) {
			imageRepository.save(new Image(null, fname, normal, null));
		}
		
	}

	@Override
	public Normal selectBy(Long boardNo, boolean state) {
		if(state) {
			//조회수 증가
			if( boardRepository.viewCountUpdate(boardNo) == 0 ) {
				throw new RuntimeException("게시물이 존재하지 않습니다.");
			}
		}
		
		//검색
		Normal normal = normalRepository.findById(boardNo).orElse(null);
		if(normal == null) {
			throw new RuntimeException("게시물이 존재하지 않습니다.");
		}
		
		return normal;
	}

	@Override
	public void update(Normal normal, Long normalCategoryNo, List<String> filenameList) {
		Normal nm = normalRepository.findById(normal.getBoardNo()).orElse(null);
		if(nm==null) throw new RuntimeException("글번호 오류로 수정될수 없습니다.");
		
		NormalCategory normalCategory = normalCategoryRepository.findById(normalCategoryNo).orElse(null);
		if(normalCategory == null) {
			throw new RuntimeException("해당 카테고리가 존재하지 않습니다");
		}
		
		//정보수정 - 내용/제목
		nm.setContent( normal.getContent().replace("<", "&lt;") );
		nm.setTitle( normal.getTitle() );
		nm.setContent(normal.getContent());
		nm.setNormalCategory(normalCategory);
		
		//이미지테이블에서 이미지이름 삭제
		for(Image image : nm.getImageList()) {
			imageRepository.delete(image);
		}
		//이미지테이블에 새로운 이미지 이름 저장
		for(String fname : filenameList) {
			imageRepository.save(new Image(null, fname, nm, null));
		}
	}

	@Override
	public void delete(Long boardNo) {
		Normal normal  = normalRepository.findById(boardNo).orElse(null);
		
	    if(normal == null)
	    	throw new RuntimeException("글번호 오류로 삭제 할수 없습니다.");
	    
	    normalRepository.delete(normal);

	}

}
