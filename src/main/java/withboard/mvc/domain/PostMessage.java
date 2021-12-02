package withboard.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
public class PostMessage {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "post_message_no_seq")
	@SequenceGenerator(sequenceName = "post_message_no_seq", allocationSize = 1, name = "post_message_no_seq")
	private Long postMessageNo;
	
	@Column(nullable = false, length = 30)
	private String sendId;
	
	@Column(nullable = false, length = 30)
	private String receiveId;

	@Column(nullable = false, length = 100)
	private String title;
	
	@Column(nullable = false, length = 1000)
	private String content;
	
	private int recvCheck;
	
	@CreationTimestamp
	private LocalDateTime sendDate;
}
