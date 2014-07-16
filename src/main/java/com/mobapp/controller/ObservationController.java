package com.mobapp.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.mobapp.model.Observation;
import com.mobapp.model.User;
import com.mobapp.service.ClientService;
import com.mobapp.service.ObservationService;
import com.mobapp.service.UserService;

@Controller
public class ObservationController {
	@Autowired
	private ObservationService observationService;
	@Autowired
	private ClientService clientService;
	@Autowired
	private UserService userService;
	@Autowired
	private MessageSource messageSource;

	@RequestMapping(value = "/observations/create", method = RequestMethod.GET)
	public ModelAndView createObservationPage(Principal principal) {
		ModelAndView mav = new ModelAndView("observations/new-observation");
		mav.addObject("observation", new Observation());
		mav.addObject("clientsList", clientService.getAll());
		User user = userService.getUser(principal.getName());
		mav.addObject("firstName", user.getFirstName());
		mav.addObject("lastName", user.getLastName());
		mav.addObject("id", user.getId());
		return mav;
	}

	@RequestMapping(value = "/observations/create", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Observation createObservation(@RequestBody @Valid Observation observation) {
		   Date date = new Date();
		observation.setCreatedAt(date);
		return observationService.create(observation);
	}
	
	@RequestMapping(value = "/observation/{id}", method = RequestMethod.GET)
	public ModelAndView getObservation(Principal principal, @PathVariable int id) {
		ModelAndView mav = new ModelAndView("observations/view-observation");
		mav.addObject("observation", observationService.get(id));
		User user = userService.getUser(principal.getName());
		mav.addObject("firstName", user.getFirstName());
		mav.addObject("lastName", user.getLastName());
		mav.addObject("id", user.getId());
		return mav;
	}

	@RequestMapping(value = "/observations/edit/{id}", method = RequestMethod.GET)
	public ModelAndView editObservationPage(@PathVariable int id, Principal principal) {
		ModelAndView mav = new ModelAndView("observations/edit-observation");
		Observation observation = observationService.get(id);
		mav.addObject("observation", observation);
		User user = userService.getUser(principal.getName());
		mav.addObject("firstName", user.getFirstName());
		mav.addObject("lastName", user.getLastName());
		mav.addObject("id", user.getId());
		return mav;
	}

	@RequestMapping(value = "/observations/edit/{id}", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Observation editObservation(@PathVariable int id,
			@Valid @RequestBody Observation observation) {
		observation.setId(id);
		Date date = new Date();
		observation.setCreatedAt(date);
		return observationService.update(observation);
	}

	@RequestMapping(value = "/observations/delete/{id}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Observation deleteObservation(@PathVariable int id) {
		return observationService.delete(id);
	}

	@RequestMapping(value = "/observations", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Observation> allObservations() {
		return observationService.getAll();
	}

	@RequestMapping(value = "/observations", method = RequestMethod.GET)
	public ModelAndView allObservationPage(Principal principal) {
		ModelAndView mav = new ModelAndView("observations/all-observations");
		List<Observation> observations = new ArrayList<Observation>();
		observations.addAll(allObservations());
		mav.addObject("observations", observations);
		User user = userService.getUser(principal.getName());
		mav.addObject("firstName", user.getFirstName());
		mav.addObject("lastName", user.getLastName());
		mav.addObject("id", user.getId());
		mav.addObject("clients",clientService.getAll());
		return mav;
	}

	@ExceptionHandler(TypeMismatchException.class)
	@ResponseStatus(value=HttpStatus.NOT_FOUND)
	@ResponseBody
	public ErrorInfo handleTypeMismatchException(HttpServletRequest req, TypeMismatchException ex) {
		Locale locale = LocaleContextHolder.getLocale();
		String errorMessage = messageSource.getMessage("error.bad.observation.id", null, locale);
		
		errorMessage += ex.getValue();
		String errorURL = req.getRequestURL().toString();
		
		return new ErrorInfo(errorURL, errorMessage);
	}
	
}
