package com.fdm.model.dbstorage;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInput;
import java.io.ObjectInputStream;
import java.io.ObjectOutput;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;

import com.fdm.model.ExtBook;


public class BasketDAOTest {
	@Spy private BasketDAO basketdao;
	@Mock private ExtBook mockbook;
	@Mock private DataSource mockds;
	@Mock private Connection mockconn;
	@Mock private CallableStatement mockcs;
	@Mock private Map<String, Integer> mockmap;
	//@Mock private Blob mockblob;
	private ByteArrayOutputStream baos;
	private ByteArrayInputStream bais;
	@Mock private OutputStream mockos;
	@Mock private ObjectOutput mockoo;
	@Mock private InputStream mockis;
	@Mock private ObjectInput mockoi;
	@Mock private PreparedStatement mockps;
	@Mock private ResultSet mockrs;
	private byte[] mapAsBytes ;

	@Before
	public void setUp() throws SQLException, IOException, ClassNotFoundException {
		MockitoAnnotations.initMocks(this);
		baos = spy(new ByteArrayOutputStream());
		mapAsBytes = "hi".getBytes();
		bais = spy(new ByteArrayInputStream(mapAsBytes));
		basketdao.setDataSource(mockds);
		doReturn(baos).when(basketdao).getByteArrayOutputStream();
		doReturn(mockoo).when(basketdao).getObjectOutput(baos);
		doReturn(mapAsBytes).when(baos).toByteArray();
		when(mockds.getConnection()).thenReturn(mockconn);
		when(mockconn.prepareCall("{call ADD_BASKET(?,?,?)}")).thenReturn(mockcs);
		/*---------------------------------------*/
		when(mockconn.prepareStatement("SELECT basket FROM shopping_cart WHERE username = ?")).
		thenReturn(mockps);
		when(mockps.executeQuery()).thenReturn(mockrs);
		when(mockrs.next()).thenReturn(true);
		when(mockrs.getObject(1)).thenReturn(mapAsBytes);
		doReturn(mockis).when(basketdao).getByteArrayInputStream(mapAsBytes);
		doReturn(mockoi).when(basketdao).getObjectInput(mockis);
		when(mockconn.prepareStatement("DELETE FROM shopping_cart WHERE username = ?")).
		thenReturn(mockps);
	}

	@Test
	public void testAddShoppingCartCallsExecuteUpdate() throws SQLException, IOException{
		basketdao.addShoppingCart("Hernan", mockmap);
		verify(mockcs).executeUpdate();
	}
	@Test
	public void testAddShoppingCartCallsWriteMap() throws SQLException, IOException{
		basketdao.addShoppingCart("Hernan", mockmap);
		verify(mockoo).writeObject(mockmap);
	}

	@Test
	public void testAddShoppingCartCallsClose() throws SQLException, IOException{
		basketdao.addShoppingCart("Hernan", mockmap);
		verify(mockconn).close();
	}

	@Test
	public void testGetObjectOutputStreamIsNotNullWhenMethodIsCalled() throws SQLException, IOException{
		BasketDAO realbasketdao = new BasketDAO();
		assertNotNull(realbasketdao.getObjectOutput(mockos));
	}
	@Test
	public void testAddShoppingThrowsException() throws SQLException, IOException{
		doThrow(new SQLException()).when(basketdao).addShoppingCart("Hernan", mockmap);
		verify(mockconn, never()).commit();
	}

	@Test
	public void testGetShoppingCartCallsExecuteQuery() throws SQLException, IOException, ClassNotFoundException{
		basketdao.getShoppingCart("Hernan");
		verify(mockps).executeQuery();
	}

	@Test
	public void testGetShoppingCartCallsreadObject() throws SQLException, IOException, ClassNotFoundException{
		basketdao.getShoppingCart("Hernan");
		verify(mockoi).readObject();
	}

	@Test
	public void testGetShoppingCartCallsNext() throws SQLException, IOException, ClassNotFoundException{
		basketdao.getShoppingCart("Hernan");
		verify(mockrs).next();
	}

	@Test
	public void testGetShoppingCartNeverCallsNext() throws SQLException, IOException, ClassNotFoundException{
		when(mockrs.next()).thenReturn(false);
		basketdao.getShoppingCart("Hernan");
		verify(mockoi, never()).readObject();
	}

	@Test
	public void testDeleteShoppingCartCallsExecuteUpdate() throws SQLException, IOException{
		basketdao.deleteShoppingCart("Hernan");
		verify(mockps).executeUpdate();
	}

}