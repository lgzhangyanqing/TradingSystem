package com.mercury.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.User;
import com.mercury.service.UserService;

@Controller
public class LoginController {
	
	private UserService us;
	
	public UserService getUs() {
		return us;
	}

	public void setUs(UserService us) {
		this.us = us;
	}

	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		return "login";
	}
	
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public ModelAndView mainPage() {	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("title", "Hello, welcome to YF Trading System!");
		return mav;
	}
	
	@RequestMapping(value="/header")
	@ResponseBody
	public User header() {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		User user = us.findUserByUserName(username);
		return user;
	}
}
