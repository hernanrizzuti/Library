package com.fdm.controller;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fdm.model.ExtBook;
import com.fdm.model.dbstorage.LibrarySearchDAO;

@Controller
@Scope("session")
public class BookSearch {
	@Resource(name="librarySearchDAO")
	private LibrarySearchDAO lsdao;

	@RequestMapping(value="/searchBook.html", method = RequestMethod.POST)
	public String searchBox(HttpServletRequest req) {
		String criteria = getCriteria(req);
		if(!criteria.equals("")){
			List<ExtBook> list = null;
			lsdao.clean();
			try {
				list = lsdao.bookSearch(criteria);
				if(list.size() == 1)
					return "redirect:"+list.get(0).getTitle()+"-details.html";
				req.setAttribute("result", list);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return "home";
		}
		return "home";
	}

	public String getCriteria(HttpServletRequest req) {
		return req.getParameter("criteria");
	}

}