package withboard.mvc.domain;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.security.core.Transient;

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
	
	//MemberRole에 대한 참조
	@OneToMany (cascade = CascadeType.ALL, fetch = FetchType.EAGER) //<-- 권한정보는 회원정보와 같이 필요한 경우가 많아서 fetch 모드를 즉시로딩으로 설정.
	@JoinColumn(name = "member")
	@Transient
	private List<Authorities> roles;

	
	@Transient //칼럼x
	private String emailToken;
	
	@Transient
	private boolean isValid;
	@Transient
	private LocalDateTime joinedAt;


	@Transient
	  public void generateToken() {
	        this.emailToken = UUID.randomUUID().toString();
	    }
	
		@Transient
	    public void verified() {
	        this.isValid = true;
	        joinedAt = LocalDateTime.now();
	    }

}
