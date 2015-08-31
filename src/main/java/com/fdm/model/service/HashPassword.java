package com.fdm.model.service;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.xml.bind.DatatypeConverter;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class HashPassword {

	/**
	 * Encrypt a string
	 * @param password	String to encrypt
	 * @return			Encrypted string
	 * @throws NoSuchAlgorithmException
	 */

	@Pointcut("execution(* com.fdm.model.User.setPassword(..)) && args (password)")
	public void setPassword(String password){
	}

	@Around("setPassword(password)")
	public String encrypt(ProceedingJoinPoint joinpoint, String password) throws Throwable{
		byte buf[] = password.getBytes();
		byte[] input;
		MessageDigest algorithm = MessageDigest.getInstance("MD5");
		algorithm.reset();
		algorithm.update(buf);
		input = algorithm.digest();
		password = byteToBase64(input);
		joinpoint.proceed(new Object[] {password});
		return password;
	}

	public String byteToBase64(byte[] data){
		return DatatypeConverter.printBase64Binary(data);
	}
}