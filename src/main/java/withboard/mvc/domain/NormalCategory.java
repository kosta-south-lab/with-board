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
public class NormalCategory {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "normal_category_no_seq")
	@SequenceGenerator(sequenceName = "normal_category_no_seq", allocationSize = 1, name="normal_category_no_seq")
	private int normalCategoryNo;
	
	@Column(nullable = false, length = 100)
	private String normalCategoryName;
}
