package com.fdm.controller;

import static org.mockito.Mockito.*;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;
import com.fdm.model.ExtBook;
import com.fdm.model.dbstorage.LibrarySearchDAO;

public class BookSearchTest {

	@Mock private HttpServletRequest mockreq;
	@Mock private LibrarySearchDAO mockls;
	@Mock private List<ExtBook> mockbooklist;
	@InjectMocks @Spy private BookSearch bs;
	@Mock private ExtBook mockbook;
	
	@Before
	public void setUp(){
		MockitoAnnotations.initMocks(this);
	}

	@Test
	public void testBookSearchVerifiesGetFromStorageWasCalled() throws SQLException{
		when(bs.getCriteria(mockreq)).thenReturn("Lord of the Rings");
		//when(mockls.searchBook("Lord of the Rings")).thenReturn(booklist);
		bs.searchBox(mockreq);
		verify(mockls).bookSearch("Lord of the Rings");
	}
	
	@Test
	public void testBookSearchVerifiessetAttributeFromReqWasCalled() throws SQLException{
		when(bs.getCriteria(mockreq)).thenReturn("Lord of the Rings");
		when(mockbooklist.size()).thenReturn(2);
		when(mockls.bookSearch("Lord of the Rings")).thenReturn(mockbooklist);
		bs.searchBox(mockreq);
		verify(mockreq).setAttribute("result", mockbooklist);
		verify(mockls).clean();

	}
	@Test
	public void testBookSearchVerifiesSetAttributeFromReqWasneverCalled() throws SQLException{
		when(bs.getCriteria(mockreq)).thenReturn("");
		when(mockls.bookSearch("")).thenReturn(mockbooklist);
		bs.searchBox(mockreq);
		verify(mockreq, never()).setAttribute("result", mockbooklist);
	}
	
	@Test
	public void testBookSearchcallsBookGetTitleWhenListSizeIsEqualTo1() throws SQLException{
		when(bs.getCriteria(mockreq)).thenReturn("Lord of the Rings");
		when(mockbooklist.size()).thenReturn(1);
		when(mockls.bookSearch("Lord of the Rings")).thenReturn(mockbooklist);
		when(mockbooklist.get(0)).thenReturn(mockbook);
		bs.searchBox(mockreq);
		verify(mockbooklist).get(0);
		verify(mockbook).getTitle();
	}
	
	@Test
	public void testBookSearchThrowsAnSQLException() throws SQLException{
		when(bs.getCriteria(mockreq)).thenReturn("Lord of the Rings");
		doThrow(new SQLException()).when(mockls).bookSearch("Lord of the Rings");
		bs.searchBox(mockreq);
		verify(mockbooklist,never()).size();
	}
	
	
}