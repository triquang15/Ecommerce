package com.triquang.service.impl;

import java.util.Set;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.triquang.dao.CustomerRepository;
import com.triquang.dto.Purchase;
import com.triquang.dto.PurchaseResponse;
import com.triquang.entity.Customer;
import com.triquang.entity.Order;
import com.triquang.entity.OrderItem;
import com.triquang.service.CheckoutService;

@Service
public class CheckoutServiceImpl implements CheckoutService {
	
	@Autowired
	private CustomerRepository customerRepository;

	@Override
	@Transactional
	public PurchaseResponse placeOrder(Purchase purchase) {
		// Retrieve the order info from dto
		Order order = purchase.getOrder();
		
		// Generate tracking number
		String orderTrackingNumber = generateOrderTrackingNumber();
		order.setOrderTrackingNumber(orderTrackingNumber);
		
		// Populate  order with orderItems
		Set<OrderItem> orderItems = purchase.getOrderItems();
		orderItems.forEach(item -> order.add(item));
		
		// Populate order with billingAddress and shippingAddress
		order.setBillingAddress(purchase.getBillingAddress());
		order.setShippingAddress(purchase.getShippingAddress());
		
		// Populate customer with order
		Customer customer = purchase.getCustomer();
		customer.add(order);
		
		// Save to the database
		customerRepository.save(customer);
		
		// Return a response	
		
		return new PurchaseResponse(orderTrackingNumber);
	}

	private String generateOrderTrackingNumber() {
		// Generate a random UUID number
		
		return UUID.randomUUID().toString();
	}

}
