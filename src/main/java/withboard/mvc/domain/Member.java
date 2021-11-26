package withboard.mvc.domain;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

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
@Table(name = "members")
public class Member {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "member_no_seq")
	@SequenceGenerator(sequenceName = "member_no_seq", allocationSize = 1, name="member_no_seq")
	private Long memberNo;
	
	@Column(nullable = false, length = 30)
	private String id;
	
	@Column(nullable = false, length = 30)
	private String pw;
	
	@Column(nullable = false, length = 100)
	private String gender;
	
	@Column(nullable = false, length = 100)
	private String location;
	
	@Column(nullable = false, length = 100)
	private String location2;
	
	@Column(nullable = false, length = 100)
	private String name;
	
	@Column(nullable = false, length = 30)
	private String nickname;
	
	@Column(nullable = false, length = 100)
	private String email;
	
	@Column(length = 250)
	private String image;
	
	private int status;
	
	private int joinCount;
	
	@CreationTimestamp
	private LocalDateTime joinDate;
	
	@OneToMany //MemberRole에 대한 참조
		@JoinColumn(name = "member")
		private List<MemberRole> roles;
}
