package kr.co.helf.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class WebSecurityConfig {
	
	@Autowired
	CustomOAuth2UserService oAuth2UserService;
	
	@Bean
	public SecurityFilterChain formLoginFilterChaing(HttpSecurity http) throws Exception {
		 http
				.csrf()
					.disable()
				.formLogin()
					.loginPage("/user/loginform")
					.usernameParameter("id")
					.passwordParameter("password")
					.loginProcessingUrl("/user/login")
					.defaultSuccessUrl("/")
					.failureUrl("/user/loginform?error=fail")
				.and()
					.logout()
					.logoutUrl("/user/logout")
					.logoutSuccessUrl("/")
					.invalidateHttpSession(true)
				.and()
					.exceptionHandling().authenticationEntryPoint((request, response, authentication) -> {
						response.sendRedirect("/user/loginform?error=denied");
					})
				.and()
					.exceptionHandling().accessDeniedHandler((request, response, exception) -> {
						response.sendRedirect("/user/loginform?error=forbidden");
					})
				.and()
	                .oauth2Login()
	                .loginPage("/user/loginform")
	                .defaultSuccessUrl("/")
	                .userInfoEndpoint()
	                .userService(oAuth2UserService);
				
		return http.build();
		
		
	}
	


	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
