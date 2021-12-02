package withboard.mvc.domain;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@Data
public class Mail {//발송할 이메일 내용 저장할 Dto   username=지윤%20&emailConfirm=confirmNot
	private String address;
    private String title;
    private String message;
    
    //주소를 통해 값을 주고받을 때 저장
    
	private String username; //id임 !! pk
	private String email;
	private String emailConfirm;



    

}
