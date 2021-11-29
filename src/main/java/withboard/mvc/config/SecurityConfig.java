package withboard.mvc.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import jdk.internal.org.jline.utils.Log;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import withboard.mvc.service.MemberService;

@Configuration
@EnableWebSecurity //어노테이션 추가 
@lombok.extern.java.Log
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter { //설정 담당하는 WebSecurityConfigurerAdapter 상속
	@Autowired
	MemberService memberService;
	
    @Bean 
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder() { //SecurityContext 패스워드에 대한 암호화가 진행
			
			@Override
			public boolean matches(CharSequence rawPassword, String encodedPassword) {
				return rawPassword.equals(encodedPassword);
			}
			@Override
			public String encode(CharSequence rawPassword) {
				return rawPassword.toString();
			}
		};
    }

    @Override
    public void configure(WebSecurity web) throws Exception
    {
        // static 디렉터리의 하위 파일 목록은 인증 x ( = 항상통과 )
        web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/lib/**");
    }
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	
    	http.cors().and();
		http.csrf().disable(); 
		http.headers().frameOptions().sameOrigin(); // form을 submit시킬때 문제없이 넘어가게 하기위함

    	// 페이지 권한 설정 
    	http.authorizeRequests()
    	.antMatchers("/").permitAll() // 모든 페이지에 권한이 가능하게 설정...
		//.antMatchers("/user/**")
		//.access("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
		//.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
		.and()
		.formLogin().permitAll().loginProcessingUrl("/home") // 로그인 성공후 가야할 페이지 주소
		.and()
		.logout().permitAll().logoutSuccessUrl("/login");
    	 
    }

	//로그인하기위한 AuthenticationManagerBuilder를 주입해서 인증에대한 처리
	 @Autowired
	 public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		 
		 auth.inMemoryAuthentication()
		 .withUser("test")
		 .password("1111")
		 .roles("admin");
			
	 }
	 
	 
}
