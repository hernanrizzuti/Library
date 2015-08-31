package com.fdm.controller;

import static org.mockito.Mockito.*;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;
import org.springframework.ui.ModelMap;

import com.fdm.model.dbstorage.LibrarySearchDAO;

public class BookDetailsTest {
	
	@Mock private LibrarySearchDAO mocklsdao;
	@Mock private  ModelMap mockmodelMap;
	@Mock private HttpServletRequest mockreq;
	@Mock private HttpSession mocksession;
	@InjectMocks @Spy private BookDetails bookDetails;
	
	@Before
	public void setUp() throws Exception {
		MockitoAnnotations.initMocks(this);
	}

	@Test
	public void testGetBookNameVerifiesStorageDotGetIsCalled() throws SQLException {
		when(mockreq.getSession()).thenReturn(mocksession);
		bookDetails.getBookName("crows", mockmodelMap, mockreq);
		verify(mocklsdao).getBook("crows");
	}
	
	@Test
	public void testGetBookNameNeverStorageDotGetwhenSQLExceptionisThrown() throws SQLException {
		when(mocklsdao.getBook("crows")).thenThrow(new SQLException());
		bookDetails.getBookName("crows", mockmodelMap, mockreq);
		verify(mockreq, never()).getSession();
	}
	
	
	
	

}
