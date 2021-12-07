package withboard.mvc.service;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Game;
import withboard.mvc.domain.JoinMatch;
import withboard.mvc.domain.Member;
import withboard.mvc.repository.BoardRepository;
import withboard.mvc.repository.GameRepository;
import withboard.mvc.repository.JoinMatchRepository;
import withboard.mvc.repository.MatchBoardRepository;

@Service
@Transactional
@RequiredArgsConstructor
public class JoinMatchServiceImpl implements JoinMatchService{
	private final JoinMatchRepository joinMatchRepository;
	
	@Override
	public List<JoinMatch> joinMatchList(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		Long num=member.getMemberNo();
		//JoinMatch joinMatch = joinMatchRepository.joinMatchList2(num);
		// session.setAttribute("joinMatch", joinMatch);
		
		return joinMatchRepository.joinMatchList(num);
	}
	@Override
	public JoinMatch joinMatchList2(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		Long num=member.getMemberNo();
		JoinMatch joinMatch = joinMatchRepository.joinMatchList2(num);
		 session.setAttribute("joinMatch", joinMatch);
		return joinMatch;
	}

	@Override
	public void insert(JoinMatch joinmatch) {
		joinMatchRepository.save(joinmatch);
		
	}

	@Override
	public void delete(Long joinmatchNo) {
		joinMatchRepository.deleteById(joinmatchNo);
		
	}




	
}
