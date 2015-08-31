package com.fdm.controller;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.mockito.Mockito.doReturn;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;
import org.springframework.ui.ModelMap;

import com.fdm.model.validation.RegisterValidation;
import com.fdm.model.User;
import com.fdm.model.dbstorage.UserDAO;
import com.fdm.model.service.UserFactory;

public class RegistrationTest {
	
	@Mock private ModelMap mockmodelmap;
	@Mock private HttpServletRequest mockreq;
	@Mock private User mockuser;
	@Mock private UserFactory mockuserFactory;
	@Mock private UserDAO mockuserdao;
	@Mock private RegisterValidation mockregValidation;
	@InjectMocks private Registration reg;
		
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}

	@Test
	public void testRegistrationFormVerifiesthatAddAttributeIscalled() {
		assertNotNull(reg.registrationForm());
	}

	@Test
	public void testUserFactoryReturnsASetUser(){
		when(mockreq.getParameter("title")).thenReturn("1");
		when(mockuserFactory.parseTitle("1")).thenReturn(1);
		assertNull(mockuserFactory.createUser(mockuser, mockreq));
	}
	
	@Test
	public void testRegisterSubmissionVerifiesthatSetAttributeIscalled() throws SQLException {
		when(mockregValidation.userDetailsAreValid(mockreq)).thenReturn(true);
		when(mockreq.getParameter("title")).thenReturn("1");
		when(mockuserFactory.parseTitle("1")).thenReturn(1);
		doReturn(mockuser).when(mockuserFactory).createUser(mockuser,mockreq);
		reg.registerSubmission(mockreq);
		verify(mockreq).setAttribute("user", mockuser);
	}
	
	@Test
	public void testRegisterSubmissionVerifiesthatSetAttributeIsNevercalled() throws SQLException {
		when(mockregValidation.userDetailsAreValid(mockreq)).thenReturn(false);
		reg.registerSubmission(mockreq);
		verify(mockreq, never()).setAttribute("user", mockuser);
	}
	
	@Test
	public void testRegisterSubmissionVerifiesthatSetAttributeIsNeverCalled() {
		when(mockreq.getParameter("title")).thenReturn("1");
		when(mockuserFactory.parseTitle("1")).thenReturn(1);
		doReturn(mockuser).when(mockuserFactory).createUser(mockuser,mockreq);
		reg.registerSubmission(mockreq);
		verify(mockreq, never()).setAttribute("error", "error");
	}
	
	@Test
	public void testRegisterSubmissionVerifiesthatErrorSetAttributeIsCalledOnce() throws SQLException {
		/*when(mockreq.getParameter("title")).thenReturn("1");
		when(mockuserFactory.parseTitle("1")).thenReturn(1);
		doReturn(mockuser).when(mockuserFactory).createUser(mockuser,mockreq);*/
		when(mockregValidation.userDetailsAreValid(mockreq)).thenThrow(new SQLException());
		reg.registerSubmission(mockreq);
		verify(mockreq).setAttribute("error", "Oops Something went wrong :-(."
					+ " So unfortunatelly we couldn't subscribe you this"
					+ " time, please try again later.");
	}
	
	@Test
	public void testRegisterSubmissionVerifiesthatSetAttributeIsNeverCalledWhenSQLExceptionIsThrown() throws SQLException {
		when(mockreq.getParameter("title")).thenReturn("1");
		when(mockuserFactory.parseTitle("1")).thenReturn(1);
		doReturn(mockuser).when(mockuserFactory).createUser(mockuser,mockreq);
		doThrow(new SQLException()).when(mockuserdao).addUser(mockuser);
		reg.registerSubmission(mockreq);
		verify(mockreq, never()).setAttribute("error", mockuser);
	}

}
