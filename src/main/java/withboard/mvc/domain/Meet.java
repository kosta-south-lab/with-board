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
@DiscriminatorValue("MEET")
public class Meet extends Board {
	
	@Column(nullable = false, length = 100)
	private String location;
	
	@Column(nullable = false, length = 100)
	private String location2;
	
	@ManyToOne
	@JoinColumn(name = "meet_category_no")
	private MeetCategory meetCategory;
	
	@ManyToOne
	@JoinColumn(name = "game_no") //새로 생성해야함....
	private Game game;
	
	@Builder
	public Meet(String title, String content, Member member, String location, String location2, MeetCategory meetCategory) {
		super(title, content, member);
		this.location = location;
		this.location2 = location2;
		this.meetCategory = meetCategory;
	}
	

}
