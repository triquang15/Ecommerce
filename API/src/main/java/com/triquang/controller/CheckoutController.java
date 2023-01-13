package com.triquang.controller;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import com.triquang.dto.PaymentInfo;
import com.triquang.dto.Purchase;
import com.triquang.dto.PurchaseResponse;
import com.triquang.service.CheckoutService;

@RestController
@CrossOrigin("http://localhost:4200")
@RequestMapping("/api/checkout")
public class CheckoutController {
	
	private Logger logger = Logger.getLogger(getClass().getName());

	@Autowired
	private CheckoutService checkoutService;

	@PostMapping("/purchase")
	public PurchaseResponse placeOrder(@RequestBody Purchase purchase) {
		PurchaseResponse purchaseResponse = checkoutService.placeOrder(purchase);

		return purchaseResponse;
	}

	@PostMapping("/payment-intent")
	public ResponseEntity<String> createPaymentIntent(@RequestBody PaymentInfo paymentInfo) throws StripeException {
		logger.info("paymentInfo.amount: " + paymentInfo.getAmount());
		PaymentIntent intent = checkoutService.createPaymentIntent(paymentInfo);

		String paymentIntent = intent.toJson();

		return new ResponseEntity<>(paymentIntent, HttpStatus.OK);
	}
}
