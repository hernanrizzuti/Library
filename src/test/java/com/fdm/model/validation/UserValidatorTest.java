package com.fdm.model.validation;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;

import static org.mockito.Mockito.*;

import com.fdm.model.User;
import com.fdm.model.dbstorage.UserDAO;

public class UserValidatorTest {

	@Mock private User mockuser;
	@Mock UserDAO mockuserdao;
	@InjectMocks
	@Spy
	private UserValidator val;

	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}

	@Test
	public void testisPasswordValidREeurnsTrueWhenPasswordContains6CharachersACapitalLetterAndASymbol() {
		assertTrue(val.isPasswordValid("Wr0dxe!2@"));
	}

	@Test
	public void testisPasswordValidReturnsFalseWhenPasswordDoesNotContainsASymbol() {
		assertFalse(val.isPasswordValid("mkyong1A"));
	}

	@Test
	public void testisPasswordValidReturnsFalseWhenPasswordDoesNotContainsACapitalLetter() {
		assertFalse(val.isPasswordValid("mkyong1a@"));
	}

	@Test
	public void testisPasswordValidReturnsFalseWhenPasswordDoesNotContains6Charachers() {
		assertFalse(val.isPasswordValid("mkyona"));
	}

	@Test
	public void testisPasswordValidReturnsTrueWhenPasswordContains5Letters_2Cap_2Letters_2NumbersAndASymbol() {
		assertTrue(val.isPasswordValid("mkYOn12$"));
	}

	@Test
	public void testDoPasswordMatchReturnsTrueWhenPasswordsDoNotMatch() {
		assertFalse(val.doPasswordsMatch("mkYOn12$", "mkyonA@"));
	}

	@Test
	public void testDoPasswordMatchReturnsTrueWhenBothPasswordsMatch() {
		assertTrue(val.doPasswordsMatch("mkYOn12$", "mkYOn12$"));
	}

	@Test
	public void testisUsernameValidReturnsTrueWhenUsernameContains3To15CharachersWithALowerCaseAndFewNumber() {
		assertTrue(val.isUsernameValid("hernan_2002"));
	}
	@Test
	public void testisUsernameValidReturnsTrueWhenUsernameContains3To15CharachersWithLowerCasesNumbersAndNoSymbol() {
		assertTrue(val.isUsernameValid("hernan2002"));
	}

	@Test
	public void testisUsernameValidReturnsTrueWhenUsernameContains3To15CharachersWithJustLowerCases() {
		assertTrue(val.isUsernameValid("hernan.rizzuti"));
	}

	@Test
	public void testisUsernameValidReturnsTrueWhenUsernameContains3CharachersWithJustNumbers() {
		assertTrue(val.isUsernameValid("200"));
	}

	@Test
	public void testisUsernameValidReturnsTrueWhenUsernameContains17CharachersWithJustNumbers() {
		assertFalse(val.isUsernameValid("an0rn200he200rizzuti"));
	}

	@Test
	public void testisUsernameValidReturnsTrueWhenUsernameContains15CharachersWithJustletterAndOneCapitalLetter() {
		assertFalse(val.isUsernameValid("Anrnhe200rizzuti"));
	}

	@Test
	public void testisFullNameValidReturnsTrueWhenUsernameContains3CharachersWithJustLetter() {
		assertTrue(val.isFullNameValid("Peter Muller"));
	}
	@Test
	public void testisFullNameValidReturnsTrueWhenFullnameContainsCharachersWithJustLetter() {
		assertTrue(val.isFullNameValid("Peter Muller"));
	}

	@Test
	public void testisFullNameValidReturnsTrueWhenFullnameContainsDoubleSurnameCharachers() {
		assertTrue(val.isFullNameValid("Silvana Koch-Mehrin"));
	}

	@Test
	public void testisFullNameValidReturnsFalseWhenFullnameContainsDoubleSurnameCharachersAndABadSymbol() {
		assertFalse(val.isFullNameValid("Silvana Koch-Mehrin&"));
	}

	@Test
	public void testisEmailValidReturnsTrueWhenEmailisValid() {
		String[] goodEmails = { "mkyong@yahoo.com",
				"mkyong-100@yahoo.com", "mkyong.100@yahoo.com",
				"mkyong111@mkyong.com", "mkyong-100@mkyong.net",
				"mkyong.100@mkyong.com.au", "mkyong@1.com",
				"mkyong@gmail.com.com", "mkyong+100@gmail.com",
				"mkyong-100@yahoo-test.com" };
		for (String temp : goodEmails) {
			assertTrue(val.isEmailValid(temp));
		}
	}

	@Test
	public void testisEmailValidReturnsFalseWhenEmailisInValid() {
		String[] badEmails = { "mkyong", "mkyong@.com.my",
				"mkyong123@gmail.a", "mkyong123@.com", "mkyong123@.com.com",
				".mkyong@mkyong.com", "mkyong()*@gmail.com", "mkyong@%*.com",
				"mkyong..2002@gmail.com", "mkyong.@gmail.com",
				"mkyong@mkyong@gmail.com", "mkyong@gmail.com.1a" };
		for (String temp : badEmails) {
			assertFalse(val.isEmailValid(temp));
		}
	}
	
	@Test
	public void testUserExistReturnsTrueWhenTheUserAlreadyExist() throws SQLException{
		when(mockuserdao.getRole("hernan")).thenReturn("hernan");
		assertTrue(val.usernameExist("hernan"));
	}
	
	@Test
	public void testUserExistReturnsFalseWhenTheUserDoesNotExist() throws SQLException{
		when(mockuserdao.getRole("hernan")).thenReturn(null);
		assertFalse(val.usernameExist("hernan"));
	}
	
}