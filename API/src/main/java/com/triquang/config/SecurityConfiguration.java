package com.triquang.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.accept.ContentNegotiationStrategy;
import org.springframework.web.accept.HeaderContentNegotiationStrategy;

import com.okta.spring.boot.oauth.Okta;

@Configuration
public class SecurityConfiguration {
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.authorizeRequests(configurer -> 
					configurer.antMatchers("/api/orders/**")
							   .authenticated())
		.oauth2ResourceServer()
		.jwt();
		http.cors();
		
		// Add content negotiation strategy
		http.setSharedObject(ContentNegotiationStrategy.class, new HeaderContentNegotiationStrategy());
		
		Okta.configureResourceServer401ResponseBody(http);
		
		// disable CSRF since we are not using cookies for session tracking
		http.csrf().disable();
		
		return http.build();
		
	}
}
