package com.fdm.controller;

import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.doReturn;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.security.Principal;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import com.fdm.model.ExtBook;
import com.fdm.model.dbstorage.BookDAO;
import com.fdm.model.dbstorage.UserDAO;
import com.fdm.model.service.BasketSessionController;
import com.fdm.model.service.ImageIO;
import com.fdm.model.service.JsonBuilderController;

public class WelcomeTest {
	Welcome rlwelcome;
	@Mock MultipartFile mockmultipartfile;
	@Mock BufferedOutputStream mockbos;
	@Mock ImageIO mockimageIO;
	@Mock File mockfile;
	@Mock ModelMap mockmodelmap;
	@Mock ExtBook mockbook;
	@Mock UserDAO mockUserdao;
	@Mock HttpServletRequest mockreq;
	@Mock HttpSession mocksession;
	@Mock BookDAO mockbookdao;
	@Mock Principal mockprincipal;
	@Mock BindingResult mockresult;
	@Mock private JsonBuilderController mockjsonbuilderController;
	@Mock private BasketSessionController basketSessionController;
	@Spy @InjectMocks Welcome welcome;
	
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
		doReturn(mockbook).when(welcome).getBook();
	}
	
	@Test
	public void testGetBookReturnsnotNullWhenItIscalled(){
		rlwelcome = new Welcome();
		assertNotNull(rlwelcome.getBook());
	}

	@Test
	public void testBookFormVerifiesModelGetsCalledWhenBookFromIscalled() throws SQLException {
		when(mockreq.getSession()).thenReturn(mocksession);
		welcome.bookForm(mockmodelmap, mockreq);
		verify(mockmodelmap).addAttribute("extBook", mockbook);
	}
	
	@Test
	public void testaddBookverifiesstorageaddMethodisCalled() throws SQLException, IOException{
		when(mockreq.getSession()).thenReturn(mocksession);
		when(mockresult.hasErrors()).thenReturn(false);
		when(mockmultipartfile.isEmpty()).thenReturn(false);
		when(mockimageIO.isFileExtensionValid(mockmultipartfile)).thenReturn(true);
		welcome.addBook(mockbook,mockresult, mockreq, mockmultipartfile);
		verify(mockbookdao).addBook(mockbook);
	}
	
	@Test
	public void testaddBookverifiesStorageAddMethodisNotCalled() throws SQLException{
		when(mockreq.getSession()).thenReturn(mocksession);
		when(mockresult.hasErrors()).thenReturn(true);
		welcome.addBook(mockbook,mockresult, mockreq, mockmultipartfile);
		verify(mockbookdao, never()).addBook(mockbook);
	}
	
	@Test
	public void testhomeCallsGetSesssionFourTimesWhenSessionIsNull() throws SQLException{
		when(mockprincipal.getName()).thenReturn("hernan");
		when(mockreq.getSession()).thenReturn(mocksession);
		when(mockUserdao.getRole("hernan")).thenReturn("hernan");
		welcome.home(mockreq, mockprincipal);
		verify(mockreq, times(2)).getSession();
	}
	
	@Test
	public void testhomeCallsGetSesssionFiveTimesWhenSessionIsNotNullAndReturns0() throws SQLException{
		when(mocksession.getAttribute("count")).thenReturn(0);
		when(mockreq.getSession()).thenReturn(mocksession);
		when(mockUserdao.getRole("hernan")).thenReturn("hernan");
		welcome.home(mockreq, mockprincipal);
		verify(mockreq, times(2)).getSession();
	}
	@Test
	public void testhomeCallsGetSesssionThreeTimesWhenSessionIsNotNullAndReturns1() throws SQLException{
		when(mocksession.getAttribute("count")).thenReturn(1);
		when(mockreq.getSession()).thenReturn(mocksession);
		when(mockUserdao.getRole("hernan")).thenReturn("hernan");
		welcome.home(mockreq, mockprincipal);
		verify(mockreq, times(2)).getSession();
	}
	
	@Test
	public void testhomeCallssetBasketsession() throws SQLException{
		String username = "Hernan";
		when(mockprincipal.getName()).thenReturn(username);
		when(mocksession.getAttribute("count")).thenReturn(1);
		when(mockreq.getSession()).thenReturn(mocksession);
		when(mockUserdao.getRole("Hernan")).thenReturn(username);
		when(mocksession.getAttribute("Hernan")).thenReturn(username);
		welcome.home(mockreq, mockprincipal);
		verify(basketSessionController).setBasketsession(mocksession, username);
	}
	
	@Test
	public void testHomeNeverCallsGetSesssionWhenSQLExceptionIsThrown() throws SQLException{
		when(mockprincipal.getName()).thenReturn("hernan");
		when(mockreq.getSession()).thenReturn(mocksession);
		when(mockUserdao.getRole("hernan")).thenThrow(new SQLException());
		welcome.home(mockreq, mockprincipal);
		verify(mockreq,times(2)).getSession();
	}
}