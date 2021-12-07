package withboard.mvc.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import withboard.mvc.domain.JoinMatch;
import withboard.mvc.domain.Member;

public interface JoinMatchService {
	

	
	public void insert(JoinMatch joinmatch);
	
	public void delete(Long joinmatchNo);

	//public List<JoinMatch> joinMatchList(Member member);

	List<JoinMatch> joinMatchList(HttpSession session);
	
	JoinMatch joinMatchList2(HttpSession session);

}
