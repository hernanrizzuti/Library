package com.fdm.model.service;

import static org.mockito.Mockito.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.fdm.model.dbstorage.BasketDAO;
import com.fdm.model.storage.BasketStorage;

public class BasketSessionControllerTest {

	@Mock private BasketStorage mockbasketStorage;
	@Mock private BasketDAO mockbasketdao;
	@Mock private HttpServletRequest mockreq;
	@Mock private HttpSession mocksession;
	@Mock private Map<String, Integer> mockmap;
	@InjectMocks private BasketSessionController basketSessionController;

	@Before
	public void setUp(){
		MockitoAnnotations.initMocks(this);
		when(mocksession.getAttribute("usersession")).thenReturn("hernan");
		when(mockbasketStorage.getItemMap()).thenReturn(mockmap);
	}

	@Test
	public void testPersistBasketCallsAddShoppingCartWhenmapSizeIsGreaterThan0() throws SQLException, IOException {
		when(mockmap.size()).thenReturn(1);
		basketSessionController.persistBasket(mocksession);
		verify(mockbasketdao).addShoppingCart("hernan", mockmap);
	}
	
	@Test
	public void testPersistBasketNeverCallsAddShoppingCartWhenmapSizeIs0() throws SQLException, IOException {
		when(mockmap.size()).thenReturn(0);
		basketSessionController.persistBasket(mocksession);
		verify(mockbasketdao, never()).addShoppingCart("hernan", mockmap);
	}
	
	@Test
	public void testPersistBasketNeverCallsAddShoppingCartWhenAnSQLEXceptionIsThrown() throws SQLException, IOException {
		when(mockmap.size()).thenReturn(1);
		doThrow(new SQLException()).when(mockbasketdao).addShoppingCart("hernan", mockmap);
		basketSessionController.persistBasket(mocksession);
	}
	
	@Test
	public void testPersistBasketNeverCallsAddShoppingCartWhenAnIOExceptionIsThrown() throws SQLException, IOException {
		when(mockmap.size()).thenReturn(1);
		doThrow(new IOException()).when(mockbasketdao).addShoppingCart("hernan", mockmap);
		basketSessionController.persistBasket(mocksession);
	}
	
	@Test
	public void testsetPersistBasketCallsDeleteShoppingCart() throws SQLException, IOException, ClassNotFoundException {
		when(mockmap.size()).thenReturn(0);
		when(mockbasketdao.getShoppingCart("hernan")).thenReturn(mockmap);
		basketSessionController.persistBasket(mocksession);;
		verify(mockbasketdao).deleteShoppingCart("hernan");
	}
	
	@Test
	public void testsetPersistBasketNeverCallsDeleteShoppingCartCallsWhenAnClassNotFoundExceptionIsThrown() throws SQLException, IOException, ClassNotFoundException {
		when(mockmap.size()).thenReturn(0);
		doThrow(new ClassNotFoundException()).when(mockbasketdao).getShoppingCart("hernan");
		basketSessionController.persistBasket(mocksession);;
		verify(mockbasketdao, never()).deleteShoppingCart("hernan");
	}
	@Test
	public void testsetPersistBasketNeverCallsDeleteShoppingCartWhenMapIs0AndGetShoppingisNull() throws SQLException, IOException, ClassNotFoundException {
		when(mockmap.size()).thenReturn(0);
		when(mockbasketdao.getShoppingCart("hernan")).thenReturn(null);
		basketSessionController.persistBasket(mocksession);;
		verify(mockbasketdao, never()).deleteShoppingCart("hernan");
	}
	
	@Test
	public void testsetBasketsessionCallsGetShoppingCart() throws SQLException, IOException, ClassNotFoundException {
		String username = "Hernan";
		when(mocksession.getAttribute("baskettotal")).thenReturn(null);
		basketSessionController.setBasketsession(mocksession,username);
		verify(mockbasketdao).getShoppingCart(username);
	}
	
	@Test
	public void testsetBasketsessionNeverCallsGetShoppingCart() throws SQLException, IOException, ClassNotFoundException {
		String username = "Hernan";
		when(mocksession.getAttribute("baskettotal")).thenReturn(2);
		basketSessionController.setBasketsession(mocksession,username);
		verify(mockbasketdao, never()).getShoppingCart(username);
	}
	
	@Test
	public void testsetBasketsessionCallssetMapFromBasketStorage() throws SQLException, IOException, ClassNotFoundException {
		String username = "Hernan";
		when(mocksession.getAttribute("baskettotal")).thenReturn(null);
		when(mockmap.size()).thenReturn(2);
		when(mockbasketdao.getShoppingCart(username)).thenReturn(mockmap);
		basketSessionController.setBasketsession(mocksession,username);
		verify(mockbasketStorage).setItemMap(mockmap);
	}
	
	@Test
	public void testsetBasketsessionNeverCallssetMapFromBasketStorage() throws SQLException, IOException, ClassNotFoundException {
		String username = "Hernan";
		when(mocksession.getAttribute("baskettotal")).thenReturn(null);
		when(mockmap.put("fictions", 0)).thenReturn(0);
		when(mockmap.size()).thenReturn(0);
		
		when(mockbasketdao.getShoppingCart(username)).thenReturn(mockmap);
		basketSessionController.setBasketsession(mocksession,username);
		verify(mockbasketStorage, never()).setItemMap(mockmap);
	}
	
	@Test
	public void testsetBasketsessionNeverCallssizeCartWhenAnSQLEXceptionIsThrown() throws SQLException, IOException, ClassNotFoundException {
		doThrow(new SQLException()).when(mockbasketdao).getShoppingCart("hernan");
		basketSessionController.setBasketsession(mocksession,"hernan");
		verify(mockmap, never()).size();
	}
	
	@Test
	public void testsetBasketsessionNeverCallssetItemMapCartWhenAnIOExceptionIsThrown() throws SQLException, IOException, ClassNotFoundException {
		doThrow(new IOException()).when(mockbasketdao).getShoppingCart("hernan");
		basketSessionController.setBasketsession(mocksession,"hernan");
		verify(mockbasketStorage, never()).setItemMap(mockmap);
	}
	
	@Test
	public void testsetBasketsessionNeverCallssetItemMapCartWhenAnClassNotFoundExceptionIsThrown() throws SQLException, IOException, ClassNotFoundException {
		doThrow(new ClassNotFoundException()).when(mockbasketdao).getShoppingCart("hernan");
		basketSessionController.setBasketsession(mocksession,"hernan");
		verify(mockbasketStorage, never()).setItemMap(mockmap);
	}
	
	@Test
	public void testDeleteBasketCalls() throws SQLException {
		basketSessionController.deleteBasket(mocksession);
		verify(mockbasketdao).deleteShoppingCart("hernan");
	}
	
	@Test
	public void testDeleteBasketThrowsAnSQLException() throws SQLException {
		when(mockbasketdao.deleteShoppingCart("hernan")).thenThrow(new SQLException());
		basketSessionController.deleteBasket(mocksession);
	}
}