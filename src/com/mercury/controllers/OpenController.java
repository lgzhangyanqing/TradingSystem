package com.mercury.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@SessionAttributes
@Controller
public class OpenController {
	@RequestMapping(value="/terms", method = RequestMethod.GET)
	public ModelAndView terms(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("terms_and_policy");
		mav.addObject("title", "YFTS Terms");
		mav.addObject("content", "contents contents contents contents contents");
		return mav;
	}
	
	@RequestMapping(value="/policy", method = RequestMethod.GET)
	public ModelAndView policy(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("terms_and_policy");
		mav.addObject("title", "YFTS Policy");
		mav.addObject("content", "contents contents contents contents contents");
		return mav;
	}
}
