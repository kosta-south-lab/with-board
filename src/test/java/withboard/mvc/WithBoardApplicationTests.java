package withboard.mvc;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import withboard.mvc.domain.Member;
import withboard.mvc.domain.News;
import withboard.mvc.repository.MemberRepository;
import withboard.mvc.repository.NewsRepository;


@SpringBootTest
@Transactional
@Commit
class WithBoardApplicationTests {

	@Autowired
	private NewsRepository newsRepository;
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Test
	public void insertTest() {
		//Member member = new Member(null, "member1", "1234", "M", "서울시", "송파구", "테스트멤버", "테스트멤버", "test@daum.net", null, 0, 0, null);
		
		Member member = Member.builder().id("member1").pw("1234").gender("M").location("서울시").location2("송파구").build();
		
		memberRepository.save(member);
		News news = new News();
		news.setContent("kosta 대회 개최합니다. 많은 참여 바랍니다");
		news.setMember(member);
		news.setTitle("kosta 대회");
		newsRepository.save(news);
	}

}