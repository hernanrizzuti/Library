package com.fdm.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fdm.model.service.BasketSessionController;

@Controller
@Scope("session")
public class LogoutController {
	
	@Resource(name="basketSessionController")
	private BasketSessionController basketSessionController;

	@RequestMapping(value="/logout.html", method=RequestMethod.GET)
	public String logout(HttpServletRequest req){
		HttpSession session = req.getSession(false);
		basketSessionController.persistBasket(session);
		int count = 0;
		SecurityContextHolder.clearContext();
		if (session != null) {
			session.invalidate();
		}
		req.getSession().setAttribute("count", count);
		req.getSession().setAttribute("countTitleCopies", count);
		return "index";
	}
}