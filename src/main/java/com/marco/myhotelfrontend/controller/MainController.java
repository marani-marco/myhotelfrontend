package com.marco.myhotelfrontend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.marco.myhotelfrontend.models.User;

@Controller
public class MainController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goToIndexPage(ModelMap model) {

		model.put("roomsAvailable", null);
		return "index";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String goToLoginPage(ModelMap model) {

		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String signIn(ModelMap model, User user) {

		final String uri = "http://localhost:8586//sign-in";

		RestTemplate restTemplate = new RestTemplate();
		
		user = restTemplate.postForObject(uri, user, User.class);
		
		model.put("currentUser", user);
		
		return "dashboard";
	}
	

}
