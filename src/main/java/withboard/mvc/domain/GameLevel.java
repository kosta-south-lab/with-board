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
public class GameLevel {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "game_level_no_seq")
	@SequenceGenerator(sequenceName = "game_level_no_seq", allocationSize = 1, name = "game_level_no_seq")
	private Long gameLevelNo;
	
	@ManyToOne
	@JoinColumn(name = "game_no")
	private Game game;
	
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Member member;
	
	@Column(nullable = false)
	private int levelScore;
}
