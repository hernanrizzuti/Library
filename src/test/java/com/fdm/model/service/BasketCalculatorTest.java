package com.fdm.model.service;

import static org.junit.Assert.*;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import static org.mockito.Mockito.*;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.fdm.model.dbstorage.BookDAO;

public class BasketCalculatorTest {
	
	private Map<String, Integer> map;
	@Mock private BookDAO mockdao;
	@Mock private Map<String, BigDecimal> booknameAndPrice;
	private BasketCalculator basketcal;
	
	@Before
	public void setUp(){
		MockitoAnnotations.initMocks(this);
		map = new HashMap<String, Integer>();
		map.put("Fictions", 2);
		basketcal = new BasketCalculator();
		basketcal.setBookdao(mockdao);
		basketcal.setBooknameAndPrice(booknameAndPrice);
	}

	@Test
	public void testEvaluateReturns150WhenOnlyOneBookCopyIspassedIn() {
		assertEquals(new BigDecimal(1.50),basketcal.evaluate(1, new BigDecimal(1.50)));
	}

	@Test
	public void testEvaluateReturns200WhenOnlyOneBookCopyIspassedIn() {
		assertEquals(new BigDecimal(2.00),basketcal.evaluate(1, new BigDecimal(2.00)));
	}

	@Test
	public void testEvaluateReturns800WhenTwoBookCopiesIspassedIn() {
		assertEquals(new BigDecimal(8.00),basketcal.evaluate(2, new BigDecimal(4.00)));
	}

	@Test
	public void testCalculateBasketReturns700WhenAMapIspassedIn() throws SQLException {
		when(mockdao.getBookPrice("Fictions")).thenReturn(new BigDecimal("3.50"));
		assertEquals(new BigDecimal("7.00"), basketcal.calculateBasket(map));
	}
	
	@Test
	public void testCalculateBasketReturns1400WhenAMapIspassedIn() throws SQLException {
		map.put("I am Pilgrim", 2);
		when(mockdao.getBookPrice(anyString())).thenReturn(new BigDecimal("3.50")).thenReturn(new BigDecimal("3.50"));
		assertEquals(new BigDecimal("14.00"),basketcal.calculateBasket(map));
	}
}
