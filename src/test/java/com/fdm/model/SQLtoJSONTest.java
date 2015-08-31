package com.fdm.model;

import static org.junit.Assert.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import org.junit.Before;
import org.junit.Test;

public class SQLtoJSONTest {
	
	List<ExtBook> sqlrsls;
	ExtBook book, book1, book2, book3;

	@Before
	public void setUp()  {
		sqlrsls = new ArrayList<ExtBook>();
		book = new ExtBook();
		book.setISBN("978-0-");
		book.setTitle("Great");
		book.setAuthor("Charles");
		book.setAbout("a young orphanup.");
		book.setCategory("Fiction");
		book.setPrice(new BigDecimal(4.79));
		book.setCopies(5);
		book.setPages(592);
		book.setPublisher("Penguin");
		sqlrsls.add(book);
		book1 = new ExtBook();
		book1.setISBN("19889-7");
		book1.setTitle("Expectations");
		book1.setAuthor("Dickens");
		book1.setAbout("Pip");
		book1.setCategory("Fiction");
		book1.setPrice(new BigDecimal(4.79));
		book1.setCopies(5);
		book1.setPages(592);
		book1.setPublisher("Dolphin");
		sqlrsls.add(book1);
		book2 = new ExtBook();
		book2.setISBN("1");
		book2.setTitle("Express");
		book2.setAuthor("Agatha");
		book2.setAbout("Murder on the Orient Express");
		book2.setCategory("Crime");
		book2.setPrice(new BigDecimal(4.11));
		book2.setCopies(6);
		book2.setPages(10);
		book2.setPublisher("HarperCollins");
		sqlrsls.add(book2);
	}

	@Test
	public void testJsonConvertorReturnsJsonStringWhenAMapWithASQLResultSetIsPassedIn() {
		SQLtoJSON sqL2json = new SQLtoJSON();
		assertEquals("[{\"label\" : \"Great\"},{\"label\" : \"Charles\"},{\"label\" : \"Expectations\"},{\"label\" : \"Dickens\"},{\"label\" : \"Express\"},{\"label\" : \"Agatha\"}];",sqL2json.jsonConvertor(sqlrsls));
		//assertEquals("[{\"label\" : \"Great\"},{\"label\" : \"Expectations\"},{\"label\" : \"Express\"}];", sqL2json.jsonConvertor(sqlrsls));
	}
	
	@Test
	public void testJsonConvertorReturnsJsonStringWithNoDuplicationsWhenAMapWithASQLResultSetIsPassedIn() {
		SQLtoJSON sqL2json = new SQLtoJSON();
		book3 = new ExtBook();
		book3.setISBN("1");
		book3.setTitle("Express");
		book3.setAuthor("Agatha");
		book3.setAbout("Murder on the Orient Express");

		sqlrsls.add(book3);
		assertEquals("[{\"label\" : \"Great\"},{\"label\" : \"Charles\"},{\"label\" : \"Expectations\"},{\"label\" : \"Dickens\"},{\"label\" : \"Express\"},{\"label\" : \"Agatha\"},{\"label\" : \"Express\"}];",sqL2json.jsonConvertor(sqlrsls));
	}
}