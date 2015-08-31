package com.fdm.model;

import java.math.BigDecimal;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class ExtBook implements Comparable<ExtBook>{
	@NotEmpty private String title;
	private String author;
	@NotEmpty private String ISBN;
	@NotEmpty private String about;
	private String publisher;
	@NotNull private BigDecimal price;
	@NotNull private Integer pages;
	private String category;
	@NotEmpty private String date;
	@NotNull private Integer copies;
	private String imagepath;
	
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
	
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public Integer getPages() {
		return pages;
	}
	public void setPages(Integer pages) {
		this.pages = pages;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Integer getCopies() {
		return copies;
	}
	public void setCopies(Integer copies) {
		this.copies = copies;
	}
	public String getImagepath() {
		return imagepath;
	}
	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
	@Override
	public int compareTo(ExtBook o) {
		if(!this.title.equals(o.getTitle())){
			return this.title.compareTo(o.getTitle());
		}else if(!this.title.equals(o.getTitle())){
			return this.title.compareTo(o.getTitle());
		}else {
			return this.title.compareTo(o.getTitle());
		}

	}
}