package withboard.mvc.domain;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
public class MatchAlarm {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "match_alarm_no_seq")
	@SequenceGenerator(sequenceName = "match_alarm_no_seq", allocationSize = 1, name = "match_alarm_no_seq")
	public Long matchAlarmNo;
	
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Member writer;
	
	@OneToMany(mappedBy = "matchAlarm", cascade = CascadeType.ALL)
	private List<Member> receivers;
	
	@Column(nullable = false, length = 250)
	private String title;
	
	@Column(nullable = false, length = 1000)
	private String content;
	
	@Column(nullable = false, length = 250)
	private String location1;
		
	@Column(nullable = false, length = 250)
	private String location2;
	
	
	private int receiveCheck;
	
	@CreationTimestamp
	private LocalDateTime sendDate;
	
}
