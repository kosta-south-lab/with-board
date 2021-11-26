package withboard.mvc.config;

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
import withboard.mvc.service.MemberService;

@Configuration
@EnableWebSecurity //어노테이션 추가 
@AllArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter { //설정 담당하는 WebSecurityConfigurerAdapter 상속
	
	private MemberService memberService;

    @Bean 
    public PasswordEncoder passwordEncoder() {
        return new PasswordEncoder() {
			
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
        //http.authorizeRequests()
      
       /* // 페이지 권한
        .antMatchers("/**").permitAll()
        // 로그인
        .and() 
        .formLogin()
        .loginPage("/login") //로그인 페이지 경로 설정
        .loginProcessingUrl("/login") //POST로 로그인 정보를 보낼 시 경로 
        .defaultSuccessUrl("/") //로그인이 성공할 시 경로(메인화면 (index))
        .permitAll()
        .and()
         // 로그아웃
        .logout()
        .logoutRequestMatcher(new AntPathRequestMatcher("/logout")) //로그아웃을 호출할 경우 해당 경로 
        .logoutSuccessUrl("/login") // 로그아웃이 성공했을 경우 해당 경로 
        .invalidateHttpSession(true); //로그아웃시 인증정보를 지우고 세션을 무효화 시키는 설정
        */
    	
    	//log.info("security config......");
    	http.authorizeRequests().antMatchers("/guest/**").permitAll();
    	http.authorizeRequests().antMatchers("/manager/**").hasRole("MANAGER");
    	http.formLogin(); //form 태그 기반의 로그인을 지원하는 설정 (설정하면 별도로 로그인 페이지를 작성하지 않아도 로그인form이 지원된다.)  
    }

	
	/*
	 * @Override public void configure(AuthenticationManagerBuilder auth) throws
	 * Exception {
	 * auth.userDetailsService(memberService).passwordEncoder(passwordEncoder()); }
	 */
	 
}
