package com.fdm.model.service;

/* USE ONLY FOR SPRING AOP DEMO*/

import static org.junit.Assert.*;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import org.aspectj.lang.ProceedingJoinPoint;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

public class HashPasswordTest {
	String password;
	HashPassword hp;
	String encrypt;
	@Mock ProceedingJoinPoint mockjoinpoint;
	
	@Before
	public void setup() throws IOException{
		MockitoAnnotations.initMocks(this);
		hp = new HashPassword();
		password = "hernan";
	}

	
	@Test
	public void checkEncryptedPasswordDoNotMatchInputPassword() throws Throwable{
		encrypt = hp.encrypt(mockjoinpoint, password);
		assertEquals(encrypt,hp.encrypt(mockjoinpoint, password));
	}
	
	@Test
	public void checkTwoEncryptedPasswordDoNotMatchWhenTwoDifferentPasswordsAreEncrypted() throws Throwable{
		String password2 = "herna";
		assertNotEquals(hp.encrypt(mockjoinpoint, password), hp.encrypt(mockjoinpoint, password2));
	}

}
