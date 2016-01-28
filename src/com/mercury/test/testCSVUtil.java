package com.mercury.test;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Controller;

import com.mercury.beans.Transaction;
import com.mercury.service.TransService;
public class testCSVUtil {
	
	
	public static void main(String[] args) throws IOException {
		
		generateCsvFile("WebContent/CSV/pending.csv");

      
	}
	 private static void generateCsvFile(String sFileName) throws IOException{
	   FileReader fr = new FileReader(sFileName);
	   List<Transaction> list = new ArrayList<Transaction>();
	   CSVParser parser = new CSVParser(fr, CSVFormat.DEFAULT);
		List<CSVRecord> l = parser.getRecords();
		System.out.println(l);
		fr.close();
		parser.close();
	    
	}
}
