package withboard.mvc.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSocket
@RequiredArgsConstructor
public class PostMessageSocketConfig implements WebSocketConfigurer {
    
	private final WebSocketHandler postMessageHandler;
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		// TODO Auto-generated method stub
		registry.addHandler(postMessageHandler, "/postMessage") //웹소켓 url
		.addInterceptors(new HttpSessionHandshakeInterceptor()) //HTTPSESSION 가로채기
    	.setAllowedOrigins("*");;
	}

}
