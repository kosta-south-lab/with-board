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
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Game {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "game_no_seq")
	@SequenceGenerator(sequenceName = "game_no_seq", allocationSize = 1, name="game_category_no_seq")
	private Long gameNo;
	
	@Column(length = 100)
	private String gameName;
	
	private int playPersonnelMax;
	private int playPersonnelMin;
	private int gamePlaytimeMax;
	private int gamePlaytimeMin;
	private int age;
	
	@Column(length = 250)
	private String videoUrl;
	
	@ManyToOne
	@JoinColumn(name = "process_no")
	private GameProcess gameProcess;
	
	@ManyToOne
	@JoinColumn(name = "theme_no")
	private GameTheme gameTheme;
	
	@ManyToOne
	@JoinColumn(name = "game_category_no")
	private GameCategory gameCategory;

}
