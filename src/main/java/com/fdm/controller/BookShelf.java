package com.fdm.controller;

import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fdm.model.dbstorage.BookDAO;
import com.fdm.model.service.JsonBuilderController;

@Controller
@Scope("session")
public class BookShelf {
	@Resource(name="bookdao")
	private BookDAO bookDAO;
	private int countTitleCopies = 0;


	@RequestMapping(value="/bookshelf.html", method = RequestMethod.GET)
	public String getBookShelf(HttpServletRequest req) throws SQLException{
		if(req.getSession().getAttribute("countTitleCopies") != null){
			countTitleCopies = (Integer) req.getSession().getAttribute("countTitleCopies") ;			
		}
		
		/* int count is used as a flag to check if the assembler
		 * and getbookStock has been called.
		 * If they were called then count will be incremented 
		 * therefore it won't be called twice when you go to 
		 * the home page unless count was reset to zero
		 * again. This only happens when a new book is added.
		 */
		while(countTitleCopies == 0){
			req.getSession().setAttribute("titleCopies", bookDAO.getTitleAndCopies());
			countTitleCopies++;
		}
		req.getSession().setAttribute("countTitleCopies", countTitleCopies);
		return "books";
	}
}