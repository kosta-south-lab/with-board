package withboard.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorColumn(name = "board_type")
@ToString
public class Board {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "board_no_seq")
	@SequenceGenerator(sequenceName = "board_no_seq", allocationSize = 1, name = "board_no_seq")
	private Long boardNo;
	
	@Column(nullable = false, length = 100)
	private String title;
	@Column(nullable = false, length = 1000)
	private String content;
	
	@CreationTimestamp
	private LocalDateTime regdate;
	
	private int viewCount;
	
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Member member;	
	
}
