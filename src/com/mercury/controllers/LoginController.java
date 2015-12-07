package com.mercury.controllers;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.User;
import com.mercury.beans.UserInfo;
import com.mercury.service.RegisterService;
import com.mercury.service.UserService;

@SessionAttributes
@Controller
public class LoginController {
	@Autowired
	@Qualifier("jdbcUserService")  // <-- this references the bean id
	public UserDetailsManager userDetailsManager;
	@Autowired
	private UserService us;
	@Autowired
	private RegisterService rs;
	@Autowired 
	private UserDetailsService userDetailsSvc;
	
	public UserService getUs() {
		return us;
	}
	public void setUs(UserService us) {
		this.us = us;
	}
	public RegisterService getRs() {
		return rs;
	}
	public void setRs(RegisterService rs) {
		this.rs = rs;
	}
	
	//for login
	@RequestMapping(value="login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		return "login";
	}
	
	@RequestMapping(value="/home", method = RequestMethod.GET)
	public ModelAndView mainPage(Principal principal){
		String username = principal.getName();
		System.out.println(username);
		User user = us.findUserByUserName(username);
		UserInfo userInfo = us.userLogin(username);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		mav.addObject("userInfo", userInfo);
		return mav;
	}
	
	@RequestMapping(value="/header")
	@ResponseBody
	public User header() {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		User user = us.findUserByUserName(username);
		return user;
	}

	//for sign up
	@RequestMapping(value="/confirmation", method=RequestMethod.POST)
	public ModelAndView process(@ModelAttribute("user") 
			User user, BindingResult result) {
		UserInfo userInfo = rs.register(user);
		rs.sendMail(user.getUserName(), user.getEmail());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("confirmation");
		mav.addObject("userInfo", userInfo);
		return mav;
	}
	
	@RequestMapping(value="/activateAccount", method = RequestMethod.GET)
	public ModelAndView activeMail(HttpServletRequest request) {
		String username = request.getParameter("username");
		User user = us.findUserByUserName(username);
		String checkcode = request.getParameter("checkcode");
		ModelAndView mav = new ModelAndView();
		System.out.println(rs.md5(username).equals(checkcode));
		if(rs.md5(username).equals(checkcode)){
			int enabled = user.getEnabled();
			if(enabled==1){
				mav.setViewName("linkoutoftime");
				return mav;
			}
			rs.ActivateUser(username);
			mav.setViewName("active_confirm");
			mav.addObject("userName", username);
			return mav;
		}
		mav.setViewName("error");
		mav.addObject("content","invalid link");
		return mav;
		
	}
	
	@RequestMapping(value="/registervalidation", method=RequestMethod.POST)
	@ResponseBody
	public String isUserExist(HttpServletRequest request){
		String username = request.getParameter("userName");
		System.out.println(username);
		if(us.isUserExist(username)) {
			System.out.println("name existeddd...........................");
			return "true";
		}
		if(request.getParameter("email")!=null){ 
			String email = request.getParameter("email");
			System.out.println(email);
			if(us.isEmailExist(email)){
				System.out.println("email existedd...........................");
				return "true";
			}
		}
		return "false";
	}
	
	@RequestMapping(value="login_auto", method = RequestMethod.POST)
	public String loginAuto(HttpServletRequest request) {
		String username = request.getParameter("j_username");
		String password = us.findUserByUserName(username).getPassWord();
		try {
			UserDetails userDetails = userDetailsSvc.loadUserByUsername(username);
			UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(userDetails, password, userDetails.getAuthorities());
		    // redirect into secured main page if authentication successful
		    if(auth.isAuthenticated()) {
		    	SecurityContextHolder.getContext().setAuthentication(auth);
		        return "redirect:/home";
		    }
		} catch (Exception e) {
			e.getStackTrace();
		}
		return "redirect:/error";
	}
}
