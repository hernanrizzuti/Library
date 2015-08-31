package com.fdm.model.storage;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.fdm.model.Item;

public class BasketStorageTest {
	@Mock private Item mockitem;
	private Item item, item2;
	@Mock private Map<String,Integer> mockitemmap;
	private Map<String,Integer> realmap;
	private BasketStorage basketstorage;

	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
		basketstorage = new BasketStorage();
		basketstorage.setItemMap(mockitemmap);
	}

	@Test
	public void testAddItemcallsPutMethodFromMap() {
		when(mockitemmap.containsKey("fictions")).thenReturn(false);
		when(mockitem.getName()).thenReturn("fictions");
		when(mockitem.getQuantity()).thenReturn(1);
		basketstorage.addItem(mockitem);
		verify(mockitemmap).put("fictions", 1);
	}

	@Test
	public void testAddItemaincreasesthevalueto2whenAnItemAlreadyExist() {
		when(mockitemmap.containsKey("fictions")).thenReturn(true);
		when(mockitem.getName()).thenReturn("fictions");
		when(mockitemmap.get("fictions")).thenReturn(1);
		when(mockitem.getQuantity()).thenReturn(1);
		basketstorage.addItem(mockitem);
		verify(mockitemmap).put("fictions", 2);
	}
	
	@Test
	public void testAddItemapCallsgetNameFrom() {
		when(mockitemmap.containsKey("fictions")).thenReturn(true);
		when(mockitem.getName()).thenReturn("fictions");
		when(mockitemmap.get("fictions")).thenReturn(1);
		when(mockitem.getQuantity()).thenReturn(1);
		basketstorage.addItem(mockitem);
		verify(mockitem, times(2)).getName();
	}

	@Test
	public void testAddItemapcallsContainsKeyMethodFromMap() {
		when(mockitem.getName()).thenReturn("fictions");
		when(mockitem.getQuantity()).thenReturn(1);
		basketstorage.addItem(mockitem);
		verify(mockitemmap).containsKey("fictions");
	}
	
	@Test
	public void testCountItemsReturn3asQuantityWhen1ItemHasBeenAdded(){
		realmap = new HashMap<String, Integer>();
		basketstorage.setItemMap(realmap);
		item = new Item();
		item.setQuantity(3);
		basketstorage.addItem(item);
		assertEquals(3,basketstorage.count());
	}
	
	@Test
	public void testCountItemsReturn4asQuantityWhen2ItemshasBeenAdded(){
		realmap = new HashMap<String, Integer>();
		basketstorage.setItemMap(realmap);
		item = new Item();
		item.setName("Head First Java");
		item.setQuantity(3);
		basketstorage.addItem(item);
		item2 = new Item();
		item2.setName("Spring in Action 3rd Edit");
		item2.setQuantity(1);
		basketstorage.addItem(item2);
		assertEquals(4, basketstorage.count());
	}
	
	@Test
	public void testgetItemMapReturnNotnull(){
		realmap = new HashMap<String, Integer>();
		basketstorage.setItemMap(realmap);
		item = new Item();
		item.setQuantity(3);
		basketstorage.addItem(item);
		assertNotNull(basketstorage.getItemMap());
	}
	
	@Test
	public void testUpdateItemCallsPutMethodFromMap(){
		when(mockitemmap.containsKey("Fictions")).thenReturn(true);
		basketstorage.updateItem("Fictions", 2);
		verify(mockitemmap).put("Fictions", 2);
	}
	
	@Test
	public void testUpdateItemNeverCallsPutMethodFromMap(){
		when(mockitemmap.containsKey("Fictions")).thenReturn(false);
		basketstorage.updateItem("Fictions", 2);
		verify(mockitemmap,never()).put("Fictions", 2);
	}
	
	@Test
	public void testRemoveItemCallsRemoveMethodFromMap(){
		when(mockitemmap.containsKey("Fictions")).thenReturn(true);
		basketstorage.removeItem("Fictions");
		verify(mockitemmap).remove("Fictions");
	}
	
	@Test
	public void testRemoveItemNeverCallsRemoveMethodFromMap(){
		when(mockitemmap.containsKey("Fictions")).thenReturn(false);
		basketstorage.removeItem("Fictions");
		verify(mockitemmap,never()).remove("Fictions");
	}

}
