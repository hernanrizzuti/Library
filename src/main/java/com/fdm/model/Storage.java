package com.fdm.model;

import java.util.Map;

public interface Storage<T> {
	void add(T t);
	T get(String title);
	Map<ExtBook, Integer> getAll();
	int getSize();
	Map<String, T> getMap();
	void remove(String title);
	void setMap(Map<String, ExtBook> map);
	void setBookcopiesmap(Map<String, Integer> map);
}