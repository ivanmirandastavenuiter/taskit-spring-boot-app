package com.taskit.taskit.controller;

import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.taskit.taskit.entity.Role;
import com.taskit.taskit.entity.User;
import com.taskit.taskit.service.RoleService;
import com.taskit.taskit.service.UserService;

@Controller
public class RegisterController {
	
	@Autowired
	private UserService userService;
	
	@Autowired 
	private RoleService roleService;
	
	private static Logger logger = Logger.getLogger(com.taskit.taskit.utils.TaskitAppLogger.class.getName());
	
	@GetMapping("/register")
	public String showRegisterForm(@ModelAttribute("user")User user,
			  					   @RequestParam(required = false)String success,
			  					   Map<String, Object> model) {
		
		logger.info("Accessing to register page");

		if (success != null && success.equals("true")) {
    		model.put("success", true);
    	}
    	
        return "register";
	}
	
	@PostMapping("/register")
    public String registerUser(@Valid @ModelAttribute("user")User user,
    													BindingResult result,
    													HttpSession session) {
		
		logger.info("Executing user registration");
		
		String password = user.getPassword();
		String confirm = user.getConfirm();
		
		logger.info("Confirm value: " + confirm);
		
		if (password != null && confirm != null) {
			if (!password.equals(confirm)) {
				result.addError(new ObjectError("confirm", "Passwords don't match"));
			}
		}
		
    	if (result.hasErrors()) {
    		logger.info("Errors detected");
    		return "register";
    	}
    	
    	userService.save(user);
    	roleService.setRole(new Role(user.getUsername(), "ROLE_USER"));
    	session.setAttribute("success", true);
        return "redirect:/login";
    }
	

}
