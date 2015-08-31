package com.fdm.model.service;

import static  org.mockito.Mockito.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.fdm.model.ExtBook;
import com.fdm.model.SQLtoJSON;
import com.fdm.model.dbstorage.BookDAO;

public class JsonBuilderControllerTest {

	private JsonBuilderController jbc;
	@Mock private BookDAO mockbookdao;
	@Mock private SQLtoJSON mocksqltojson;

	@Mock private List<ExtBook> ls;
	
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
		jbc = new JsonBuilderController();
		jbc.setBookDAO(mockbookdao);
		jbc.setSqltojson(mocksqltojson);
	}

	@Test
	public void testAssemblerCallsGetBooksFromBookdao() throws SQLException {
		jbc.assembler();
		verify(mockbookdao).getAllBooks();
	}
	
	@Test
	public void testAssemblerCallsjsonConvertorFromSqltojson() throws SQLException {
		when(mockbookdao.getAllBooks()).thenReturn(ls);
		jbc.assembler();
		verify(mocksqltojson).jsonConvertor(ls);
	}
}