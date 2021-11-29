package withboard.mvc.domain;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GameComment {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "game_comment_seq")
	@SequenceGenerator(sequenceName = "game_comment_seq", allocationSize = 1, name = "game_comment_seq")
	private Long commentNo;

	@Column(length = 1000)
	private String comment;

	@CreationTimestamp
	private LocalDateTime commentDate;

	@ManyToOne
	@JoinColumn(name = "game_no")
	private Game game;
	
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Member member;

}
