package com.fdm.controller;

import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fdm.model.Basket;
import com.fdm.model.dbstorage.BasketDAO;

@Controller
@Scope("session")
public class PaymentController {

	@Resource(name="basketdao")
	private BasketDAO basketdao;

	@RequestMapping(value="/payment.html", method= RequestMethod.GET)
	public String payment(HttpServletRequest req) throws SQLException{
		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("usersession");
		Basket basket = (Basket) session.getAttribute("basket");
		basketdao.deleteShoppingCart(username);
		session.removeAttribute("baskettotal");
		String paymentConfirmation = "Thank you for shopping at eBooks, "+username+". You will email confirmation shortly, which will tell you when the order will be dispatched";
		req.setAttribute("paymentConfirmation",  paymentConfirmation);
		return "home";
	}

}
