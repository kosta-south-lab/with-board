package withboard.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class JoinMatch {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "join_match_no_seq")
	@SequenceGenerator(sequenceName = "join_match_no_seq", allocationSize = 1, name = "join_match_no_seq")
	private int joinMatchNo;
	
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "board_no")
	private MatchBoard matchBoard; //MatchBoard로 해야하나 Board로 해야하나...
}
