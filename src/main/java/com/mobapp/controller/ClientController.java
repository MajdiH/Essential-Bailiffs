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
import com.mobapp.model.Client;
import com.mobapp.model.User;
import com.mobapp.service.ClientService;
import com.mobapp.service.UserService;

@Controller
public class ClientController {

	@Autowired
	private ClientService clientService;
	@Autowired
	private UserService userService;
	@Autowired
	private MessageSource messageSource;

	@RequestMapping(value = "/clients/create", method = RequestMethod.GET)
	public ModelAndView createClientPage(Principal principal) {
		ModelAndView mav = new ModelAndView("clients/new-client");
		mav.addObject("client", new Client());
		User user = userService.getUser(principal.getName());
		mav.addObject("firstName", user.getFirstName());
		mav.addObject("lastName", user.getLastName());
		mav.addObject("id", user.getId());
		return mav;
	}

	@RequestMapping(value = "/clients/create", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Client createClient(@RequestBody @Valid Client client) {
		return clientService.create(client);
	}

	@RequestMapping(value = "/clients/edit/{id}", method = RequestMethod.GET)
	public ModelAndView editClientPage(@PathVariable int id, Principal principal) {
		ModelAndView mav = new ModelAndView("clients/edit-client");
		Client client = clientService.get(id);
		mav.addObject("client", client);
		User user = userService.getUser(principal.getName());
		mav.addObject("firstName", user.getFirstName());
		mav.addObject("lastName", user.getLastName());
		mav.addObject("id", user.getId());
		return mav;
	}

	@RequestMapping(value = "/clients/edit/{id}", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Client editClient(@PathVariable int id,
			@Valid @RequestBody Client client) {
		client.setId(id);
		return clientService.update(client);
	}

	@RequestMapping(value = "/clients/delete/{id}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Client deleteClient(@PathVariable int id) {
		return clientService.delete(id);
	}

	@RequestMapping(value = "/clients", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Client> allClients() {
		return clientService.getAll();
	}

	@RequestMapping(value = "/clients", method = RequestMethod.GET)
	public ModelAndView allClientsPage(Principal principal) {
		ModelAndView mav = new ModelAndView("clients/all-clients");
		List<Client> clients = new ArrayList<Client>();
		clients.addAll(allClients());
		mav.addObject("clients", clients);
		User user = userService.getUser(principal.getName());
		mav.addObject("firstName", user.getFirstName());
		mav.addObject("lastName", user.getLastName());
		mav.addObject("id", user.getId());
		return mav;
	}
	
	@RequestMapping(value = "/client/{id}", method = RequestMethod.GET)
	public ModelAndView getClient(Principal principal, @PathVariable int id) {
		ModelAndView mav = new ModelAndView("clients/view-client");
		mav.addObject("client", clientService.get(id));
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
		String errorMessage = messageSource.getMessage("error.bad.client.id", null, locale);
		
		errorMessage += ex.getValue();
		String errorURL = req.getRequestURL().toString();
		
		return new ErrorInfo(errorURL, errorMessage);
	}

}
