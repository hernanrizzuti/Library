package com.fdm.controller;

import java.math.BigDecimal;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fdm.model.Basket;
import com.fdm.model.storage.BasketStorage;

@Controller
@Scope("session")
public class CheckOutController {
	
	@RequestMapping(value="/checkout.html",method=RequestMethod.GET)
	public String getCheckoutSummary(HttpServletRequest req){
		Basket basket = (Basket) req.getSession().getAttribute("basket");
		req.setAttribute("price",basket.getPrice());
		req.setAttribute("bookQuantity", basket.getQuantity());
		req.setAttribute("ItemTotal", basket.getItemTotal());
		req.setAttribute("priceTotal", basket.getPriceTotal());
		return "checkoutsum";
	}
}
