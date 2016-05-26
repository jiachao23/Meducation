package com.meducation.ORM;

import java.util.List;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class ScoresRecord {

	private List<User> items;

	public List<User> getItems() {
		return items;
	}

	public void setItems(List<User> items) {
		this.items = items;
	}
}
