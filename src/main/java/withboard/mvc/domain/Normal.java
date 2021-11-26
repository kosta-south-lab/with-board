package withboard.mvc.domain;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@DiscriminatorValue("NORMAL")
public class Normal extends Board{
	
	@ManyToOne
	@JoinColumn(name="normal_category_no")
	private NormalCategory normalCategory;
}
