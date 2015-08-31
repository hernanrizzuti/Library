package com.fdm.model.dbstorage;

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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.sql.DataSource;

public class BasketDAO {

	private DataSource datasource;
	private Connection conn;
	private PreparedStatement ps;
	private CallableStatement cs;

	@Resource(name="dataSource")
	public void setDataSource(DataSource datasource) {
		this.datasource = datasource;
	}

	public void addShoppingCart(String username, Map<String, Integer> map) throws SQLException, IOException{
		ObjectOutput oos = null;
		InputStream is = null;
		ByteArrayOutputStream baos = null;
		try {
			conn = datasource.getConnection();
			String className = map.getClass().getName();
			baos = getByteArrayOutputStream();
			oos = getObjectOutput(baos);
			oos.writeObject(map);
			byte[] mapAsBytes = baos.toByteArray();
			is = getByteArrayInputStream(mapAsBytes);
			cs = conn.prepareCall("{call ADD_BASKET(?,?,?)}");
			cs.setString(1, username);
			cs.setString(2, className);
			cs.setBinaryStream(3, is, mapAsBytes.length);
			cs.executeUpdate();
			baos.close();
			oos.close();
		}finally{
			if(cs!=null)cs.close();
			if(conn!=null)conn.close();
		}	
	}

	public Map<String, Integer> getShoppingCart(String username) throws SQLException, IOException, ClassNotFoundException{
		HashMap<String, Integer> map = null;
		InputStream is = null;
		ObjectInput ois = null;
		try {
			conn = datasource.getConnection();
			ps = conn.prepareStatement("SELECT basket FROM shopping_cart WHERE username = ?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				byte[] st = (byte[]) rs.getObject(1);
				is = getByteArrayInputStream(st);
				ois = getObjectInput(is);
				map = (HashMap<String, Integer>) ois.readObject();
				ois.close();
				is.close();
			}
		}finally{
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}
		return map;
	}

	//delete shopping cart from the database
	public int deleteShoppingCart(String username) throws SQLException {
		int row =0;
		try {
			conn = datasource.getConnection();
			ps = conn.prepareStatement("DELETE FROM shopping_cart WHERE username = ?");
			ps.setString(1, username);
			row = ps.executeUpdate();		
		}finally{
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}
		return row;
	}

	public ByteArrayOutputStream getByteArrayOutputStream() throws IOException {
		return new ByteArrayOutputStream();
	}

	public InputStream getByteArrayInputStream(byte[] mapAsBytes) throws IOException {
		return new ByteArrayInputStream(mapAsBytes);
	}

	public ObjectOutput getObjectOutput(OutputStream baos) throws IOException {
		return new ObjectOutputStream(baos);
	}

	public ObjectInput getObjectInput(InputStream is) throws IOException {
		return new ObjectInputStream(is);
	}
}
//http://www.java2s.com/Code/Java/Database-SQL-JDBC/Storeandretrieveanobjectfromatable.htm
