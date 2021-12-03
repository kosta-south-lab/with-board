package withboard.mvc.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import withboard.mvc.handler.AlarmEchoHandler;

@Configuration
@EnableWebSocket
public class AlarmWebSocketConfig implements WebSocketConfigurer {

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {

		registry.addHandler(new AlarmEchoHandler(), "/alarmEcho").addInterceptors(new HttpSessionHandshakeInterceptor()).setAllowedOrigins("*");
	}

	
	
}
