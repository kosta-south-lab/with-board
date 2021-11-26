package withboard.mvc.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class Mail {//발송할 이메일 내용 저장할 Dto
	private String address;
    private String title;
    private String message;

}
