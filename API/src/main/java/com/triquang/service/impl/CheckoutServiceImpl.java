package com.triquang.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import com.triquang.dao.CustomerRepository;
import com.triquang.dto.PaymentInfo;
import com.triquang.dto.Purchase;
import com.triquang.dto.PurchaseResponse;
import com.triquang.entity.Customer;
import com.triquang.entity.Order;
import com.triquang.entity.OrderItem;
import com.triquang.service.CheckoutService;

@Service
public class CheckoutServiceImpl implements CheckoutService {

	private CustomerRepository customerRepository;

	public CheckoutServiceImpl(CustomerRepository customerRepository,
			@Value("${stripe.key.secrect}") String secrectKey) {
		this.customerRepository = customerRepository;

		Stripe.apiKey = secrectKey;
	}

	@Override
	@Transactional
	public PurchaseResponse placeOrder(Purchase purchase) {
		// Retrieve the order info from dto
		Order order = purchase.getOrder();

		// Generate tracking number
		String orderTrackingNumber = generateOrderTrackingNumber();
		order.setOrderTrackingNumber(orderTrackingNumber);

		// Populate order with orderItems
		Set<OrderItem> orderItems = purchase.getOrderItems();
		orderItems.forEach(item -> order.add(item));

		// Populate order with billingAddress and shippingAddress
		order.setBillingAddress(purchase.getBillingAddress());
		order.setShippingAddress(purchase.getShippingAddress());

		// Populate customer with order
		Customer customer = purchase.getCustomer();
		String theEmail = customer.getEmail();
		Customer customerInDB = customerRepository.findByEmail(theEmail);

		if (customerInDB != null) {
			customer = customerInDB;
		}

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

	@Override
	public PaymentIntent createPaymentIntent(PaymentInfo paymentInfo) throws StripeException {

		List<String> paymentMethodTypes = new ArrayList<>();
		paymentMethodTypes.add("card");

		Map<String, Object> params = new HashMap<>();
		params.put("amount", paymentInfo.getAmount());
		params.put("currency", paymentInfo.getCurrency());
		params.put("payment_method_types", paymentMethodTypes);
		params.put("description", "eCommerce Shop");
		params.put("receipt_email", paymentInfo.getReceiptEmail());

		return PaymentIntent.create(params);
	}

}
