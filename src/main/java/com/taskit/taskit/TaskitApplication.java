package com.taskit.taskit;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.support.ErrorPageFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@SpringBootApplication
@ImportResource({
    "/WEB-INF/config/security-config.xml"
})
public class TaskitApplication {

	public static void main(String[] args) {
		SpringApplication.run(TaskitApplication.class, args);
	}
	
	@Bean
    public InternalResourceViewResolver internalResourceViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/jsp/");
        resolver.setSuffix(".jsp");
        return resolver;
    }
	
	@Bean 
	public BCryptPasswordEncoder getCryptoEncoder() {
		return new BCryptPasswordEncoder();
	}

}
