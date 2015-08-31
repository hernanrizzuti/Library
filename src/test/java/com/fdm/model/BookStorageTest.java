package com.fdm.model;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

public class BookStorageTest {
	@Mock ExtBook mockbook, mockbookfromstorage;
	@Mock Map<String,ExtBook> mockmap;
	@Mock Map<String,Integer> mockbookcopymap;
	BookStorage bs;

	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
		bs = new BookStorage();;
		bs.setMap(mockmap);
		bs.setBookcopiesmap(mockbookcopymap);
	}

	@Test
	public void testAddVerifiesThatPutMethodFromMapWasCalled() {
		when(mockbook.getTitle()).thenReturn("bookTitle");
		when(bs.get(mockbook.getTitle())).thenReturn(null);
		bs.add(mockbook);
		verify(mockmap).put("bookTitle",mockbook);
	}

	@Test
	public void testAddVerifiesThatPutMethodFromBookcopymapWasCalled() {
		when(mockbook.getTitle()).thenReturn("bookTitle");
		when(bs.get(mockbook.getTitle())).thenReturn(null);
		bs.add(mockbook);
		verify(mockbookcopymap).put("bookTitle",1);
	}

	@Test
	public void testAddVerifiesThatPutMethodFromMapAndBookcopymapWasNeverCalledCalled() {
		when(mockbook.getTitle()).thenReturn("bookTitle");
		when(bs.get(mockbook.getTitle())).thenReturn(mockbookfromstorage);
		when(mockbookcopymap.get(mockbook.getTitle())).thenReturn(2);
		bs.add(mockbook);
		verify(mockmap, never()).put("bookTitle",mockbook);
	}

	@Test
	public void testGetVerifiesThatGetMethodFromArrayListWasCalled() {
		bs.get("bookTitle");
		verify(mockmap).get("bookTitle");
	}

	@Test
	public void tesGetSizeVerifiesThatSizeMethodFromArrayListWasCalled() {
		bs.getSize();
		verify(mockmap).size();
	}
	@Test
	public void testRemoveVerifiesThatremoveMethodFromArrayListWasCalled() {
		bs.remove("bookTitle");
		verify(mockmap).remove("bookTitle");
	}

	@Test
	public void testGetAllReturnstwoBooksWhentwoBooksAreStored(){
		bs.setMap(new HashMap<String, ExtBook>());
		bs.setBookcopiesmap(new HashMap<String, Integer>());
		ExtBook hf = new ExtBook();
		hf.setTitle("Head First");
		hf.setAuthor("Jeremy Robert");
		hf.setISBN("123");
		ExtBook sa = new ExtBook();
		sa.setTitle("Spring In Action");
		sa.setAuthor("Lucy jones");
		sa.setISBN("13423");
		bs.add(hf);
		bs.add(sa);
		assertEquals(2, bs.getAll().size());
	}

	@Test
	public void testGetAllReturnsthreeBooksWhentwoBooksAreStored(){
		bs.setMap(new HashMap<String, ExtBook>());
		bs.setBookcopiesmap(new HashMap<String, Integer>());
		ExtBook hf = new ExtBook();
		hf.setTitle("Head First");
		hf.setAuthor("Jeremy Robert");
		hf.setISBN("123");
		ExtBook hf1 = new ExtBook();
		hf1.setTitle("Head First");
		hf1.setAuthor("Jeremy Robert");
		hf1.setISBN("123");
		ExtBook sa = new ExtBook();
		sa.setTitle("Spring In Action");
		sa.setAuthor("Lucy jones");
		sa.setISBN("13423");
		bs.add(hf);
		bs.add(hf1);
		bs.add(sa);
		assertEquals(new Integer(2),bs.getAll().get(hf1));
		assertEquals(new Integer(1),bs.getAll().get(sa));
		assertEquals(2, bs.getAll().size());
	}
}