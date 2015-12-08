package com.mercury.quartz;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;

import org.springframework.context.support.ClassPathXmlApplicationContext;

@SuppressWarnings("serial")
public class App extends HttpServlet{
	
	public static void main(String[] args) throws Exception {
		new ClassPathXmlApplicationContext("Spring-Quartz.xml");

	}
	
	/*
	public void init() throws ServletException{
		System.out.println("hahaha");
	}
	*/
}
