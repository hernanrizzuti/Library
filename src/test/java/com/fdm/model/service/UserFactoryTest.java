package com.fdm.model.service;

import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.*;

import javax.servlet.http.HttpServletRequest;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;

import com.fdm.model.User;

public class UserFactoryTest {
	@Mock private HttpServletRequest mockreq;
	@Mock private User mockuser;
	@Spy private UserFactory spyfactory;
	
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}

	@Test
	public void testCreateUserReturnANewWhenItIsCalled() {
		when(mockreq.getParameter("title")).thenReturn("1");
		when(spyfactory.parseTitle("1")).thenReturn(1);
		assertNotNull(spyfactory.createUser(mockuser, mockreq));
	}
}
