package com.fdm.model.dbstorage;

import static org.mockito.Matchers.anyString;
import static org.mockito.Mockito.*;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;
import com.fdm.model.Columns;
import com.fdm.model.ExtBook;

public class BookDAOTest {
	@Spy private BookDAO bookdao;
	@Mock private BookDAO mockbookdao;
	@Mock private ExtBook mockbook;
	@Mock private DataSource mockds;
	@Mock private Connection mockconn;
	@Mock private PreparedStatement mockps;
	@Mock private CallableStatement mockcs;
	@Mock private ResultSet mockrs;
	@Mock private List mockls;

	@Before
	public void setUp() throws SQLException {
		MockitoAnnotations.initMocks(this);
		bookdao.setDataSource(mockds);
		when(mockds.getConnection()).thenReturn(mockconn);
		when(mockconn.prepareStatement("{call ADD_BOOK(?,?,?,?,?,?,?,?,?,?,?)}")).thenReturn(mockps);
	}

	@Test
	public void testaddMethodCallsTheRequiredMethodsForExecutingStoredProcedures() throws SQLException {
		bookdao.addBook(mockbook);
		verify(mockps).executeUpdate();
	}

	@Test
	public void testGetverifiesthatExecuteQueryMethodIsCalled() throws SQLException{
		String sql = "SELECT name FROM authors";
		when(mockconn.prepareStatement(sql)).thenReturn(mockps);
		when(mockps.executeQuery()).thenReturn(mockrs);
		bookdao.get(sql);
		verify(mockps).executeQuery();
	}

	@Test
	public void testGetverifiesthatListAddMethodIsCalled() throws SQLException{
		String sql = "SELECT name FROM authors";
		when(mockconn.prepareStatement(sql)).thenReturn(mockps);
		when(mockps.executeQuery()).thenReturn(mockrs);
		when(bookdao.getList()).thenReturn(mockls);
		when(mockrs.next()).thenReturn(true).thenReturn(false);
		bookdao.get(sql);
		verify(mockls).add(anyString());
	}

	@Test
	public void testGetverifiesthatNeverListAddMethodIsCalled() throws SQLException{
		String sql = "SELECT name FROM authors";
		when(mockconn.prepareStatement(sql)).thenReturn(mockps);
		when(mockps.executeQuery()).thenReturn(mockrs);
		when(bookdao.getList()).thenReturn(mockls);
		when(mockrs.next()).thenReturn(false);
		bookdao.get(sql);
		verify(mockls, never()).add(anyString());
	}

	@Test
	public void testGetResultlsverifiesGetIsCalledWhenAUTHORisPassedIn() throws SQLException{
		String sql = "SELECT name FROM authors";
		when(mockconn.prepareStatement(sql)).thenReturn(mockps);
		when(mockps.executeQuery()).thenReturn(mockrs);
		when(bookdao.getList()).thenReturn(mockls);
		bookdao.resultFactory(Columns.AUTHOR);
		verify(bookdao).get(sql);
	}

	@Test
	public void testGetResultlsverifiesGetIsCalledWhenCATEGORIESisPassedIn() throws SQLException{
		String sql = "SELECT name FROM categories";
		when(mockconn.prepareStatement(sql)).thenReturn(mockps);
		when(mockps.executeQuery()).thenReturn(mockrs);
		when(bookdao.getList()).thenReturn(mockls);
		bookdao.resultFactory(Columns.CATEGORIES);
		verify(bookdao).get(sql);
	}

	@Test
	public void testGetResultlsverifiesGetIsCalledWhenPUBLISHERSisPassedIn() throws SQLException{
		String sql = "SELECT name FROM publishers";
		when(mockconn.prepareStatement(sql)).thenReturn(mockps);
		when(mockps.executeQuery()).thenReturn(mockrs);
		when(bookdao.getList()).thenReturn(mockls);
		bookdao.resultFactory(Columns.PUBLISHER);
		verify(bookdao).get(sql);
	}

	@Test
	public void testGetBookStockVerifiesThatExecutesMethodIsCalled() throws SQLException{
		when(mockconn.prepareCall("{call GET_BOOK_STOCK()}")).thenReturn(mockcs);
		when(mockcs.executeQuery()).thenReturn(mockrs);
		bookdao.getBookStock();
		verify(mockcs).executeQuery();	
	}

