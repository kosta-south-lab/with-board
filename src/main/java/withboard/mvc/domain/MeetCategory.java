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
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MeetCategory {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "meet_category_no_seq")
	@SequenceGenerator(sequenceName = "meet_category_no_seq", allocationSize = 1, name = "meet_category_no_seq")
	private int meetCategoryNo;
	
	@Column(nullable = false, length=100)
	private String meetCategoryName;
}	
