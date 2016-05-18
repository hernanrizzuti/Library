package com.fdm.controller;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fdm.model.Basket;
import com.fdm.model.dbstorage.BasketDAO;
import com.fdm.model.storage.BasketStorage;

@Controller
@Scope("session")
public class PaymentController {

	@Resource(name="basketdao")
	private BasketDAO basketdao;
	
	@Resource(name="basketStorage")
	private BasketStorage basketStorage;

	@Resource(name="booknameAndPrice")
	private Map<String, BigDecimal> booknameAndPrice;

	@RequestMapping(value="/paymentapproved.html", method= RequestMethod.GET)
	public String paymentApproved(HttpServletRequest req) throws SQLException{
		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("usersession");
		//Basket basket = (Basket) session.getAttribute("basket");
		basketdao.deleteShoppingCart(username);
		session.removeAttribute("baskettotal");
		session.removeAttribute("itemsInBasket");
		session.removeAttribute("basket");
		basketStorage.getItemMap().clear();
		booknameAndPrice.clear();
		String paymentConfirmation = "Thank you for shopping at eBooks, "+username+". You will email confirmation shortly, which will tell you when the order will be dispatched";
		req.setAttribute("paymentConfirmation",  paymentConfirmation);
		return "home";
	}
	
	@RequestMapping(value="/paymentmethods.html", method= RequestMethod.GET)
	public String paymentMethods(HttpServletRequest req) throws SQLException{
		Basket basket = (Basket) req.getSession().getAttribute("basket");
		req.setAttribute("price",basket.getPrice());
		req.setAttribute("bookQuantity", basket.getQuantity());
		req.setAttribute("ItemTotal", basket.getItemTotal());
		req.setAttribute("priceTotal", basket.getPriceTotal());
		
		return "paymentmethods";
	}

}
