package com.mercury.quartz;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.Scheduled;

import com.mercury.service.TransService;
/*
@ComponentScan*/
public class MyTask {

	 @Autowired
	 private TransService ts;
	  
	@Scheduled(fixedRate=60000)
	 public void printCurrentTime() {  
		  // printing current system time  
		  System.out.println("Current Time : " + Calendar.getInstance().getTime());  
		  List<Integer> tranList = new ArrayList<>();
			FileReader fr;
			try {
				fr = new FileReader("C:\\Users\\royce\\git\\TradingSystem\\WebContent\\CSV\\pending.csv");
			
			 BufferedReader br = new BufferedReader (fr);
			 String s = null;
			 int count = 0;
				while((s=br.readLine())!=null){
					System.out.println(s);
					tranList.add(count);
					 count++;
				 }
			} catch (NumberFormatException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 ts.commitPendings(tranList);

		 }
	
}
