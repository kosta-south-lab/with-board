package withboard.mvc.domain;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@DiscriminatorValue("DEAL")
public class Deal extends Board{
	
	@Column(nullable = false, length = 100)
	private String location;
	
	@Column(nullable = false, length = 100)
	private String location2;
	
	@ManyToOne
	@JoinColumn(name = "deal_category_no")
	private DealCategory dealCategory;
	
	@Builder
	public Deal(String title, String content, Member member, String location, String location2, DealCategory dealCategory) {
		super(title, content, member);
		this.location = location;
		this.location2 = location2;
		this.dealCategory = dealCategory;
	}
}
