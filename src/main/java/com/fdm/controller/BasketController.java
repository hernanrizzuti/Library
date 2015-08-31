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
import com.fdm.model.ExtBook;
import com.fdm.model.Item;
import com.fdm.model.service.BasketCalculator;
import com.fdm.model.storage.BasketStorage;

@Controller
@Scope("session")
public class BasketController {
	@Resource(name="basketCalculator")
	private BasketCalculator basketCalculator;

	@Resource(name="basketStorage")
	private BasketStorage basketStorage;

	@Resource(name="booknameAndPrice")
	private Map<String, BigDecimal> booknameAndPrice;

	@RequestMapping(value= "/addtobasket.html", method = RequestMethod.POST)
	public String addToBasket(Item item, HttpSession session) {
		ExtBook book = (ExtBook) session.getAttribute("book");
		item.setPrice(book.getPrice());
		basketStorage.addItem(item);
		session.setAttribute("baskettotal", basketStorage.count());
		session.removeAttribute("book");
		return "redirect:"+item.getName()+"-details.html";
	}

	@RequestMapping(value="/viewbasket.html", method= RequestMethod.GET)
	public String viewItemsInBasket( HttpServletRequest req) throws SQLException{
		Map<String, BigDecimal> price = booknameAndPrice;
		Map<String, Integer> quantityPerItem = basketStorage.getItemMap();
		BigDecimal priceTotal = basketCalculator.calculateBasket(basketStorage.getItemMap());
		int itemTotal = basketStorage.count();
		req.getSession().setAttribute("itemsInBasket", quantityPerItem);
		req.setAttribute("baskettotalprice", priceTotal);
		Basket basket = basketCalculator.basketFactory(price, quantityPerItem, 
				priceTotal,itemTotal);
		req.getSession().setAttribute("basket",basket);
		return "basket";
	}

	@RequestMapping(value="/updateItem.html", method= RequestMethod.POST)
	public String updateItemInBasket(HttpServletRequest req){
		HttpSession session = req.getSession(false);
		String itemName = req.getParameter("item");
		int itemQuantity = Integer.parseInt(req.getParameter("quantity"));
		String name = req.getParameter("submit");
		if(name.equals("Remove")){
			basketStorage.removeItem(itemName);
		}else{
			basketStorage.updateItem(itemName, itemQuantity);
		}
		session.setAttribute("baskettotal", basketStorage.count());
		return "redirect: viewbasket.html";
	}

	@RequestMapping(value="/clearItems.html", method= RequestMethod.GET)
	public String clearBasket(HttpSession session) {
		Map<String, Integer> map = basketStorage.getItemMap();
		map.clear();
		session.setAttribute("baskettotal", basketStorage.count());
		return "basket";
	}
}