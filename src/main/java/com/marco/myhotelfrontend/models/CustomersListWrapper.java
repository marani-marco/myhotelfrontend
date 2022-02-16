package com.marco.myhotelfrontend.models;

import java.util.ArrayList;
import java.util.List;

public class CustomersListWrapper {

	List<Customer> customers;
	
	public CustomersListWrapper(){
		this.customers = new ArrayList<Customer>();
	}

	public List<Customer> getCustomers() {
		return customers;
	}

	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}
	
	public void addCustomer(Customer customer){
		this.customers.add(customer);
	}
	
	
}
