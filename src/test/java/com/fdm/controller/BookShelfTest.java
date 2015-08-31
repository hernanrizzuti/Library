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

import com.fdm.model.dbstorage.BookDAO;
import com.fdm.model.service.JsonBuilderController;

public class BookShelfTest {
	
	@Mock private BookDAO mockbookdao;
	@Mock private HttpServletRequest mockreq;
	@Mock private HttpSession mocksession;
	@Mock private JsonBuilderController mockjsonbuildercontroller;
	@InjectMocks @Spy private BookShelf bookShelf;

	@Before
	public void setUp() throws Exception {
		MockitoAnnotations.initMocks(this);
	}

	@Test
	public void testGetBookShelfVerifiesGetAllIscalled() throws SQLException {
		when(mockreq.getSession()).thenReturn(mocksession);
		bookShelf.getBookShelf(mockreq);
		verify(mockbookdao).getTitleAndCopies();
	}
	
	@Test
	public void testGetBookShelfVerifiesGetAttributeIscalledTwice() throws SQLException {
		when(mocksession.getAttribute("countTitleCopies")).thenReturn(1);
		when(mockreq.getSession()).thenReturn(mocksession);
		bookShelf.getBookShelf(mockreq);
		verify(mocksession, times(2)).getAttribute("countTitleCopies");
	}

}
