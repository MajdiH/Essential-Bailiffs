package com.mobapp.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mobapp.model.User;
import com.mobapp.service.UserService;

@Controller
public class NavigationController {
	@Autowired
	private UserService userService;

//	@RequestMapping(value={"/", "index"}, method=RequestMethod.GET)
//	public ModelAndView homePage() {
//		return new ModelAndView("index");
//	}
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView homePage() {
		return new ModelAndView("index");
	}
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public ModelAndView indexPage() {
		return new ModelAndView("index");
	}
	@RequestMapping(value="/pages/help", method=RequestMethod.GET)
	public ModelAndView helpPage(Principal principal) {
		ModelAndView mav = new ModelAndView("pages/howisworking");
		User user = userService.getUser(principal.getName());
		mav.addObject("firstName", user.getFirstName());
		mav.addObject("lastName", user.getLastName());
		mav.addObject("id", user.getId());
		return mav;
	}
}
