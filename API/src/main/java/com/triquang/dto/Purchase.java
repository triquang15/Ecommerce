package com.triquang.dto;

import java.util.Set;

import com.triquang.entity.Address;
import com.triquang.entity.Customer;
import com.triquang.entity.Order;
import com.triquang.entity.OrderItem;

import lombok.Data;

@Data
public class Purchase {
	
	private Customer customer;
	private Address shippingAddress;
	private Address billingAddress;
	private Order order;
	private Set<OrderItem> orderItems;
}
