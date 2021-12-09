package withboard.mvc.domain;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

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
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class Member {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "member_no_seq")
	@SequenceGenerator(sequenceName = "member_no_seq", allocationSize = 1, name="member_no_seq")
	private Long memberNo;
	
	@Column(nullable = false, length = 30)
	private String id;
	
	@Column(nullable = false, length = 100)
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
	
	//이메일 인증이 되었는지 확인할 컬럼
	@Column(length = 100)
	private String emailConfirm = "confirmNot";
	     
	private int status;
	
	private int joinCount;
	
	@CreationTimestamp
	private LocalDateTime joinDate;
	
	//MemberRole에 대한 참조
	@OneToMany (cascade = CascadeType.ALL, fetch = FetchType.EAGER) //<-- 권한정보는 회원정보와 같이 필요한 경우가 많아서 fetch 모드를 즉시로딩으로 설정.
	@JoinColumn(name = "member")
	@Transient
	private List<Authorities> roles;
	
	@OneToMany(mappedBy = "receiver", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<MatchAlarm> matchAlarmList;
	
	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL)
	private List<Favorites> favoritesList;
	
	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL)
	private List<GameRating> gameRatingList;
	
	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL)
	private List<GameComment> gameCommentList;

	}


