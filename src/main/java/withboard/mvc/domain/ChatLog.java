package withboard.mvc.domain;

import javax.persistence.Column;
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
public class ChatLog {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "chat_log_no_seq")
	@SequenceGenerator(sequenceName = "chat_log_no_seq", allocationSize = 1, name = "chat_log_no_seq")
	private Long chatLogNo;
	
	private String chatLogContent;
	
//	@ManyToOne
//	@JoinColumn(name = "board_no")
//	private MatchBoard matchBoard; //MathBoard 타입으로 해야하나 Board 타입으로해야하나 고민
//	
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Member member;
	

	private Long joinMatchNo;
	
	private String nickname;
	

}