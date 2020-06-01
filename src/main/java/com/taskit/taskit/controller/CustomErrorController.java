package com.taskit.taskit.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomErrorController implements ErrorController {
	
	private static final Logger logger = Logger.getLogger(CustomErrorController.class.getName());
	
	@RequestMapping("/error")
    public String handleError(HttpServletRequest request,
    						  HttpServletResponse response) {
		
		if (response.getStatus() == response.SC_NOT_FOUND) {
			return "not-found";
		} else {
			return "login";
		}
		
    }

	@Override
	public String getErrorPath() {
		return "/error";
	}

}
