package com.fdm.model.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import com.fdm.model.ExtBook;
import com.fdm.model.SQLtoJSON;
import com.fdm.model.dbstorage.BookDAO;

public class JsonBuilderController {

	private BookDAO bookdao;
	private SQLtoJSON sqltojson;


	@Resource(name="bookdao")
	public void setBookDAO(BookDAO bookdao) {
		this.bookdao = bookdao;
	}
	
	@Resource(name="sqltojson")
	public void setSqltojson(SQLtoJSON sqltojson) {
		this.sqltojson = sqltojson;
	}

	public String assembler() {
		List<ExtBook> ls = null;
		try {
			ls = bookdao.getAllBooks();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String json = sqltojson.jsonConvertor(ls);
		return json;
	}
}