package com.mercury.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import com.mercury.beans.Transaction;
import com.mercury.service.CsvUtil;

public class testCSV {

	@Test
	public void test() {
		List<Transaction> list =new CsvUtil().parseCSV();
		assertTrue(list.isEmpty());
	}

}
