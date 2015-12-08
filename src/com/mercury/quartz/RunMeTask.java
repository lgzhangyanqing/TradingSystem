package com.mercury.quartz;
import java.io.*;
/*import com.opencsv.CSVReader;*/
import com.mercury.controllers.*;
import java.util.*;
import java.sql.*; 

import java.io.FileReader;
import java.io.FileWriter;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVPrinter;
import org.apache.commons.csv.CSVRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mercury.beans.Transaction;
import com.mercury.dao.StockDao;
import com.mercury.dao.UserDao;

public class RunMeTask {
	/*
	public void printMeEvery5Sec() {
		System.out.println("This message pop up every 5 secs ~");
	}
	*/
	 public void printMeEvery5Sec()throws Exception{
		 System.out.println("This message pop up every 5 secs ~");
		 /*
         // Create Connection objects 
         Class.forName ("oracle.jdbc.OracleDriver"); 
         Connection conn = DriverManager.getConnection("jdbc:oracle:thin:hanproject/123@localhost:1521:xe");
         PreparedStatement sql_statement = null;
         // Create the insert statement 
         String jdbc_insert_sql = "INSERT INTO YFTS_TRANS"
                         + "(TRANS_ID, USER_ID, STOCK_ID, AMOUNT, PRICE, TRANS_TIME) VALUES"
                         + "(?,?,?,?,?,?)";
         sql_statement = conn.prepareStatement(jdbc_insert_sql);
         // Read CSV file in OpenCSV 
         String inputCSVFile = "C:\\Training\\Han-Project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\TradingSystem\\CSV\\sample.csv";
         //CSVReader reader = new CSVReader(new FileReader(inputCSVFile));
         try {
             
        	 CSVReader reader = new CSVReader(new FileReader(inputCSVFile));
        	 // Variables to loop through the CSV File 
             String [] nextLine; // for every line in the file //            
             int lnNum = 0; // line number 
             while ((nextLine = reader.readNext()) != null) {
                     lnNum++;
                     // Bind CSV file input to table columns //
                     //sql_statement.setString(1, nextLine[0]);
                     sql_statement.setInt(1, Integer.parseInt(nextLine[0]));
                     // Bind Age as double //
                     // Need to convert string to double here 
                     sql_statement.setDouble(2,Double.parseDouble(nextLine[1]));
                     // execute the insert statement 
                     sql_statement.executeUpdate();
             }  
  
         } catch (Exception e) {
        	 System.out.println("Error, cant find CSV file!");
         }
         
                      
         // Close prepared statement 
         sql_statement.close();
         // COMMIT transaction 
         conn.commit();
         // Close connection 
         conn.close();
         */
		 /*
		 //System.out.println(context.getRealPath("CSV"));
		 List<Transaction> list = new ArrayList<Transaction>();
		 CsvUtil csvUtil = new CsvUtil();
		 list = csvUtil.parseCSV("C:\\Training\\Han-Project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\TradingSystem\\CSV\\pending.csv");
		 System.out.println("1233333333");
		 TransService trans = new TransService();
		 int length = list.size();
		 List<Integer> indexList = new ArrayList<Integer>();
		 for(int i = 1;i<=length;i++){
			 indexList.add(i);
		 }
		 trans.commitPendings(indexList, "C:\\Training\\Han-Project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\TradingSystem\\CSV\\pending.csv");
 		 */
 }
}
