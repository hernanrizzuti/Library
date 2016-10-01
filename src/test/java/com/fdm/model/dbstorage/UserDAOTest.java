package com.fdm.model.dbstorage;

import static org.mockito.Mockito.*;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;
import org.mockito.exceptions.verification.NeverWantedButInvoked;

import com.fdm.model.User;

public class UserDAOTest {
	
	@Mock private DataSource mockds;
	@Mock private Connection mockconn;
	@Mock private CallableStatement mockcs;
	@Mock private PreparedStatement mockps;
	@Mock private ResultSet mockrs;
	@Mock private User mockuser;
	@Spy private UserDAO spyuserdao;

	@Before
	public void setUp() throws SQLException {
		MockitoAnnotations.initMocks(this);
		spyuserdao.setDataSource(mockds);
		when(mockds.getConnection()).thenReturn(mockconn);
	}

	@Test
	public void testaddUserMethodCallsTheRequiredMethodsForExecutingStoredProcedures() throws SQLException {
		when(mockconn.prepareCall("{call ADD_LIBUSER(?,?,?,?,?,?,?,?)}")).thenReturn(mockcs);
		spyuserdao.addUser(mockuser);
		verify(mockcs).executeUpdate();
	}
	
	@Test
	public void testaddUserMethodCallsTheRequiredMethodsForClosingTheCallableStatement() throws SQLException {
		when(mockconn.prepareCall("{call ADD_LIBUSER(?,?,?,?,?,?,?,?)}")).thenReturn(mockcs);
		spyuserdao.addUser(mockuser);
		verify(mockcs).close();
	}
	
	@Test
	public void testaddUserMethodCallsTheRequiredMethodsForClosingTheConnection() throws SQLException {
		when(mockconn.prepareCall("{call ADD_LIBUSER(?,?,?,?,?,?,?,?)}")).thenReturn(mockcs);
		spyuserdao.addUser(mockuser);
		verify(mockconn).close();
	}
	
	@Test
	public void testgetUsernameMethodCallsExecuteQuery() throws SQLException {
		when(mockconn.prepareStatement("SELECT authority FROM libuser_roles WHERE username=?")).thenReturn(mockps);
		when(mockps.executeQuery()).thenReturn(mockrs);
		spyuserdao.getRole("hernan");
		verify(mockps).executeQuery();
	}
	
	@Test
	public void testgetUsernameMethodCallsTheNextMethod() throws SQLException {
		when(mockconn.prepareStatement("SELECT authority FROM libuser_roles WHERE username=?")).thenReturn(mockps);
		when(mockps.executeQuery()).thenReturn(mockrs);
		spyuserdao.getRole("hernan");
		verify(mockrs).next();
	}
	
	@Test
	public void testgetUsernameMethodNeverCallsTheGetStringMethod() throws SQLException {
		when(mockconn.prepareStatement("SELECT authority FROM libuser_roles WHERE username=?")).thenReturn(mockps);
		when(mockps.executeQuery()).thenReturn(mockrs);
		when(mockrs.next()).thenReturn(false);
		spyuserdao.getRole("hernan");
		verify(mockrs, never()).getString("username");
	}
	
	@Test
	public void testgetUsernameMethodCallsTheGetStringMethod() throws SQLException {
		when(mockconn.prepareStatement("SELECT authority FROM libuser_roles WHERE username=?")).thenReturn(mockps);
		when(mockps.executeQuery()).thenReturn(mockrs);
		when(mockrs.next()).thenReturn(true).thenReturn(false);
		spyuserdao.getRole("hernan");
		verify(mockrs).getString("authority");
	}
	
	@Test
	public void testgetUserReturnsUserCallsExecuteQuery() throws SQLException{
		when(mockconn.prepareCall("{call GET_LIBUSER(?)}")).thenReturn(mockcs);
		when(mockcs.executeQuery()).thenReturn(mockrs);
		when(mockrs.next()).thenReturn(true);
		spyuserdao.getUser("username");
		verify(mockcs).executeQuery();
	}
	
	@Test
	public void testgetUserReturnsUserWhenAnExistingUsernameIsPassedIn() throws SQLException{
		when(mockconn.prepareCall("{call GET_LIBUSER(?)}")).thenReturn(mockcs);
		when(mockcs.executeQuery()).thenReturn(mockrs);
		when(mockrs.next()).thenReturn(false);
		spyuserdao.getUser("username");
		verify(mockrs, never()).getString("username");
	}
}
