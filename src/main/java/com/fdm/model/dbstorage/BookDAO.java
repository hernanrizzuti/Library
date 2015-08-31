package com.fdm.model.dbstorage;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.sql.DataSource;
import com.fdm.model.Columns;
import com.fdm.model.ExtBook;

/**
 * @author hernan.rizzuti
 * BookDAO is responsible for persisting information, regarding books, to the Database
 * This includes adding, removing, updating and getting back values from the Database
 */

public class BookDAO {

	private DataSource datasource;
	private Connection conn;
	private PreparedStatement ps;
	private CallableStatement cs;

	public BookDAO() {	
	}

	@Resource(name="dataSource")
	public void setDataSource(DataSource datasource) {
		this.datasource = datasource;
	}

	/**
	 * @param book is going to be added to the database 
	 * @throws SQLException 
	 */
	public void addBook(ExtBook book) throws SQLException{
		try {
			conn = datasource.getConnection();
			ps = conn.prepareStatement("{call ADD_BOOK(?,?,?,?,?,?,?,?,?,?,?)}");
			ps.setString(1,book.getISBN());
			ps.setString(2, book.getTitle());
			ps.setString(3, book.getAuthor());
			ps.setString(4, book.getAbout());
			ps.setString(5, book.getPublisher());
			ps.setBigDecimal(6, book.getPrice());
			ps.setInt(7, book.getPages());
			ps.setString(8, book.getCategory());
			ps.setString(9, book.getDate());
			ps.setInt(10, book.getCopies());
			ps.setString(11, book.getImagepath());
			ps.executeUpdate();
		}finally{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
		}
	}
	
	public List<String> get(String query) throws SQLException{
		List<String> ls = null; //this list could be a list of authors, categories or publishers
		try {
			conn = datasource.getConnection();
			ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			ls = getList();
			while(rs.next()){	
				ls.add(rs.getString("name"));
			}
		}finally{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
		}
		return ls;
	}

	public int getBookStock() throws SQLException{
		int booksCount = 0;
		try {
			conn = datasource.getConnection();
			cs = conn.prepareCall("{call GET_BOOK_STOCK()}");
			
			ResultSet rs = cs.executeQuery();
			if(rs.next())
				booksCount = rs.getInt("copies");
		}finally{
				if(cs!=null)cs.close();
				if(conn!=null)conn.close();
		}
		return booksCount;
	}

	public List<String> resultFactory(Columns column) throws SQLException{
		List<String> ls = null;
		switch (column) {
		case AUTHOR:  		ls = get("SELECT name FROM authors");
		break;

		case CATEGORIES:    ls = get("SELECT name FROM categories");
		break;

		case PUBLISHER:   	ls = get("SELECT name FROM publishers");
		break;
		}
		return ls;
	}

	public Map<String, Integer> getTitleAndCopies() throws SQLException{
		Map<String, Integer> map = null;
		try {
			conn = datasource.getConnection();
			cs = conn.prepareCall("{call GET_BOOK_STOCK_BY_TITLE_COPY()}");
			
			ResultSet rs = cs.executeQuery();
			map = getHashMap();
			while(rs.next())
				map.put(rs.getString("title"), rs.getInt("book_copies_num"));
		}finally{
				if(cs!=null)cs.close();
				if(conn!=null)conn.close();
		}
		return map;
	}

	public List<ExtBook> getAllBooks() throws SQLException{
		List<ExtBook> ls = null;
		ExtBook book = null;
		try {
			conn = datasource.getConnection();
			cs = conn.prepareCall("{call GET_BOOKS()}");
			
			ResultSet rs = cs.executeQuery();
			ls = getList();
			while(rs.next()){
				book = new ExtBook();
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
				ls.add(book);
			}
		}finally{
				if(cs!=null) cs.close();
				if(conn!=null) conn.close();
		}
		return ls;
	}
	
	
	public BigDecimal getBookPrice(String title) throws SQLException {
		BigDecimal price = null;
		try {
			conn = datasource.getConnection();
			ps = conn.prepareStatement("SELECT price FROM books WHERE title = ?");
			ps.setString(1, title);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				price = rs.getBigDecimal("price");
				if(rs.wasNull()){
					price = null;
				}
			}
		}finally{
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}
		return price;
	}

	public Map<String, Integer> getHashMap() {
		return new HashMap<String, Integer>();
	}

	public <E> List<E> getList(){
		return new ArrayList<E>();
	}
}