	@Test
	public void testGetBookStockVerifiesThatGetIntReturnAnMethodIsCalled() throws SQLException{
		when(mockconn.prepareCall("{call GET_BOOK_STOCK()}")).thenReturn(mockcs);
		when(mockcs.executeQuery()).thenReturn(mockrs);
		when(mockrs.next()).thenReturn(true).thenReturn(false);
		bookdao.getBookStock();
		verify(mockrs).getInt("copies");
	}

	@Test
	public void testGetBookStockVerifiesThatGoToTheCatchWhenrsIsNull() throws SQLException{
		when(mockconn.prepareCall("{call GET_BOOK_STOCK()}")).thenReturn(mockcs);
		when(mockcs.executeQuery()).thenReturn(mockrs);
		when(mockrs.getInt("copies")).thenReturn(30);
		bookdao.getBookStock();
		verify(mockconn).close();
	}
	
	@Test
	public void testGetBooksVerifiesThatExecutesMethodIsCalled() throws SQLException{
		when(mockconn.prepareCall("{call GET_BOOKS()}")).thenReturn(mockcs);
		when(mockcs.executeQuery()).thenReturn(mockrs);
		bookdao.getAllBooks();
		verify(mockcs).executeQuery();	
	}
	
	@Test
	public void testGetBooksVerifiesThatGoToTheCatchWhenrsIsNull() throws SQLException{
		when(mockconn.prepareCall("{call GET_BOOKS()}")).thenReturn(mockcs);
		when(mockcs.executeQuery()).thenReturn(mockrs);
		when(mockrs.next()).thenReturn(true).thenReturn(false);
		bookdao.getAllBooks();
		verify(mockconn).close();
	}
	
	@Test
	public void testGetBooksVerifiesThatallgetMethodsareAnMethodIsCalled() throws SQLException{
		when(mockconn.prepareCall("{call GET_BOOKS()}")).thenReturn(mockcs);
		when(mockcs.executeQuery()).thenReturn(mockrs);
		when(mockrs.next()).thenReturn(true).thenReturn(false);
		bookdao.getAllBooks();
		verify(mockrs).getString("isbn");
		verify(mockrs).getString("title");
		verify(mockrs).getString("author");		
		verify(mockrs).getString("category");
		verify(mockrs).getBigDecimal("price");
		verify(mockrs).getInt("pages");
		verify(mockrs).getString("publisher");
	}
	
	@Test
	public void testGetTitleAndCopiesverifiesthatRSGetStringAndRSGetIntAreCalled() throws SQLException{
		when(mockconn.prepareCall("{call GET_BOOK_STOCK_BY_TITLE_COPY()}")).thenReturn(mockcs);
		when(mockcs.executeQuery()).thenReturn(mockrs);
		when(mockrs.next()).thenReturn(true).thenReturn(false);
		bookdao.getTitleAndCopies();
		verify(mockrs).getString("title");
		verify(mockrs).getInt("book_copies_num");
	}
	
	@Test
	public void testGetTitleAndCopiesverifiesthatgetHashMapIsCalled() throws SQLException{
		when(mockconn.prepareCall("{call GET_BOOK_STOCK_BY_TITLE_COPY()}")).thenReturn(mockcs);
		when(mockcs.executeQuery()).thenReturn(mockrs);
		when(mockrs.getString("title")).thenReturn(null);
		when(mockcs.getObject(1)).thenReturn(mockrs);
		when(mockrs.next()).thenReturn(true).thenReturn(false);
		bookdao.getTitleAndCopies();
		verify(bookdao).getHashMap();
	}
	
	@Test
	public void testGetTitlesCallsgetDoubleAndClose() throws SQLException{
		when(mockconn.prepareStatement("SELECT price FROM books WHERE title = ?")).thenReturn(mockps);
		when(mockps.executeQuery()).thenReturn(mockrs);
		when(mockrs.next()).thenReturn(true);
		bookdao.getBookPrice("Fictions");
		verify(mockrs).getBigDecimal("price");
		verify(mockconn).close();
	}
	
	
	
	
}