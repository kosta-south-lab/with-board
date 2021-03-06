package withboard.mvc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.transaction.Transactional;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Transactional
public class Authorities {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "authorities_no_seq")
	@SequenceGenerator(sequenceName = "authorities_no_seq", allocationSize = 1, name="authorities_no_seq")
	private Long authoritiesNo;
	
	@Column(nullable = false)
	private String role;
	
	@ManyToOne
	@JoinColumn(name = "member_no")
	private Member member;
	
	
}
