package com.fdm.model.service;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Map;
import java.util.Map.Entry;
import javax.annotation.Resource;
import com.fdm.model.Basket;
import com.fdm.model.dbstorage.BookDAO;

public class BasketCalculator {

	@Resource(name="bookdao")
	private BookDAO bookdao;
	@Resource(name="booknameAndPrice")	
	private Map<String, BigDecimal> booknameAndPrice;

	public void setBooknameAndPrice(Map<String, BigDecimal> booknameAndPrice) {
		this.booknameAndPrice = booknameAndPrice;
	}

	public void setBookdao(BookDAO bookdao) {
		this.bookdao = bookdao;
	}

	public BigDecimal evaluate(int quantity, BigDecimal price) {
		BigDecimal result =  price.multiply(new BigDecimal(quantity));
		return result;
	}

	public BigDecimal calculateBasket(Map<String, Integer> basket) throws SQLException {
		BigDecimal result = BigDecimal.ZERO;
		BigDecimal price;
		String title;
		for(Entry<String, Integer> entry :basket.entrySet()){
			title= entry.getKey();
			price = bookdao.getBookPrice(title);
			result = result.add(evaluate(entry.getValue(), price));
			//this stores book details for checkOutController
			booknameAndPrice.put(title, price);
		}
		return result;
	}

	public Basket basketFactory(Map<String, BigDecimal> price, Map<String, Integer> quantity,
			BigDecimal priceTotal, int itemTotal){
		return new Basket(price, quantity, priceTotal, itemTotal);
	}

}