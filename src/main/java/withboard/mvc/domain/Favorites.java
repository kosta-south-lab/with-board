package withboard.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Favorites {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "favorites_no_seq")
	@SequenceGenerator(sequenceName = "favorites_no_seq", allocationSize = 1, name = "favorites_no_seq")
	private Long favoritesNo;
	
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "game_no")
	private Game game;
}

