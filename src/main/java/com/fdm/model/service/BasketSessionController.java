package com.fdm.model.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.fdm.controller.LogoutController;
import com.fdm.model.dbstorage.BasketDAO;
import com.fdm.model.storage.BasketStorage;

public class BasketSessionController {

	@Resource(name="basketStorage")
	private BasketStorage basketStorage;
	@Resource(name="basketdao")
	private BasketDAO basketdao;

	Logger log = Logger.getLogger(LogoutController.class);

	public void persistBasket(HttpSession session){
		String username = (String) session.getAttribute("usersession");
		try {
			Map<String, Integer> map = basketStorage.getItemMap();
			if(map.size()!=0){
				basketdao.deleteShoppingCart(username);
				basketdao.addShoppingCart(username, map);
			}else if(map.size() == 0 && (basketdao.getShoppingCart(username) != null)){
				basketdao.deleteShoppingCart(username);
			}
			map.clear();//map is emptied to be use by another user
		} catch (SQLException e) {
			log.warn("Problem occured while trying to write object to the DB.");
			e.printStackTrace();
		} catch (IOException e) {
			log.warn("Problem occured while trying to serialize file.");
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void setBasketsession(HttpSession session, String username){
		if(session.getAttribute("baskettotal")==null){
			Map<String, Integer> map;
			try {
				map = basketdao.getShoppingCart(username);
				if(map!=null)
					if(map.size()!=0){
						basketStorage.setItemMap(map);
						session.setAttribute("baskettotal", basketStorage.count());
					}
			} catch (SQLException e) {
				log.warn("Problem occured while trying to read object from DB.");
				e.printStackTrace();
			} catch (IOException e) {
				log.warn("Problem occured while trying to deserialize file.");
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void deleteBasket(HttpSession session){
		String username = (String) session.getAttribute("usersession");
		try {
			basketdao.deleteShoppingCart(username);
		} catch (SQLException e) {
			log.warn("Problem occured while trying to remove basket from the DB.");
			e.printStackTrace();
		}
	}
}
