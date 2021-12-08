package withboard.mvc.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ChatMessage {
	private String type;
	private String roomNumber;
	private String sessionId;
	private String userName;
	private String msg;
	private Member member;
	
	private String flag;
}
