package com.mobapp.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mobapp.service.UserService;
import com.mobapp.model.User;

@Controller
public class SecurityNavigation {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/user-login", method=RequestMethod.GET)
	public ModelAndView loginForm() {
		return new ModelAndView("index");
	}
	
	@RequestMapping(value="/error-login", method=RequestMethod.GET)
	public ModelAndView invalidLogin() {
		ModelAndView modelAndView = new ModelAndView("index");
		modelAndView.addObject("error", true);
		return modelAndView;
	}
	
	@RequestMapping(value="/success-login", method=RequestMethod.GET)
	public ModelAndView successLogin(Principal principal) {
		ModelAndView mav = new ModelAndView("dashboard");
		User user = userService.getUser(principal.getName());
		mav.addObject("firstName", user.getFirstName());
		mav.addObject("lastName", user.getLastName());
		mav.addObject("id", user.getId());
		return mav;
	}

}
