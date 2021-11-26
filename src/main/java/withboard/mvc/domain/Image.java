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
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Image {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "image_no_seq")
	@SequenceGenerator(sequenceName = "image_no_seq", allocationSize = 1, name = "image_no_seq")
	private Long imageNo;
	
	@Column(nullable = false, length = 250)
	private String imageUrl;
	
	@ManyToOne
	@JoinColumn(name = "board_no")
	private Board board;
	
	@ManyToOne
	@JoinColumn(name = "game_no")
	private Game game;
	
}
