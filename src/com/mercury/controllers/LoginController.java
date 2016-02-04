package com.mercury.controllers;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.RememberMeAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
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
import com.mercury.mail.MailForgotPassword;
//import com.mercury.service.RegisterService;
import com.mercury.mail.MailRegister;
import com.mercury.service.UserService;

@Controller
@SessionAttributes
public class LoginController {
	
	@Autowired
	@Qualifier("jdbcUserService")  // <-- this references the bean id
	public UserDetailsManager userDetailsManager;
	
	@Autowired
	private UserService us;
	
	@Autowired
	private MailRegister mr;
	
	@Autowired 
	private MailForgotPassword mfp; //add for the forgot the password 
	
	@Autowired 
	private UserDetailsService userDetailsSvc;
	
	public UserService getUs() {
		return us;
	}
	public void setUs(UserService us) {
		this.us = us;
	}
	public MailRegister getMr() {
		return mr;
	}
	public void setMr(MailRegister mr) {
		this.mr = mr;
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
	
	
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	/*
	 * when you register to fill up the form, the validation process is going
	 * 1. username to check the database  
	 */
	@RequestMapping(value="/registervalidation", method=RequestMethod.POST)
	@ResponseBody
	public int isUserExist(HttpServletRequest request){
		//get the front-end input of the user-name and then to check if database has this user-name!!
		String username = request.getParameter("userName"); 
		System.out.println(username);
		if(us.isUserExist(username)) {
			System.out.println("name existeddd...........................");
			return 1;
		}
		if(request.getParameter("email")!=null){ 
			String email = request.getParameter("email");
			System.out.println(email);
			if(us.isEmailExist(email)){
				System.out.println("email existedd...........................");
				return 1;
			}
		}
		return 0;
	}

	/*
	 * controller for the register process 
	 * click the button of register now:
	 * 1. add the new register user to the database
	 * 2. send the email to the user 
	 * 
	 */
	@RequestMapping(value="/confirmation", method=RequestMethod.POST)
	public ModelAndView process(@ModelAttribute("user") 
			User user, BindingResult result) throws Exception {
		UserInfo userInfo = mr.register(user);
		mr.sendMail(user.getUserName(), user.getEmail());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("confirmation");
		mav.addObject("userInfo", userInfo);
		return mav;
	}
	
	/*
	 * register user will get a link to active account, mapping to the MailRegister.java link
	 * user click the link in the email
	 * 1. change the enable to 1 on Database
	 * 2. change the web page to the home of 
	 */
	@RequestMapping(value="/activateAccount", method = RequestMethod.GET)
	public ModelAndView activeMail(HttpServletRequest request) {
		String username = request.getParameter("username");
		User user = us.findUserByUserName(username);
		String checkcode = request.getParameter("checkcode");
		ModelAndView mav = new ModelAndView();
		System.out.println(mr.md5(username).equals(checkcode));
		if(mr.md5(username).equals(checkcode)){
			int enabled = user.getEnabled();
			if(enabled==1){
				mav.setViewName("linkoutoftime");
				return mav;
			}
			mr.ActivateUser(username);
			mav.setViewName("active_confirm");
			mav.addObject("userName", username);
			return mav;
		}
		mav.setViewName("error");
		mav.addObject("content","invalid link");
		return mav;
		
	}
	
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	/*
	 * controller for the forgot password and recover account.
	 * trigger: receive the forgotpassword.jsp recover account button
	 * 1. send email
	 * 2. SPA: Please check your email to change password 
	 */
	
	@RequestMapping(value="/recoveraccountemail*", method=RequestMethod.GET)
	public ModelAndView recoverSendEmail2(HttpServletRequest request) {
		String email = request.getParameter("email");
		System.out.println(email);
		mfp.sendForgotPasswordMail(email);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("recoveraccountemail");
		return mav;
	}
	
	
	/*
	 * After click the link of the email: transfer the web page to the changepassword.html
	 * In the changepassword.html, click the button of the submit
	 * 1. change the password of the database for the user who own this email
	 * 2. change to the user home page.
	 */
	 @RequestMapping(value="/changepassword*", method=RequestMethod.GET)
	 public ModelAndView changePassword(HttpServletRequest request) throws Exception {
		 String email = request.getParameter("email");
		 System.out.println(email);
		 
		// String newPassword = request.getParameter("newpasswordconfirm");
		 User user = us.findUserByEmail(email);
		 //UserInfo userInfo = mfp.updateUserPassword(user, newPassword);
		 ModelAndView mav = new ModelAndView();
		 mav.setViewName("changepassword");
		 //mav.addObject("userInfo", userInfo);
		 mav.addObject("username", user.getUserName());
		 mav.addObject("email", user.getEmail());
		 return mav;
	 }
	
	 
	@RequestMapping(value="/change", method=RequestMethod.GET)
	public ModelAndView change(HttpServletRequest request) throws Exception {
		
		String email = request.getParameter("email");
		System.out.println("hello+++"+email);
		String newPassword = request.getParameter("newpasswordconfirm");
		System.out.println("Password++++"+newPassword);
		User user = us.findUserByEmail(email);
		UserInfo userInfo = mfp.updateUserPassword(user, newPassword);
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("changepassword");
		mav.addObject("userInfo", userInfo);
		
		mav.addObject("username", user.getUserName());
		return mav;
	}
	 
	 
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////
	/*
	 * Register user login again !!!!!
	 */
	@RequestMapping(value="login_auto", method = RequestMethod.POST)
	public String loginAuto(HttpServletRequest request) {
		String username = request.getParameter("j_username");
		
		//change user input password to MD5 match the database
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
	
	

	////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * Check if user is login by remember me cookie, refer
	 * org.springframework.security.authentication.AuthenticationTrustResolverImpl
	 */
	@SuppressWarnings("unused")
	private boolean isRememberMeAuthenticated() {

		Authentication authentication = 
                    SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null) {
			return false;
		}

		return RememberMeAuthenticationToken.class.isAssignableFrom(authentication.getClass());
	}
	
	/**
	 * save targetURL in session
	 */
	@SuppressWarnings("unused")
	private void setRememberMeTargetUrlToSession(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		if(session!=null){
			session.setAttribute("targetUrl", "/admin/update");
		}
	}

	/**
	 * get targetURL from session
	 */
	@SuppressWarnings("unused")
	private String getRememberMeTargetUrlFromSession(HttpServletRequest request){
		String targetUrl = "";
		HttpSession session = request.getSession(false);
		if(session!=null){
			targetUrl = session.getAttribute("targetUrl")==null?""
                             :session.getAttribute("targetUrl").toString();
		}
		return targetUrl;
	}

}
