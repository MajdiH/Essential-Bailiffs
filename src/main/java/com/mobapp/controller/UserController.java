package com.mobapp.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.TypeMismatchException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.mobapp.exception.helper.ErrorInfo;
import com.mobapp.model.User;
import com.mobapp.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private MessageSource messageSource;
	
	@RequestMapping(value = "/users/create", method = RequestMethod.GET)
	public ModelAndView createUserPage() {
		ModelAndView mav = new ModelAndView("users/new-user");
		mav.addObject("user", new User());
		return mav;
	}

	@RequestMapping(value = "/users/create", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public User createClient(@RequestBody @Valid User user) {
		return userService.create(user);
	}
	
	@RequestMapping(value = "/users/edit/{id}", method = RequestMethod.GET)
	public ModelAndView edituserPage(@PathVariable int id) {
		ModelAndView mav = new ModelAndView("users/edit-user");
		User user = userService.get(id);
		mav.addObject("user", user);
		return mav;
	}

	@RequestMapping(value = "/users/edit/{id}", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public User editUser(@PathVariable int id,
			@Valid @RequestBody User user) {
		user.setId(id);
		return userService.update(user);
	}
	
	@RequestMapping(value = "/users/delete/{id}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public User deleteUser(@PathVariable int id) {
		return userService.delete(id);
	}
	@RequestMapping(value = "/users", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<User> allUsers() {
		return userService.getAll();
	}

	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public ModelAndView allUsersPage() {
		ModelAndView mav = new ModelAndView("users/all-users");
		List<User> users = new ArrayList<User>();
		users.addAll(allUsers());
		mav.addObject("users", users);
		return mav;
	}
	
	@RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
	public ModelAndView getUser(Principal principal, @PathVariable int id) {
		ModelAndView mav = new ModelAndView("clients/view-client");
		mav.addObject("user", userService.get(id));
		User user = userService.getUser(principal.getName());
		mav.addObject("firstName", user.getFirstName());
		mav.addObject("lastName", user.getLastName());
		mav.addObject("id", user.getId());
		return mav;
	}
	
	@ExceptionHandler(TypeMismatchException.class)
	@ResponseStatus(value=HttpStatus.NOT_FOUND)
	@ResponseBody
	public ErrorInfo handleTypeMismatchException(HttpServletRequest req, TypeMismatchException ex) {
		Locale locale = LocaleContextHolder.getLocale();
		String errorMessage = messageSource.getMessage("error.bad.user.id", null, locale);
		
		errorMessage += ex.getValue();
		String errorURL = req.getRequestURL().toString();
		
		return new ErrorInfo(errorURL, errorMessage);
	}
}
