package com.triquang.service;

import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import com.triquang.dto.PaymentInfo;
import com.triquang.dto.Purchase;
import com.triquang.dto.PurchaseResponse;

public interface CheckoutService {
	PurchaseResponse placeOrder(Purchase purchase);

	PaymentIntent createPaymentIntent(PaymentInfo paymentInfo) throws StripeException;
}
