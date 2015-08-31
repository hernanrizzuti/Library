package com.fdm.model;

import java.util.Map;
import java.util.TreeMap;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service
public class BookStorage implements Storage<ExtBook>{

	private Map<String, ExtBook> map;
	private Map<String, Integer> bookcopiesmap;

	@Override
	@Resource(name="hashmap")
	public void setMap(Map<String, ExtBook> map) {
		this.map = map;
	}

	@Resource(name = "bookcopiesmap")
	public void setBookcopiesmap(Map<String, Integer> bookcopiesmap) {
		this.bookcopiesmap = bookcopiesmap;
	}

	@Override
	public void add(ExtBook book) {
		ExtBook existingbook = get(book.getTitle());
		if(existingbook != null){
			bookcopiesmap.put(existingbook.getTitle(),bookcopiesmap.get(book.getTitle())+1);
		}else{
			map.put(book.getTitle(),book);
			bookcopiesmap.put(book.getTitle(), 1);
		}
	}

	@Override
	public ExtBook get(String title) {
		return map.get(title);
	}

	@Override
	public void remove(String title) {
		map.remove(title);
	}

	@Override
	public int getSize() {
		return map.size();
	}

	@Override
	public Map<String, ExtBook> getMap() {
		return map;
	}

	@Override
	public Map<ExtBook, Integer> getAll() {
		Map<ExtBook, Integer> books = getTreeMap();
		for(Map.Entry<String, Integer> entry : bookcopiesmap.entrySet()){
			books.put(get(entry.getKey()), entry.getValue());
		}
		return books;
	}

	public Map<ExtBook, Integer> getTreeMap() {
		return new TreeMap<ExtBook, Integer>();
	}
}