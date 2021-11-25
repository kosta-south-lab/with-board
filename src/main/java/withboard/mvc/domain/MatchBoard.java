package withboard.mvc.domain;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@DiscriminatorValue("MATCH")
public class MatchBoard extends Board {
	
	private int headCount;
	
	@Column(length = 100, nullable = false)
	private String location;
	
	@Column(length = 100, nullable = false)
	private String location2;
	
	@Column(length = 100, nullable = false)
	private String status;

	@Column(length = 1000)
	private String etc;

	@ManyToOne
	@JoinColumn(name = "game_category_no")
	private GameCategory gameCategory;
	
	@ManyToOne
	@JoinColumn(name = "game_no")
	private Game game;
	
}
