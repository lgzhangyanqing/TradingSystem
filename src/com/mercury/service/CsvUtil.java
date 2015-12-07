package com.mercury.service;

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

@Service
public class CsvUtil {
	public String csvPath;
	
	@Autowired
	private UserDao ud;
	@Autowired
	private StockDao sd;	
	
	public CsvUtil(){}
	public CsvUtil(String csvPath){
		this.csvPath = csvPath;
	}
	public String getCsvPath() {
		return csvPath;
	}
	public void setCsvPath(String csvPath) {
		this.csvPath = csvPath;
	}
	
	@Transactional
	public List<Transaction> parseCSV(String csvFile){
		List<Transaction> list = new ArrayList<Transaction>();
		try{
			FileReader fr = new FileReader(csvFile);
			CSVParser parser = new CSVParser(fr, CSVFormat.DEFAULT);
			List<CSVRecord> l = parser.getRecords();
			for (CSVRecord r:l){
				Transaction ts = new Transaction();
				ts.setUser(ud.findByUid(Integer.parseInt(r.get(0))));
				ts.setStock(sd.findBySid(Integer.parseInt(r.get(1))));
				ts.setAmount(Integer.parseInt(r.get(2)));
				ts.setPrice(new BigDecimal(r.get(3)));
				ts.setTs(Timestamp.valueOf(r.get(4)));
				list.add(ts);
			}
			fr.close();
			parser.close();
			
		}catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public void appendCSV(Transaction trans, String csvFile){
		try{
			FileWriter fw = new FileWriter(csvFile, true);			
			CSVPrinter cp = new CSVPrinter(fw, CSVFormat.DEFAULT);
			cp.printRecord((Object[]) trans.toString().split(","));
			fw.flush();
			fw.close();
			cp.close();			
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public void rewriteCSV(List<Transaction> trans, String csvFile){
		try{
			FileWriter fw = new FileWriter(csvFile);
			CSVPrinter cp = new CSVPrinter(fw, CSVFormat.DEFAULT);
			for (Transaction t: trans){
				cp.printRecord((Object[]) t.toString().split(","));
			}
			fw.flush();
			fw.close();
			cp.close();
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
}
