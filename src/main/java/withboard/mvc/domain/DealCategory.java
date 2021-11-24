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
public class DealCategory {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "deal_category_no_seq")
	@SequenceGenerator(sequenceName = "deal_category_no_seq", allocationSize = 1, name = "deal_category_no_seq")
	private int dealCategoryNo;
	
	@Column(nullable = false, length=100)
	private String dealCategoryName;
}
