package com.fdm.controller;

import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fdm.model.ExtBook;
import com.fdm.model.Item;
import com.fdm.model.dbstorage.LibrarySearchDAO;

@Controller
@Scope("session")
public class BookDetails {
	@Resource(name="librarySearchDAO")
	private LibrarySearchDAO lsdao;

	private ExtBook book;

	@RequestMapping(value= "/{criteria}-details.html", method = RequestMethod.GET)
	public String getBookName(@PathVariable String criteria, ModelMap model, HttpServletRequest req) {
		try {
			book = lsdao.getBook(criteria);
			req.getSession().setAttribute("book", book);
			Item item = new Item();
			model.addAttribute("item", item);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "bookdetails";
	}
}
