package com.mobapp.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mobapp.model.FileMeta;
import com.mobapp.model.User;
import com.mobapp.service.FileMetaService;
import com.mobapp.service.UserService;

@Controller
public class FileMetaController {
	@Autowired
	private FileMetaService fileMetaService;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/medias/create", method = RequestMethod.GET)
	public ModelAndView createMediaPage(Principal principal) {
		ModelAndView mav = new ModelAndView("medias/new-media");
		mav.addObject("fileMeta", new FileMeta());
		User user = userService.getUser(principal.getName());
		mav.addObject("firstName", user.getFirstName());
		mav.addObject("lastName", user.getLastName());
		mav.addObject("id", user.getId());
		return mav;
	}

	@RequestMapping(value = "/medias/create", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public FileMeta createMedia(@RequestBody @Valid FileMeta fileMeta) {
		return fileMetaService.create(fileMeta);
	}
	
	@RequestMapping(value = "/medias", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<FileMeta> allMedias() {
		return fileMetaService.getAll();
	}
	
	@RequestMapping(value = "/medias/delete/{id}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public FileMeta deleteMedia(@PathVariable int id) {
		return fileMetaService.delete(id);
	}

	@RequestMapping(value = "/medias", method = RequestMethod.GET)
	public ModelAndView allMediasPage(Principal principal) {
		ModelAndView mav = new ModelAndView("medias/all-medias");
		List<FileMeta> fileMetas = new ArrayList<FileMeta>();
		fileMetas.addAll(allMedias());
		mav.addObject("allMedias", fileMetas);
		User user = userService.getUser(principal.getName());
		mav.addObject("firstName", user.getFirstName());
		mav.addObject("lastName", user.getLastName());
		mav.addObject("id", user.getId());
		return mav;
	}
	@RequestMapping(value = "/medias/upload", method = RequestMethod.GET)
	public ModelAndView createMediaUploadPage() {
		ModelAndView mav = new ModelAndView("medias/upload");
		return mav;
	}
	

	
	@RequestMapping(value="/medias/upload", method = RequestMethod.POST)
	public @ResponseBody String upload(MultipartHttpServletRequest request, HttpServletResponse response) {

		 Iterator<String> itr =  request.getFileNames();
		 MultipartFile mpf = null;
		 
		 


		 while(itr.hasNext()){
			 try {
				FileCopyUtils.copy(mpf.getBytes(), new FileOutputStream("/Users/majdih/Downloads/spring-mvc-jquery-file-upload/src/main/webapp/img/"+mpf.getOriginalFilename()));
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		 }
		return "Ok";
 
	}
}
