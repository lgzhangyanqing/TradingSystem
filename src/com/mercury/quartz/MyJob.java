package com.mercury.quartz;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.mercury.service.TransService;

public class MyJob extends QuartzJobBean {  
	  
	 private MyTask myTask;  
	
	 public void setMyTask(MyTask myTask) {  
	  this.myTask = myTask;  
	 }  
	  
	 @Override  
	 protected void executeInternal(JobExecutionContext arg0)  
	   throws JobExecutionException {  
	  // TODO Auto-generated method stub  
	  myTask.printCurrentTime();  
	 
	 }  

}
