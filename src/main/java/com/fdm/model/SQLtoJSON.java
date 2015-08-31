package com.fdm.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 
 * @author hernan.rizzuti
 *
 *an object that converts an SQL resultSets to a JSON String
 */

public class SQLtoJSON {
	
	private List<String> authors;
	
	public SQLtoJSON() {
		authors = new ArrayList<String>();
	}
	/**
	 * 
	 * @param sqlbookls sqlbookls represents the list that is passed in 
	 * containing the SQL resultSet in order to convert it into a JSON 
	 * format
	 * @return A String containing a JSON format
	 */
	
	public String jsonConvertor(List<ExtBook> sqlbookls) {
		
		String json = null;
			for (ExtBook book : sqlbookls){
				if(sqlbookls.get(0).equals(book)){
					json = "["+getJsonString(book)+",";
				} else if(!((sqlbookls.indexOf(book)) == sqlbookls.size()-1)){
					json = json +getJsonString(book)+",";
				}else{
					json = json + getJsonString(book)+"];";
				}
			}
		return json;
		}
	
	public String getJsonString(ExtBook book){
		String jsonstr = null;
		String author = book.getAuthor();
		if(authors.contains(author)){
			jsonstr = "{\"label\" : \""+book.getTitle()+"\"}";
		}else{
			jsonstr = "{\"label\" : \""+book.getTitle()+"\"}"
							+",{\"label\" : \""+author+"\"}";
		}
		authors.add(author);
		return jsonstr;
	}
}