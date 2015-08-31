package com.fdm.model.dbstorage;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.annotation.Resource;
import javax.sql.DataSource;
import com.fdm.model.ExtBook;

public class LibrarySearchDAO {

	private List<ExtBook> ls = null;
	private DataSource datasource;
	private Connection conn;
	private CallableStatement cs;

	@Resource(name="dataSource")
	public void setDataSource(DataSource datasource) {
		this.datasource = datasource;
	}

	@Resource(name="arraylist")
	public void setLs(List<ExtBook> ls) {
		this.ls = ls;
	}

	public List<ExtBook> bookSearch(String criteria) throws SQLException{
		ExtBook book = null;
		try {
			conn = datasource.getConnection();
			cs = conn.prepareCall("{call BOOK_SEARCH(?)}");
			cs.setString(1, criteria);
			ResultSet rs = cs.executeQuery();
			while(rs.next()){
				book = bookFactory();
				book.setISBN(rs.getString("isbn"));
				book.setTitle(rs.getString("title"));
				book.setAuthor(rs.getString("author"));
				ls.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
				if(cs!=null) cs.close();
				if(conn!=null) conn.close();
			
		}
		return ls;
	}

	public ExtBook bookFactory() {
		return new ExtBook();
	}
	
	public void clean(){
		ls.clear();
	}

	public ExtBook getBook(String criteria) throws SQLException{
		ExtBook book = null;
		try {
			conn = datasource.getConnection();
			cs = conn.prepareCall("{call GET_BOOK(?)}");
			cs.setString(1, criteria);
			ResultSet rs = cs.executeQuery();
			if(rs.next()){
				book = bookFactory();
				book.setISBN(rs.getString("isbn"));
				book.setTitle(rs.getString("title"));
				book.setAuthor(rs.getString("author"));
				book.setAbout(rs.getString("about"));
				book.setCategory(rs.getString("category"));
				book.setPrice(rs.getBigDecimal("price"));
				book.setCopies(rs.getInt("copies"));
				book.setPages(rs.getInt("pages"));
				book.setPublisher(rs.getString("publisher"));
				book.setImagepath(rs.getString("imagepath"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
				if(cs!=null) cs.close();
				if(conn!=null) conn.close();
		}
		return book;
	}

}