package withboard.mvc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class GameCategory {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "game_category_no_seq")
	@SequenceGenerator(sequenceName = "game_ategory_no_seq", allocationSize = 1, name="game_category_no_seq")
	private int gameCategoryNo;
	
	@Column(nullable = false, length = 100)
	private String gameCategoryName;
}
