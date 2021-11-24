package withboard.mvc.domain;

import java.time.LocalDateTime;

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
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "reply_no_seq")
	@SequenceGenerator(sequenceName = "reply_no_seq", allocationSize = 1, name = "reply_no_seq")
	private int replyNo;
	
	@Column(nullable = false, length = 250)
	private String replyContent;
	
	@CreationTimestamp
	private LocalDateTime replyDate;
	
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "board_no")
	private Board board;
}
