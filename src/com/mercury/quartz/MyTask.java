package com.mercury.quartz;

import java.util.Calendar;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.Scheduled;
/*
@ComponentScan*/
public class MyTask {
	@Scheduled(fixedRate=1000)
	 public void printCurrentTime() {  
		  // printing current system time  
		  System.out.println("Current Time : " + Calendar.getInstance().getTime());  
		 }  
}
