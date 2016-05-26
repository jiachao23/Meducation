package com.meducation.ORM;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class SelectedItems {

	private String planID;
	private String[] items;

	public String[] getItems() {
		return items;
	}

	public void setItems(String[] items) {
		this.items = items;
	}

	public String getPlanID() {
		return planID;
	}

	public void setPlanID(String planID) {
		this.planID = planID;
	}
}
