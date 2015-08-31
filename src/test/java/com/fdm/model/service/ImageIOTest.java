package com.fdm.model.service;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.web.multipart.MultipartFile;

public class ImageIOTest {

	@Mock private MultipartFile mockMultipartFile;
	@Mock private File mockFile, mockFile2;
	@Mock private BufferedOutputStream mockbufferedOutputStream;
	@Spy private ImageIO spyImageIO;

	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}

	@Test
	public void testbookImagewriterCallsWriteAndCloseFromBufferedWriter() throws IOException {
		String title = "pilgrim";
		byte[] fileBArray = new byte[0];
		when(mockMultipartFile.getBytes()).thenReturn(fileBArray);
		doReturn(mockFile).when(spyImageIO).dirGenerator();
		doReturn(mockFile2).when(spyImageIO).fileGenerator(mockFile, mockMultipartFile, title);
		doReturn(mockbufferedOutputStream).when(spyImageIO).getBufferedOutputStream(mockFile2);
		spyImageIO.bookImagewriter(mockMultipartFile, title);
		verify(mockbufferedOutputStream).write(fileBArray);
		verify(mockbufferedOutputStream).close();
	}
	
	@Test
	public void testIsFileExtensionValidReturnTrueWhenExtIsValid() throws FileNotFoundException {
		ImageIO imageIO = new ImageIO();
		String fileName = "test.jpg";
		byte[] content = "Hello Word".getBytes();
		MockMultipartFile mockMultipartFile =   new MockMultipartFile("content", fileName, "text/plain", content);
		assertTrue(imageIO.isFileExtensionValid(mockMultipartFile));
		String fileName2 = "test.txt";
		MockMultipartFile mockMultipartFile2 =  new MockMultipartFile("content", fileName2, "text/plain", content);
		assertFalse(imageIO.isFileExtensionValid(mockMultipartFile2));
	}
	
	@Test
	public void testfileNameGeneratorReturnNameOfFile() throws FileNotFoundException {
		ImageIO imageIO = new ImageIO();
		String fileName = "test.jpg";
		byte[] content = "Hello Word".getBytes();
		MockMultipartFile mockMultipartFile =   new MockMultipartFile("content", fileName, "text/plain", content);
		assertEquals("kravmaga.jpg",imageIO.fileNameGenerator(mockMultipartFile, "Krav      maga"));
	}

}