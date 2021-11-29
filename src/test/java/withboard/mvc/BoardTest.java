package withboard.mvc;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import withboard.mvc.domain.MeetCategory;
import withboard.mvc.repository.MeetCategoryRepository;


@SpringBootTest
@Transactional
@Commit
class BoardTest {

	@Autowired
	private MeetCategoryRepository meetCategoryRepository;
	
	@Test
	public void insertMeetCategory() {
		MeetCategory meetCategory1 = new MeetCategory(null, "정기모임모집");
		MeetCategory meetCategory2 = new MeetCategory(null, "정기모임후기");
		meetCategoryRepository.save(meetCategory1);
		meetCategoryRepository.save(meetCategory2);
	}

}