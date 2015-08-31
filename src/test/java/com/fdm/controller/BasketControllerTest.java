package com.fdm.controller;

import static org.mockito.Mockito.*;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;
import org.springframework.ui.ModelMap;

import com.fdm.model.ExtBook;
import com.fdm.model.Item;
import com.fdm.model.service.BasketCalculator;
import com.fdm.model.storage.BasketStorage;

public class BasketControllerTest {
	
	@Mock private BasketStorage mockbasketStorage;
	@Mock private ModelMap mockmodelMap;
	@Mock private Map<String, Integer> mockMap;
	@Mock private HttpServletRequest mockreq;
	@Mock private HttpSession mocksession;
	@Mock private Item mockitem;
	@Mock private ExtBook mockbook;
	@Mock private BasketCalculator basketCalculator;
	@InjectMocks 
	@Spy private BasketController basketController;
	
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}

	@Test
	public void testAddToBasketcallsBookGetPrice() {
		when(mockreq.getSession()).thenReturn(mocksession);
		when(mocksession.getAttribute("book")).thenReturn(mockbook);
		basketController.addToBasket(mockitem, mocksession);
		verify(mockbook).getPrice();
	}
	
	@Test
	public void testAddToBasketcallsbasketStorageAddItem() {
		when(mockreq.getSession()).thenReturn(mocksession);
		when(mocksession.getAttribute("book")).thenReturn(mockbook);
		basketController.addToBasket(mockitem, mocksession);
		verify(mockbasketStorage).addItem(mockitem);
	}
	
	@Test
	public void testAddToBasketcallsbasketStorageCount() {
		when(mockreq.getSession()).thenReturn(mocksession);
		when(mocksession.getAttribute("book")).thenReturn(mockbook);
		basketController.addToBasket(mockitem, mocksession);
		verify(mockbasketStorage).count();
	}
	
	@Test
	public void testAddToBasketcallsSessionRemoveAttribute() {
		when(mockreq.getSession()).thenReturn(mocksession);
		when(mocksession.getAttribute("book")).thenReturn(mockbook);
		basketController.addToBasket(mockitem, mocksession);
		verify(mocksession).removeAttribute("book");
	}
	
	@Test
	public void testViewItemsInBasketCallsSessionSetAttribute() throws SQLException{
		when(mockbasketStorage.getItemMap()).thenReturn(mockMap);
		when(mockreq.getSession()).thenReturn(mocksession);
		basketController.viewItemsInBasket(mockreq);
		verify(mocksession).setAttribute("itemsInBasket", mockMap);
	}
	
	@Test
	public void testUpdateItemInBasketCallsRemoveItem(){
		when(mockreq.getSession(false)).thenReturn(mocksession);
		when(mockreq.getParameter("item")).thenReturn("Fictions");
		when(mockreq.getParameter("quantity")).thenReturn("2");
		when(mockreq.getParameter("submit")).thenReturn("Remove");
		when(mockbasketStorage.count()).thenReturn(5);
		basketController.updateItemInBasket(mockreq);
		verify(mockbasketStorage).removeItem("Fictions");
		verify(mocksession).setAttribute(anyString(), anyInt());
	}
	
	@Test
	public void testUpdateItemInBasketCallsUpdateItem(){
		when(mockreq.getSession(false)).thenReturn(mocksession);
		when(mockreq.getParameter("item")).thenReturn("Fictions");
		when(mockreq.getParameter("quantity")).thenReturn("2");
		when(mockreq.getParameter("submit")).thenReturn("Update");
		when(mockbasketStorage.count()).thenReturn(5);
		basketController.updateItemInBasket(mockreq);
		verify(mockbasketStorage).updateItem("Fictions", 2);
		verify(mocksession).setAttribute(anyString(), anyInt());
	}
	
	@Test
	public void testClearBasketCallsclearFromHashMap(){
		when(mockbasketStorage.getItemMap()).thenReturn(mockMap);
		basketController.clearBasket(mocksession);
		verify(mockMap).clear();;
	}
}