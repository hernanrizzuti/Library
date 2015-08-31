package com.fdm.model.validation;

import static org.junit.Assert.*;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import static org.mockito.Mockito.*;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.fdm.model.validation.UserValidator;

public class RegisterValidationTest {
	@Mock private UserValidator mockuserval;
	@Mock private HttpServletRequest mockreq;
	@Mock private RegisterValidation mockregval;
	private RegisterValidation regval;
	
	@Before
	public void setUp(){
		MockitoAnnotations.initMocks(this);
		regval = new RegisterValidation();
		regval.setUserval(mockuserval);
	}

	@Test
	public void testEmailIsValidReturnsTrueWhenTheEmailAddressIsCorrectAndFalseWhenItIsIncorrect() {
		when(mockreq.getParameter("email")).thenReturn("hernanrizzuti@gmail.com");
		when(mockuserval.isEmailValid("hernanrizzuti@gmail.com")).thenReturn(true);
		assertTrue(regval.emailIsValid(mockreq));
		
		when(mockreq.getParameter("email")).thenReturn("hernanrizzuti");
		when(mockuserval.isEmailValid("hernanrizzuti")).thenReturn(false);
		assertFalse(regval.emailIsValid(mockreq));
	}
	
	@Test
	public void testEmailIsValidReturnsFalseWhenTheFieldEmpty() throws SQLException {
		when(mockreq.getParameter("email")).thenReturn("");
		when(mockuserval.isEmailValid("")).thenReturn(false);
		when(mockregval.isEmpty("")).thenReturn(true);
		assertFalse(regval.emailIsValid(mockreq));
	}
	
	@Test
	public void testUsernameIsValidReturnsTrueWhenTheUsernameIsValidAndDoesnotExistInTheDB() throws SQLException {
		when(mockreq.getParameter("username")).thenReturn("hernan.rizzuti");
		when(mockuserval.isUsernameValid("hernan.rizzuti")).thenReturn(true);
		when(mockuserval.usernameExist("hernan.rizzuti")).thenReturn(false);
		assertTrue(regval.usernameIsValid(mockreq));
	}
	
	@Test
	public void testUsernameIsValidReturnsFalseWhenTheFieldEmpty() throws SQLException {
		when(mockreq.getParameter("username")).thenReturn("");
		when(mockuserval.isUsernameValid("")).thenReturn(true);
		when(mockuserval.usernameExist("")).thenReturn(false);
		when(mockregval.isEmpty("")).thenReturn(true);
		assertFalse(regval.usernameIsValid(mockreq));
	}
	
	@Test
	public void testUsernameIsValidReturnsFalseWhenTheUsernameIsValidAndDoesExistInTheDB() throws SQLException {
		when(mockreq.getParameter("username")).thenReturn("hernan.rizzuti");
		when(mockuserval.isUsernameValid("hernan.rizzuti")).thenReturn(true);
		when(mockuserval.usernameExist("hernan.rizzuti")).thenReturn(true);
		assertFalse(regval.usernameIsValid(mockreq));
	}
	
	@Test
	public void testUsernameIsValidReturnsFalseWhenTheUsernameIsNotValidAndDoesNotExistInTheDB() throws SQLException {
		when(mockreq.getParameter("username")).thenReturn("hernan.rizzuti");
		when(mockuserval.isUsernameValid("hernan.rizzuti")).thenReturn(false);
		when(mockuserval.usernameExist("hernan.rizzuti")).thenReturn(false);
		assertFalse(regval.usernameIsValid(mockreq));
	}
	
	@Test
	public void testPasswordIsValidReturnsTrueWhenThePasswordIsValidAndDoesMatchConfirmPassword()  {
		when(mockreq.getParameter("password")).thenReturn("Hernan123");
		when(mockreq.getParameter("confirmPassword")).thenReturn("Hernan123");
		when(mockuserval.isPasswordValid("Hernan123")).thenReturn(true);
		when(mockuserval.doPasswordsMatch("Hernan123", "Hernan123")).thenReturn(true);
		assertTrue(regval.passwordIsValid(mockreq));
	}
	
	@Test
	public void testPasswordIsValidReturnsFalseWhenTheFieldEmpty() throws SQLException {
		when(mockreq.getParameter("password")).thenReturn("");
		when(mockreq.getParameter("confirmPassword")).thenReturn("");
		when(mockuserval.isPasswordValid("")).thenReturn(true);
		when(mockuserval.doPasswordsMatch("", "")).thenReturn(true);
		when(mockregval.isEmpty("")).thenReturn(true);
		assertFalse(regval.passwordIsValid(mockreq));
	}
	
	@Test
	public void testPasswordIsValidReturnsFalseWhenThePasswordIsValidAndDoesNotMatchConfirmPassword() {
		when(mockreq.getParameter("password")).thenReturn("Hernan123");
		when(mockreq.getParameter("confirmPassword")).thenReturn("Hernan12");
		when(mockuserval.isPasswordValid("Hernan123")).thenReturn(true);
		when(mockuserval.doPasswordsMatch("Hernan123", "Hernan12")).thenReturn(false);
		assertFalse(regval.passwordIsValid(mockreq));
	}
	
