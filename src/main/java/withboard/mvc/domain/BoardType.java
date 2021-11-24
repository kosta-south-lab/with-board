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
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class BoardType {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "board_type_no_seq")
	@SequenceGenerator(sequenceName = "board_type_no_seq", allocationSize = 1, name = "board_type_no_seq")
	private int boardType;
	
	@Column(nullable = false, length = 100)
	private String boardTypeName;
}
