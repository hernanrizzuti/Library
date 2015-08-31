package com.fdm.model.storage;

import java.util.Map;

import com.fdm.model.Item;

public class BasketStorage {
	
	private Map<String, Integer> itemMap;

	public void setItemMap(Map<String, Integer> itemmap) {
		this.itemMap = itemmap;
	}

	public void addItem(Item item) {
		String itemname = null;
		if(itemMap.containsKey(item.getName())){
			itemname = item.getName();
			itemMap.put(itemname, itemMap.get(itemname) + item.getQuantity());
		}else{
			itemMap.put(item.getName(), item.getQuantity());
		}
	}

	public int count() {
		int count = 0;
		for (Map.Entry<String, Integer> entry : itemMap.entrySet()){
			count = count + entry.getValue();
		}
		return count;
	}

	public Map<String, Integer> getItemMap() {
		return itemMap;
	}

	public void updateItem(String itemName,int itemNumber) {
		if(itemMap.containsKey(itemName)){
			itemMap.put(itemName, itemNumber);
		}
	}

	public void removeItem(String itemName) {
		if(itemMap.containsKey(itemName)){
			 itemMap.remove(itemName);
		}
	}
	
	

}
