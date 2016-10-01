package com.fdm.model.dbstorage;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.annotation.Resource;
import javax.sql.DataSource;
import com.fdm.model.User;

public class UserDAO {

	private DataSource datasource;
	private Connection conn;
	private CallableStatement cs;
	private PreparedStatement ps;

	@Resource(name="dataSource")
	public void setDataSource(DataSource datasource) {
		this.datasource = datasource;
	}

	public void addUser(User user) throws SQLException{
		try {
			conn = datasource.getConnection();
			cs = conn.prepareCall("{call ADD_LIBUSER(?,?,?,?,?,?,?,?)}");
			cs.setString(1, user.getUsername());
			cs.setString(2, user.getPassword());
			cs.setInt(3, user.getTitle_id());
			cs.setString(4, user.getFirstName());
			cs.setString(5, user.getLastName());
			cs.setString(6, user.getEmail());
			cs.setInt(7, user.getEnabled());
			cs.setString(8, user.getAuthority());
			cs.executeUpdate();
		}finally{
			if(cs!=null)cs.close();
			if(conn!=null)conn.close();
		}
	}

	public String getRole(String username) throws SQLException {
		String existingUsername= null;
		try {
			conn = datasource.getConnection();
			ps = conn.prepareStatement("SELECT authority FROM libuser_roles WHERE username=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				existingUsername = rs.getString("authority");
			}
		}finally{
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}
		return existingUsername;
	}

	public User getUser(String username) throws SQLException{
		conn = datasource.getConnection();
		cs = conn.prepareCall("{call GET_LIBUSER(?)}");
		cs.setString(1, username);
		ResultSet rs = cs.executeQuery();
		User user = null;
		try{
			if (rs.next()){
				user = new User();
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setTitle(rs.getString("title"));
				user.setFirstName(rs.getString("firstname"));
				user.setLastName(rs.getString("lastname"));
				user.setEmail(rs.getString("email"));
			}
		}finally {
			if(cs!=null)cs.close();
			if (conn!=null)conn.close();
		}
		return user;
	}
}
