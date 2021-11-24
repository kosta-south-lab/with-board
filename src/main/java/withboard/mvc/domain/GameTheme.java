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
public class GameTheme {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "theme_no_seq")
	@SequenceGenerator(sequenceName = "theme_no_seq", allocationSize = 1, name="theme_no_seq")
	private int themeNo;
	
	@Column(nullable = false, length = 100)
	private String themeName;
}