	@Test
	public void testPasswordIsValidReturnsFalseWhenThePasswordIsInvalidAndDoesMatchConfirmPassword() {
		when(mockreq.getParameter("password")).thenReturn("Hernan123");
		when(mockreq.getParameter("confirmPassword")).thenReturn("Hernan12");
		when(mockuserval.isPasswordValid("Hernan123")).thenReturn(false);
		when(mockuserval.doPasswordsMatch("Hernan123", "Hernan123")).thenReturn(true);
		assertFalse(regval.passwordIsValid(mockreq));
	}
	
	@Test
	public void testFullNameIsValidReturnsTrueWhenThefullnameIsValid() {
		when(mockreq.getParameter("firstName")).thenReturn("Hernan");
		when(mockreq.getParameter("lastName")).thenReturn("Rizzuti");
		when(mockuserval.isFullNameValid("Hernan Rizzuti")).thenReturn(true);
		assertTrue(regval.fullnameisValid(mockreq));
	}
	
	@Test
	public void testFullNameIsValidReturnsFalseWhenTheFieldEmpty() {
		when(mockreq.getParameter("firstName")).thenReturn("");
		when(mockreq.getParameter("lastName")).thenReturn("");
		when(mockuserval.isFullNameValid("")).thenReturn(true);
		when(mockregval.isEmpty("")).thenReturn(true);
		assertFalse(regval.fullnameisValid(mockreq));
	}
	
	@Test
	public void testFullNameIsValidReturnsFalseWhenThefullnameIsInvalid() {
		when(mockreq.getParameter("firstName")).thenReturn("Hernan");
		when(mockreq.getParameter("lastName")).thenReturn("Rizzuti");
		when(mockuserval.isFullNameValid("Hernan Rizzuti")).thenReturn(false);
		assertFalse(regval.fullnameisValid(mockreq));
	}
	
	@Test
	public void testuserDetailsAreValidReturnsTrueWhenAllUserDetailsAreValid() throws SQLException {
		when(mockreq.getParameter("username")).thenReturn("hernan.rizzuti");
		when(mockuserval.isUsernameValid("hernan.rizzuti")).thenReturn(true);
		when(mockuserval.usernameExist("hernan.rizzuti")).thenReturn(false);
		when(mockregval.usernameIsValid(mockreq)).thenReturn(true);
		when(mockreq.getParameter("password")).thenReturn("Hernan123");
		when(mockreq.getParameter("confirmPassword")).thenReturn("Hernan123");
		when(mockuserval.isPasswordValid("Hernan123")).thenReturn(true);
		when(mockuserval.doPasswordsMatch("Hernan123", "Hernan123")).thenReturn(true);
		when(mockregval.passwordIsValid(mockreq)).thenReturn(true);
		when(mockreq.getParameter("firstName")).thenReturn("Hernan");
		when(mockreq.getParameter("lastName")).thenReturn("Rizzuti");
		when(mockuserval.isFullNameValid("Hernan Rizzuti")).thenReturn(true);
		when(mockregval.fullnameisValid(mockreq)).thenReturn(true);
		when(mockreq.getParameter("email")).thenReturn("hernanrizzuti@gmail.com");
		when(mockuserval.isEmailValid("hernanrizzuti@gmail.com")).thenReturn(true);
		when(mockregval.emailIsValid(mockreq)).thenReturn(true);
		assertTrue(regval.userDetailsAreValid(mockreq));
	}
	
	@Test
	public void testuserDetailsAreValidReturnsFalseWhenAllUserDetailsAreValid() throws SQLException {
		when(mockreq.getParameter("username")).thenReturn("hernan.rizzuti");
		when(mockuserval.isUsernameValid("hernan.rizzuti")).thenReturn(false);
		when(mockuserval.usernameExist("hernan.rizzuti")).thenReturn(false);
		when(mockregval.usernameIsValid(mockreq)).thenReturn(false);
		when(mockreq.getParameter("password")).thenReturn("Hernan123");
		when(mockreq.getParameter("confirmPassword")).thenReturn("Hernan123");
		when(mockuserval.isPasswordValid("Hernan123")).thenReturn(true);
		when(mockuserval.doPasswordsMatch("Hernan123", "Hernan123")).thenReturn(true);
		when(mockregval.passwordIsValid(mockreq)).thenReturn(true);
		when(mockreq.getParameter("firstName")).thenReturn("Hernan");
		when(mockreq.getParameter("lastName")).thenReturn("Rizzuti");
		when(mockuserval.isFullNameValid("Hernan Rizzuti")).thenReturn(true);
		when(mockregval.fullnameisValid(mockreq)).thenReturn(true);
		when(mockreq.getParameter("email")).thenReturn("hernanrizzuti@gmail.com");
		when(mockuserval.isEmailValid("hernanrizzuti@gmail.com")).thenReturn(true);
		when(mockregval.emailIsValid(mockreq)).thenReturn(true);
		assertFalse(regval.userDetailsAreValid(mockreq));
	}
}
