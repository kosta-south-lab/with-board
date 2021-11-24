package withboard.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class MemberRating {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "member_rating_no_seq")
	@SequenceGenerator(sequenceName = "member_rating_no_seq", allocationSize = 1, name="member_rating_no_seq")
	private int memberRatingNo;
	private int mannerScore;
	private int joinScore;
	private int playStyleScore;
	
	@CreationTimestamp
	private LocalDateTime regdate;
	
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Member member;
	
}
