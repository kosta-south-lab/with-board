package withboard.mvc;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import withboard.mvc.domain.Member;
import withboard.mvc.domain.Normal;
import withboard.mvc.domain.NormalCategory;
import withboard.mvc.repository.MemberRepository;
import withboard.mvc.repository.NewsRepository;
import withboard.mvc.repository.NormalCategoryRepository;
import withboard.mvc.repository.NormalRepository;

@SpringBootTest
@Transactional
@Commit
public class NormalTest {
	
	@Autowired
	private NormalRepository rep;
	
	@Autowired
	private NormalCategoryRepository crep;
	
	@Autowired
	private MemberRepository mrep;
	/*
	News news = new News();
	news.setContent("kosta 대회 개최합니다. 많은 참여 바랍니다");
	news.setMember(member);
	news.setTitle("kosta 대회");
	newsRepository.save(news);
}*/
	
	@Test
	public void insert() {
		Normal nm = new Normal();
		nm.setContent("일반게시판이용");
		nm.setTitle("1반");
		
		NormalCategory ca = new NormalCategory();
		ca.setNormalCategoryNo(1l);
		nm.setNormalCategory(ca);
		
		Member m=mrep.getById(1l);
		nm.setMember(m);
		
		//Member member=nm.getMember();
		//nm.setMember(member);
		
		//nm.setMember(Member.builder().name("테스트멤버").build());
		
		rep.save(nm);
		System.out.println("nm : " +nm);
	}
	
	
	/**
	 * 전체검색
	 * */
	@Test
	public void selectAll() {
		List<Normal> list = rep.findAll();
		System.out.println("개수 : " + list.size());
		
		/*for(Board b : list) {
			System.out.println(b);
		}*/
		
		list.forEach(b->System.out.println(b));	
	}
	
	/**
	 * 삭제하기
	 * */
	@Test
    public void delete() {
		rep.deleteById(41l);
	}
	
	/**
	 * 수정하기
	 * */
	@Test
	public void update() {
		Normal normal = rep.findById(21L).orElse(null);
		normal.setTitle("수정제목");
		normal.setContent("수정성공");
	}
	
	//카테고리별로 1 = 공략 ... 인서트하고,,,  세팅 후 
	@Test
	public void insertca() {
		/*
		 * Normal normal = rep.getById(21l); NormalCategory ca
		 * =normal.getNormalCategory(); ca.setNormalCategoryNo(1l);
		 * ca.setNormalCategoryName("자유");
		 * 
		 * crep.save(normal); System.out.println("nm : " +normal);
		 */
		
		/*
		 * NormalCategory ca = new NormalCategory(); ca.setNormalCategoryNo(1l);
		 * ca.setNormalCategoryName("자유");
		 * 
		 * Member member = mrep.getById(1l); Normal normal = new Normal();
		 * normal.setBoardNo(21l); normal.setContent("카테고리..");
		 * normal.setMember(member); normal.setTitle("카테고리야...");
		 * normal.setNormalCategory(ca);
		 * 
		 * rep.save(normal);
		 */
		
		//Normal normal =rep.getById(21l);
		//NormalCategory normal= crep.getById(21l);
		NormalCategory ca = new NormalCategory();
		ca.setNormalCategoryName("예판/핫딜");
		ca.setNormalCategoryNo(5l);
		
		
		crep.save(ca);
		
		
	}
	
	@Test
    public void deletec() {
		rep.deleteById(184l);
	}
	//     프론트에서 카테고리별로 받을 수 있게 수정하고 셀렉트박스?
	//컨트롤러 서비스쪽에 카테고리별 분류 
	//제목 or 글쓴이 and 카테고리유형 3가지 받아서 
}
