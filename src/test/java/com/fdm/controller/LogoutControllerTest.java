package com.fdm.controller;

import static org.mockito.Mockito.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;

import com.fdm.model.service.BasketSessionController;

public class LogoutControllerTest {


	@Mock private HttpServletRequest mockreq;
	@Mock private HttpSession mocksession;
	@Mock private BasketSessionController mockbasketSessionController;
	@InjectMocks private LogoutController lc;

	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}

	@Test
	public void testLogoutCallsInvalidatefromHttpSession() {
		when(mockreq.getSession(false)).thenReturn(mocksession);
		when(mockreq.getSession()).thenReturn(mocksession);
		lc.logout(mockreq);
		verify(mocksession).invalidate();
	}

	@Test
	public void testLogoutNeverCallsInvalidatefromHttpSessionWhenSessionIsNull() {
		when(mockreq.getSession(false)).thenReturn(null);
		when(mockreq.getSession()).thenReturn(mocksession);
		lc.logout(mockreq);
		verify(mocksession, never()).invalidate();
	}

	@Test
	public void testLogoutCallsGetSessionfromHttpRequest() {
		when(mockreq.getSession(false)).thenReturn(mocksession);
		when(mockreq.getSession()).thenReturn(mocksession);
		lc.logout(mockreq);
		verify(mockreq, times(2)).getSession();
	}

	@Test
	public void testLogoutCallsPersistBasket() {
		when(mockreq.getSession(false)).thenReturn(mocksession);
		when(mockreq.getSession()).thenReturn(mocksession);
		lc.logout(mockreq);
		verify(mockbasketSessionController).persistBasket(mocksession);
	}


}
