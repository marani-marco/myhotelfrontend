package com.marco.myhotelfrontend.models;

import java.util.ArrayList;
import java.util.List;

public class CustomersListBinding {
	
	private List<Customer> customersList;
	
	public CustomersListBinding(){
		
		this.customersList = new ArrayList<Customer>();		
	}

	public List<Customer> getCustomersList() {
		return customersList;
	}

	public void setCustomersList(List<Customer> customersList) {
		this.customersList = customersList;
	}
	
}
