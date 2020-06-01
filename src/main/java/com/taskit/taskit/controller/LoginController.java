package com.taskit.taskit.controller;

import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	
	private static Logger logger = Logger.getLogger(com.taskit.taskit.utils.TaskitAppLogger.class.getName());
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model, HttpSession session, HttpServletRequest request) throws ServletException {
		
		logger.info("Requesting login page");
		
		if (session.getAttribute("error") != null) {
			logger.info("Detecting errors from login failed. Retrieving.");
			session.removeAttribute("error");
			model.addAttribute("error", true);
		} else if (session.getAttribute("logout") != null) {
			logger.info("Detecting logout. Redirecting to login page");
			session.removeAttribute("logout");
			model.addAttribute("logout", true);
			request.logout();
		} else if (session.getAttribute("success") != null) {
			logger.info("Registration succeed!");
			session.removeAttribute("success");
			model.addAttribute("success", true);
		}
		
		if (request.getRemoteUser() != null) {
			return "redirect:/note/overview";
		}
		
		return "login";
	}
	
	@RequestMapping(value = "/loginFailed", method = RequestMethod.GET) 
	public String loginFailed(ModelMap model, HttpSession session) {
			
		logger.info("Login failed. Retrieving errors");
		session.setAttribute("error", true);
		return "redirect:/login";
		
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET) 
	public String logout(ModelMap model, 
					     HttpSession session, 
					     HttpServletRequest request) {
		
		
		session.setAttribute("logout", true);
		return "redirect:/login";
	}
	
	@RequestMapping(value = "/403", method = RequestMethod.GET) 
	public String error403(ModelMap model) {
		return "403";
	}

}
