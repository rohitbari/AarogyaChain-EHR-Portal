package com.rohit.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(path="/", method = RequestMethod.GET)
	public String welcomeAarogyaChain() {
		System.out.println("Opening Welcome page.....");
		return "index";
	}
	
	@RequestMapping("/index")
	public String openAarogyaChain() {
		System.out.println("Home page.....");
		return "index";
	}
}
