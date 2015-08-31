package com.fdm.model.dbstorage;

import static org.mockito.Mockito.*;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;

import com.fdm.model.ExtBook;
import com.fdm.model.dbstorage.LibrarySearchDAO;

public class LibrarySearchDAOTest {
	
	@Spy private LibrarySearchDAO lsdao;
	@Mock private List<ExtBook> mockls;
	@Mock private ExtBook mockbook;
	@Mock private DataSource mockds;
	@Mock private Connection mockconn;
	@Mock private CallableStatement mockcs;
	@Mock private ResultSet mockrs;
	
	@Before
	public void setUp() throws SQLException {
		MockitoAnnotations.initMocks(this);
		lsdao.setDataSource(mockds);
		lsdao.setLs(mockls);
		when(mockds.getConnection()).thenReturn(mockconn);
		when(mockconn.prepareCall("{call BOOK_SEARCH(?)}")).thenReturn(mockcs);
		when(mockcs.getObject(2)).thenReturn(mockrs);
	}

	@Test
	public void testBookSearchMethodCallsTheRequiredMethodsForExecutingStoredProcedures() throws SQLException {
		when(mockcs.executeQuery()).thenReturn(mockrs);
		lsdao.bookSearch("fictions");
		verify(mockcs).executeQuery();
	}
	
	@Test
	public void testBookSearchReturnsAuthorBorgesWhenthisAuthorisPassedIn() throws SQLException {
		when(mockcs.executeQuery()).thenReturn(mockrs);
		when(mockrs.next()).thenReturn(false);
		lsdao.bookSearch("fictions");
		verify(mockrs, never()).getString("isbn");
	}
	
	@Test
	public void testBookSearchReturnsISBN1234WhenthisISBNisPassedIn() throws SQLException {
		when(mockcs.executeQuery()).thenReturn(mockrs);
		when(mockrs.next()).thenReturn(true).thenReturn(false);
		when(lsdao.bookFactory()).thenReturn(mockbook);
		lsdao.bookSearch("fictions");
		verify(mockrs).getString("isbn");
		verify(mockls).add(mockbook);
	}
	
	@Test
	public void testCleanEmptiesTheListWhenItIsCalled() {
		lsdao.clean();
		verify(mockls).clear();
	}
	@Test
	public void testGetBookMethodCallsTheRequiredMethodsForExecutingStoredProcedures() throws SQLException {
		when(mockconn.prepareCall("{call GET_BOOK(?)}")).thenReturn(mockcs);
		when(mockcs.executeQuery()).thenReturn(mockrs);
		lsdao.getBook("fictions");
		verify(mockcs).executeQuery();
	}
	
	@Test
	public void testGetBookVerifiesGetStringIsNevercalledWhenRSNextIsFalse() throws SQLException {
		when(mockconn.prepareCall("{call GET_BOOK(?)}")).thenReturn(mockcs);
		when(mockcs.executeQuery()).thenReturn(mockrs);
		when(mockrs.next()).thenReturn(false);
		lsdao.getBook("fictions");
		verify(mockrs, never()).getString("isbn");
	}
	
	@Test
	public void testGetBookVerifiesGetStringIscalledWhenRSNextIsTrue() throws SQLException {
		when(mockconn.prepareCall("{call GET_BOOK(?)}")).thenReturn(mockcs);
		when(mockcs.executeQuery()).thenReturn(mockrs);
		when(mockcs.execute()).thenReturn(true);
		when(mockrs.next()).thenReturn(true).thenReturn(false);
		when(lsdao.bookFactory()).thenReturn(mockbook);
		lsdao.getBook("fictions");
		verify(mockrs).getString("isbn");
	}
	
	@Test
	public void testGetBookThrowsAnSQLException() throws SQLException {
		when(mockconn.prepareCall("{call GET_BOOK(?)}")).thenThrow(new SQLException());
		lsdao.getBook("fictions");
		verify(mockcs,never()).executeQuery();
	}
	@Test
	public void testBookSearchThrowsAnSQLException() throws SQLException {
		when(mockconn.prepareCall("{call BOOK_SEARCH(?)}")).thenThrow(new SQLException());
		lsdao.bookSearch("fictions");
		verify(mockcs,never()).executeQuery();
	}
	
}