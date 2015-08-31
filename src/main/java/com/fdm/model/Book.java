/*package com.fdm.model;

import org.hibernate.validator.constraints.NotEmpty;

public class Book implements Comparable<Book>{

	@NotEmpty private String title;
	private String author;
	@NotEmpty private String ISBN;

	public Book(String title, String author, String iSBN) {
		this.title = title;
		this.author = author;
		this.ISBN = iSBN;
	}

	public Book() {
	}

	public String getTitle() {
		return title;
	}

	public String getAuthor() {
		return author;
	}

	public String getISBN() {
		return ISBN;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	@Override
	public int compareTo(Book o) {
		if(!this.title.equals(o.getTitle())){
			return this.title.compareTo(o.getTitle());
		}else if(!this.title.equals(o.getTitle())){
			return this.title.compareTo(o.getTitle());
		}else {
			return this.title.compareTo(o.getTitle());
		}

	}
}*/